using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Scripting;
using Microsoft.EntityFrameworkCore;
using BOTFAQ.DTO;
using BOTFAQ.Models;

namespace BOTFAQ.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConversaController : ControllerBase
    {
        private readonly FAQDB001Context _context;

        // POST: api/Conversa
        [HttpPost]
        public async Task<IActionResult> PostFaqtb004Sessao([FromBody] SessaoDTO sessao)
        {
            ListaConversaDTO lsResposta = new ListaConversaDTO();
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            Faqtb004Sessao faqtb004Sessao = new Faqtb004Sessao();
            faqtb004Sessao.DhSessao = DateTime.Now;
            faqtb004Sessao.NoUsuario = sessao.noUsuario;
            faqtb004Sessao.NuDialogo = sessao.nuDialogo;

            Faqtb002Conversa inicio = _context.Faqtb002Conversa
                .Where(c => c.NuDialogo == sessao.nuDialogo
                && c.IcTipoConversa == "I")
                .Include(c => c.Faqtb003RegraNuConversaAnteriorNavigation)
                .Include(c => c.IcTipoConversaNavigation)
                .FirstOrDefault();
            Faqtb002Conversa conversa = buscaProximaConversa(inicio, faqtb004Sessao);
            MotorConversa(lsResposta, faqtb004Sessao, inicio);
            _context.Faqtb004Sessao.Add(faqtb004Sessao);
            await _context.SaveChangesAsync();


            lsResposta.nuSessao = faqtb004Sessao.NuSessao;

            return Ok(lsResposta);
        }

        private static bool ProcessaConversa(Faqtb002Conversa conversa)
        {
            List<string> lsConversasFim = new List<string>();
            lsConversasFim.Add("Q");
            lsConversasFim.Add("C");
            lsConversasFim.Add("F");
            if (lsConversasFim.Contains(conversa.IcTipoConversa))
            {
                return false;
            }
            return true;
        }

        private static void AdicionaConversaEnvio(ListaConversaDTO lsResposta, Faqtb004Sessao faqtb004Sessao, Faqtb002Conversa conversa)
        {
            if (conversa != null)
            {
                faqtb004Sessao.Faqtb006Envio.Add(new Faqtb006Envio(conversa, faqtb004Sessao.NuSessao));
                lsResposta.conversas.Add(new ConversaDTO(conversa));
            }


        }

        private Faqtb002Conversa buscaProximaConversa(Faqtb002Conversa conversa, Faqtb004Sessao faqtb004Sessao)
        {
            Faqtb002Conversa cp = null;
            conversa
                .Faqtb003RegraNuConversaAnteriorNavigation
                .ToList().ForEach(r =>
                {
                    string resultado = ProcessaRegra(conversa, faqtb004Sessao, r);
                    if (resultado == "True")
                    {
                        cp = _context.Faqtb002Conversa.Include(c => c.Faqtb003RegraNuConversaAnteriorNavigation)
                        .Include(c => c.IcTipoConversaNavigation)
                        .Include(c => c.Faqtb008Cartao)
                        .Where(a => a.NuConversa == r.NuConversaPosterior)
                        .FirstOrDefault();
                    }
                });

            return cp;
        }

        private string ProcessaRegra(Faqtb002Conversa conversa, Faqtb004Sessao faqtb004Sessao, Faqtb003Regra r)
        {
            string regra = r.DeRegra;
            if (regra.Contains("{{"))
            {
                string noVariavel = regra.Split("}}")[0].Split("{{").Last();
                Faqtb009Variavel variavel = _context.Faqtb009Variavel
                .Where(v => v.NoVariavel == noVariavel && v.NuDialogo == conversa.NuDialogo).FirstOrDefault();
                Faqtb005Resposta ultimaReposta =
                _context.Faqtb005Resposta
                .Where(re => re.NuVariavel == variavel.NuVariavel && faqtb004Sessao.NuSessao == re.NuSessao)
                .OrderByDescending(re => re.DhResposta)
                .FirstOrDefault();

                regra = regra.Replace("{{" + noVariavel + "}}", ultimaReposta.DeReposta ?? "null");

            }
            string resultado = CSharpScript.EvaluateAsync(regra).Result.ToString();
            return resultado;
        }

        public ConversaController(FAQDB001Context context)
        {
            _context = context;
        }

        // PUT: api/Conversa
        [HttpPut]
        public async Task<IActionResult> PutFaqtb004Sessao([FromBody] RespostaDTO resposta)
        {
            ListaConversaDTO lsResposta = new ListaConversaDTO();
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            Faqtb004Sessao faqtb004Sessao = _context.Faqtb004Sessao
                .Include(s => s.Faqtb006Envio)
                .Where(s => s.NuSessao == resposta.nuSessao)
                .FirstOrDefault()
                ;
            int nuUltimaConversa =
                   faqtb004Sessao
                   .Faqtb006Envio
                   .OrderByDescending(e => e.DhEnvio)
                   .FirstOrDefault().NuConversa;
            Faqtb002Conversa ultima = _context.Faqtb002Conversa
                .Include(c => c.Faqtb003RegraNuConversaAnteriorNavigation)
                .Include(c => c.IcTipoConversaNavigation)
                .Where(c => c.NuConversa == nuUltimaConversa)
                .FirstOrDefault()
                ;
            Faqtb005Resposta faqtb005Resposta = new Faqtb005Resposta(resposta.deResposta, ultima, resposta.nuSessao);

            _context.Faqtb005Resposta.Add(faqtb005Resposta);
            await _context.SaveChangesAsync();
            MotorConversa(lsResposta, faqtb004Sessao, ultima);
            await _context.SaveChangesAsync();

            lsResposta.nuSessao = faqtb004Sessao.NuSessao;
            return Ok(lsResposta);
        }

        private void MotorConversa(ListaConversaDTO lsResposta, Faqtb004Sessao faqtb004Sessao, Faqtb002Conversa conversa)
        {
            bool icContinua = true;
            faqtb004Sessao.Faqtb006Envio.Add(new Faqtb006Envio(conversa, faqtb004Sessao.NuSessao));


            while (icContinua)
            {

                conversa = buscaProximaConversa(conversa, faqtb004Sessao);
                AdicionaConversaEnvio(lsResposta, faqtb004Sessao, conversa);
                if (conversa == null)
                {
                    icContinua = false;
                }
                else
                {
                    icContinua = ProcessaConversa(conversa);
                }


            }


        }

        private bool Faqtb004SessaoExists(int id)
        {
            return _context.Faqtb004Sessao.Any(e => e.NuSessao == id);
        }
    }
}
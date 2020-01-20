using BOTFAQ.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BOTFAQ.DTO
{
    public class ConversaDTO
    {
        public ConversaDTO( Faqtb002Conversa conversa)
        {
            this.deConversa = conversa.DeConversa;
            this.noTipoConversa = conversa.IcTipoConversaNavigation.NoTipoConversa;
            this.lsCartoes = new List<CartaoDTO>();
            conversa.Faqtb008Cartao.ToList().ForEach(c =>
            {
                CartaoDTO cartao = new CartaoDTO();
                cartao.deCartao = c.DeCartao;
                cartao.vrCartao = c.VrCartao;
                lsCartoes.Add(cartao);
            });
        }
        public string deConversa { get; set; }
        public string noTipoConversa { get; set; }

        public List<CartaoDTO> lsCartoes { get; set; }
    }
}

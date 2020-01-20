using System;
using System.Collections.Generic;

namespace BOTFAQ.Models
{
    public partial class Faqtb005Resposta
    {
        public int NuReposta { get; set; }
        public int NuSessao { get; set; }
        public int NuConversa { get; set; }
        public DateTime DhResposta { get; set; }
        public string DeReposta { get; set; }
        public int NuVariavel { get; set; }

        public virtual Faqtb002Conversa NuConversaNavigation { get; set; }
        public virtual Faqtb004Sessao NuSessaoNavigation { get; set; }
        public virtual Faqtb009Variavel NuVariavelNavigation { get; set; }
        public Faqtb005Resposta()
        {

        }
        public Faqtb005Resposta(string deResposta, Faqtb002Conversa conversa, int nuSessao)
        {
            this.DeReposta = deResposta;
            this.DhResposta = DateTime.Now;
            this.NuConversa = conversa.NuConversa;
            this.NuSessao = nuSessao;
            this.NuVariavel = conversa.NuVariavel ?? default(int);
        }
    }
}

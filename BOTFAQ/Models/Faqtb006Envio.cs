using System;
using System.Collections.Generic;

namespace BOTFAQ.Models
{
    public partial class Faqtb006Envio
    {
        public int NuEnvio { get; set; }
        public int NuSessao { get; set; }
        public int NuConversa { get; set; }
        public DateTime DhEnvio { get; set; }

        public Faqtb006Envio(Faqtb002Conversa conversa, int nuSessao)
        {
            this.NuSessao = nuSessao;
            this.DhEnvio = DateTime.Now;
            this.NuConversa = conversa.NuConversa;
        }
        public Faqtb006Envio()
        {

        }
        public virtual Faqtb002Conversa NuConversaNavigation { get; set; }
        public virtual Faqtb004Sessao NuSessaoNavigation { get; set; }
    }
}

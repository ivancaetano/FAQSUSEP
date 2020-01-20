using System;
using System.Collections.Generic;

namespace BOTFAQ.Models
{
    public partial class Faqtb002Conversa
    {
        public Faqtb002Conversa()
        {
            Faqtb003RegraNuConversaAnteriorNavigation = new HashSet<Faqtb003Regra>();
            Faqtb003RegraNuConversaPosteriorNavigation = new HashSet<Faqtb003Regra>();
            Faqtb005Resposta = new HashSet<Faqtb005Resposta>();
            Faqtb006Envio = new HashSet<Faqtb006Envio>();
            Faqtb008Cartao = new HashSet<Faqtb008Cartao>();
        }

        public int NuConversa { get; set; }
        public int NuDialogo { get; set; }
        public string DeConversa { get; set; }
        public string IcTipoConversa { get; set; }
        public int? NuVariavel { get; set; }

        public virtual Faqtb007TipoConversa IcTipoConversaNavigation { get; set; }
        public virtual Faqtb001Dialogo NuDialogoNavigation { get; set; }
        public virtual Faqtb009Variavel NuVariavelNavigation { get; set; }
        public virtual ICollection<Faqtb003Regra> Faqtb003RegraNuConversaAnteriorNavigation { get; set; }
        public virtual ICollection<Faqtb003Regra> Faqtb003RegraNuConversaPosteriorNavigation { get; set; }
        public virtual ICollection<Faqtb005Resposta> Faqtb005Resposta { get; set; }
        public virtual ICollection<Faqtb006Envio> Faqtb006Envio { get; set; }
        public virtual ICollection<Faqtb008Cartao> Faqtb008Cartao { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace BOTFAQ.Models
{
    public partial class Faqtb004Sessao
    {
        public Faqtb004Sessao()
        {
            Faqtb005Resposta = new HashSet<Faqtb005Resposta>();
            Faqtb006Envio = new HashSet<Faqtb006Envio>();
        }

        public int NuSessao { get; set; }
        public DateTime DhSessao { get; set; }
        public string NoUsuario { get; set; }
        public int NuDialogo { get; set; }

        public virtual Faqtb001Dialogo NuDialogoNavigation { get; set; }
        public virtual ICollection<Faqtb005Resposta> Faqtb005Resposta { get; set; }
        public virtual ICollection<Faqtb006Envio> Faqtb006Envio { get; set; }
    }
}

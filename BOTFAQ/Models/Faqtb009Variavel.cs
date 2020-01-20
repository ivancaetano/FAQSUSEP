using System;
using System.Collections.Generic;

namespace BOTFAQ.Models
{
    public partial class Faqtb009Variavel
    {
        public Faqtb009Variavel()
        {
            Faqtb002Conversa = new HashSet<Faqtb002Conversa>();
            Faqtb005Resposta = new HashSet<Faqtb005Resposta>();
        }

        public int NuVariavel { get; set; }
        public string NoVariavel { get; set; }
        public string IcTipoVariavel { get; set; }
        public int NuDialogo { get; set; }

        public virtual Faqtb001Dialogo NuDialogoNavigation { get; set; }
        public virtual ICollection<Faqtb002Conversa> Faqtb002Conversa { get; set; }
        public virtual ICollection<Faqtb005Resposta> Faqtb005Resposta { get; set; }
    }
}

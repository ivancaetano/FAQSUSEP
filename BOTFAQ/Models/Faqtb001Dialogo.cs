using System;
using System.Collections.Generic;

namespace BOTFAQ.Models
{
    public partial class Faqtb001Dialogo
    {
        public Faqtb001Dialogo()
        {
            Faqtb002Conversa = new HashSet<Faqtb002Conversa>();
            Faqtb004Sessao = new HashSet<Faqtb004Sessao>();
            Faqtb009Variavel = new HashSet<Faqtb009Variavel>();
        }

        public int NuDialogo { get; set; }
        public string NoDialogo { get; set; }

        public virtual ICollection<Faqtb002Conversa> Faqtb002Conversa { get; set; }
        public virtual ICollection<Faqtb004Sessao> Faqtb004Sessao { get; set; }
        public virtual ICollection<Faqtb009Variavel> Faqtb009Variavel { get; set; }
    }
}


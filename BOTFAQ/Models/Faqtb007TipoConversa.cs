using System;
using System.Collections.Generic;

namespace BOTFAQ.Models
{
    public partial class Faqtb007TipoConversa
    {
        public Faqtb007TipoConversa()
        {
            Faqtb002Conversa = new HashSet<Faqtb002Conversa>();
        }

        public string IcTipoConversa { get; set; }
        public string NoTipoConversa { get; set; }

        public virtual ICollection<Faqtb002Conversa> Faqtb002Conversa { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace BOTFAQ.Models
{
    public partial class Faqtb003Regra
    {
        public int NuConversaAnterior { get; set; }
        public int NuConversaPosterior { get; set; }
        public string DeRegra { get; set; }

        public virtual Faqtb002Conversa NuConversaAnteriorNavigation { get; set; }
        public virtual Faqtb002Conversa NuConversaPosteriorNavigation { get; set; }
    }
}

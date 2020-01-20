using System;
using System.Collections.Generic;

namespace BOTFAQ.Models
{
    public partial class Faqtb008Cartao
    {
        public int NuCartao { get; set; }
        public int NuConversa { get; set; }
        public string VrCartao { get; set; }
        public string DeCartao { get; set; }

        public virtual Faqtb002Conversa NuConversaNavigation { get; set; }
    }
}

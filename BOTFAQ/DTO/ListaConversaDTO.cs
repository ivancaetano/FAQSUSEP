using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BOTFAQ.DTO
{
    public class ListaConversaDTO
    {
        public List<ConversaDTO> conversas { get; set; }
        public int nuSessao { get; set; }
        public ListaConversaDTO()
        {
            this.conversas = new List<ConversaDTO>();
        }
    }
}

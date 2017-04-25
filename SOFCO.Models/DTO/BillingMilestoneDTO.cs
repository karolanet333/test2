using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFCO.Models.DTO
{
    public class BillingMilestoneDTO
    {
        public BillingMilestone BillingMilestone { get; set; }
        //public string str { get; set; }
        public int IdUser { get; set; }
        public Boolean Simple { get; set; }
        public Boolean Update { get; set; }
        public Boolean Rechazar { get; set; }
    }
}

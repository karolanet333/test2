using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFCO.Models
{
    public class SolFacHist
    {
        [Key]
        public int Id { get; set; }

        [ForeignKey("BillingMilestone")]
        public int IdBillingMilestone { get; set; }
        //[ForeignKey("IdBillingMilestone")]
        public BillingMilestone BillingMilestone { get; set; }

        [ForeignKey("SolFacState")]
        public int IdSolFacState { get; set; }
        //[ForeignKey("IdSolFacState")]
        public virtual SolFacState SolFacState { get; set; }

        public DateTime Date { get; set; }

        [ForeignKey("User")]
        public int IdUser { get; set; }
        //[ForeignKey("IdUser")]
        public virtual User User { get; set; }

        public Boolean Canceled { get; set; }
    }
}

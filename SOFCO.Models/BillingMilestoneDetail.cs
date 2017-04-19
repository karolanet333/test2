using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFCO.Models
{
    public class BillingMilestoneDetail
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [ForeignKey("BillingMilestone")]
        public int IdBillingMilestone { get; set; }
        public virtual BillingMilestone BillingMilestone { get; set; }

        public string Name { get; set; }

        public int Order { get; set; }
        public string Detail { get; set; }
        public CurrencySign CurrencySign  { get; set; }
        [ForeignKey("CurrencySign")]
        public int IdCurrencySign { get; set; }
        public string CurrencySignName { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal SubTotal { get; set; }

    }
}

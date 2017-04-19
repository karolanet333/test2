using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SOFCO.Models
{
    public class CustomerService
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Name { get; set; }
        [Required]
        [ForeignKey("Status")]
        public int IdStatus { get; set; }
        public virtual Status Status { get; set; }
        public string StatusDescription { get { return (Status != null) ? Status.Name : string.Empty; } }
        [Required]
        [ForeignKey("Customer")]
        public int IdCustomer { get; set; }
        public virtual Customer Customer { get; set; }
        public string CustomerDescription { get { return (Customer != null) ? Customer.Name : string.Empty; } }
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
    }
}

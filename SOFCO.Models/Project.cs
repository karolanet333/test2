using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SOFCO.Models
{
    public class Project
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Name { get; set; }
        [Required]
        [ForeignKey("Customer")]
        public int IdCustomer { get; set; }
        [ForeignKey("Service")]
        public int IdService { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual CustomerService Service { get; set; }
        public string CustomerDescription { get { return (Customer != null) ? Customer.Name : string.Empty; } }
        public string Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string ProjectManager { get; set; }
        public int IdTypeService { get; set; }
        public int IdTypeSolution { get; set; }
        public int IdTypeTecnology { get; set; }
        public int? EstimatedEarnings { get; set; }
        public string Analytics { get; set; }
        public string PurchaseOrder { get; set; }
        public string Link { get; set; }
    }
}

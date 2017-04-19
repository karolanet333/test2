using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;

namespace SOFCO.Models
{
    public class BillingMilestone
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Name { get; set; }

        //Info base del Hito
        public DateTime ScheduledDate { get; set; }
        public decimal Monto { get; set; }

        //Sección Customer
        [Required]
        [ForeignKey("Customer")]
        public int IdCustomer { get; set; }
        public virtual Customer Customer { get; set; }
        public string CustomerDescription { get; set; }
        public string CustomerContact { get; set; }
        public string CustomerPhone { get; set; }

        //Service
        [ForeignKey("Service")]
        public int IdService { get; set; }
        public CustomerService Service { get; set; }

        //Sección Proyecto
        [Required]
        [ForeignKey("Project")]
        public int IdProject { get; set; }
        public virtual Project Project { get; set; }
        public string ProjectName { get; set; }

        //datos del documento
        public int ContractNumber { get; set; }
        public virtual DocumentType DocumentType { get; set; }
        [ForeignKey("DocumentType")]
        public int? IdDocumentType { get; set; }
        public PaymentMethod PaymentMethod { get; set; }
        [ForeignKey("PaymentMethod")]
        public int? IdPaymentMethod { get; set; }
        public string PaymentMethodDescription { get; set; }
        public int Plazo { get; set; }
        public string Comments { get; set; }
        public string Status { get; set; }
        public string ApplicantName { get; set; }

        public decimal ImporteBruto { get; set; }
        public decimal Iva21 { get; set; }
        public decimal ImporteBrutoMasIva21 { get; set; }
        public decimal Total { get; set; }

        //detalles
        public ICollection<BillingMilestoneDetail> BillingMilestoneDetails { get; set; }

        //ESTO PUEDE QUE VAYA EN OTRA TABLA
        public decimal ImpCapital { get; set; }
        public decimal ImpProvBsAs { get; set; }

        public decimal ImpOtrasProv_1 { get; set; }
        public Province ImpProv_1 { get; set; }
        [ForeignKey("ImpProv_1")]
        public int? IdImpProv_1 { get; set; }

        public decimal ImpOtrasProv_2 { get; set; }
        public Province ImpProv_2 { get; set; }
        [ForeignKey("ImpProv_2")]
        public int? IdImpProv_2 { get; set; }

        public decimal ImpOtrasProv_3 { get; set; }
        public Province ImpProv_3 { get; set; }
        [ForeignKey("ImpProv_3")]
        public int? IdImpProv_3 { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using SOFCO.Models;

namespace SOFCO.Repositories
{
    public class AppDbContext : DbContext
    {
        public DbSet<Customer> Customers { get; set; }
        public DbSet<CustomerService> CustomerServices { get; set; }
        public DbSet<Project> Projects { get; set; }
        public DbSet<BillingMilestone> BillingMilestones { get; set; }
        public DbSet<BillingMilestoneDetail> BillingMilestonesDetails { get; set; }
        public DbSet<Status> Status { get; set; }
        public DbSet<Province> Provinces { get; set; }
        public DbSet<PaymentMethod> PaymentMethods { get; set; }
        public DbSet<DocumentType> DocumentTypes { get; set; }
        public DbSet<CurrencySign> CurrencySigns { get; set; }

        public AppDbContext()
            : base()
        {

        }
    }
}

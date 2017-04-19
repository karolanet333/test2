using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using SOFCO.Core.Repositories;
using SOFCO.Models;

namespace SOFCO.Repositories.Repositories
{
    public class BillingMilestoneRepository : BaseRepository<BillingMilestone>, IBillingMilestoneRepository
    {
        public IEnumerable<BillingMilestone> GetByIdProject(int id)
        {
            var appContext = (AppDbContext)context;
            //var billingBilestone = appContext.BillingMilestones.Find(id);

            //appContext.Entry(billingBilestone).Reference(p => p.Project).Load();
            //appContext.Entry(billingBilestone).Reference(d => d.BillingMilestoneDetails).Load();

            return appContext.BillingMilestones.Include("BillingMilestoneDetails")
                .Where(s => s.IdProject == id)
                .OrderBy(s => s.Name).ToList();
            //IQueryable<BillingMilestone> query = context.Set<BillingMilestone>().Include(p => p.Project)
                                                                                ;
            //query = query.Where(s => s.IdProject == id).OrderBy(s => s.Name);

            //return query.ToList();
        }

        public override BillingMilestone GetById(int Id)
        {
            return context.Set<BillingMilestone>()
                .Include("BillingMilestoneDetails")
                .Where(m => m.Id == Id).FirstOrDefault();
        }

        public override void Insert(BillingMilestone o)
        {
            o.Name = o.ProjectName + o.ContractNumber;
            base.Insert(o);
        }

        public override void SaveOrUpdate(BillingMilestone o)
        {
            //encabezado
            //o.Name = o.ProjectName + o.ContractNumber;
            base.SaveOrUpdate(o);

            //detalles
            var repoDeta = new BillingMilestoneDetailRepository();
            repoDeta.context = base.context;
            if (o.BillingMilestoneDetails != null)
            {
                foreach (var d in o.BillingMilestoneDetails)
                {
                    repoDeta.SaveOrUpdate(d);
                }
            }
            

            //guardar cambios
            base.context.SaveChanges();

            //limpiar recursos
            repoDeta = null;
            
        }

    }
}

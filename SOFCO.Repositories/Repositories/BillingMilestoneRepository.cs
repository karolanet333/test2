using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using SOFCO.Core.Repositories;
using SOFCO.Models;
using SOFCO.Repositories.Repositories.Helpers;

namespace SOFCO.Repositories.Repositories
{
    public class BillingMilestoneRepository : BaseRepository<BillingMilestone>, IBillingMilestoneRepository
    {
        public IEnumerable<BillingMilestone> GetAll(int idCustomer, int idService, int idProject)
        {
            var appContext = (AppDbContext)context;
            //var billingBilestone = appContext.BillingMilestones.Find(id);

            //appContext.Entry(billingBilestone).Reference(p => p.Project).Load();
            //appContext.Entry(billingBilestone).Reference(d => d.BillingMilestoneDetails).Load();

            return appContext.BillingMilestones.Include("SolFacState")//.Include("BillingMilestoneDetails")
                .Where(s =>    s.IdProject == idProject
                            && s.IdCustomer == idCustomer
                            && s.IdService == idService)
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

        public void SaveOrUpdate2(BillingMilestone o, int idUser, Boolean simple, Boolean update, Boolean rechazar)
        {
            AppDbContext appContext = (AppDbContext) context;
            BillingMilestoneDetailRepository repoDeta;

            //profile
            Profile profile = appContext.Users.Where(u => u.Id == idUser).Include(p => p.Profile).Select(s => s.Profile).FirstOrDefault();

            //historial
            var repoHist = new SolFacHistRepository();
            repoHist.context = base.context;

            SolFacState currState = SolFacStateHelper.GetCurrentState(appContext, o.Id);
            SolFacState prevState = SolFacStateHelper.GetPrevState(appContext, currState);
            SolFacState nextState = SolFacStateHelper.GetNextState(appContext, currState);

            //solo hacer todo si existe el siguiente estado
            //si es siguiente estado es nulo, es porque la acción no está permitida
            if (rechazar == false && nextState != null || rechazar && prevState != null)
            {
                //Encabezado
                //o.Name = o.ProjectName + o.ContractNumber;
                if (update)
                {
                    o.CurrState = currState.Code;
                    o.IdSolFacState = currState.Id;
                }
                else
                {
                    if (rechazar)
                    {
                        o.CurrState = prevState.Code;
                        o.IdSolFacState = prevState.Id;
                    }
                    else
                    {
                        o.CurrState = nextState.Code;
                        o.IdSolFacState = nextState.Id;
                    }
                }
                base.SaveOrUpdate(o);

                base.context.SaveChanges();

                //if (!simple)
                //{
                    //historial
                    SolFacHist solfacthist = new SolFacHist();
                    solfacthist.IdBillingMilestone = o.Id;
                    if (update)
                    {
                        solfacthist.IdSolFacState = currState.Id;
                    }
                    else
                    {
                        if (rechazar)
                        {
                            solfacthist.IdSolFacState = prevState.Id;
                        }
                        else
                        {
                            solfacthist.IdSolFacState = nextState.Id;
                        }
                    }
                    solfacthist.Canceled = rechazar;
                    solfacthist.IdUser = idUser;
                    solfacthist.Date = DateTime.Now;
                    repoHist.SaveOrUpdate(solfacthist);

                //}

                if(!simple)
                {
                    //detalles
                    repoDeta = new BillingMilestoneDetailRepository();
                    repoDeta.context = base.context;
                    if (o.BillingMilestoneDetails != null)
                    {
                        foreach (var d in o.BillingMilestoneDetails)
                        {
                            repoDeta.SaveOrUpdate(d);
                        }
                    }

                }

                //guardar cambios
                base.context.SaveChanges();

                if (!simple)
                {
                    //limpiar recursos
                    repoDeta = null;
                }
                
            }
            

            
            
        }

    }

    
}

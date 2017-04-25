using SOFCO.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SOFCO.Core.Repositories;

namespace SOFCO.Repositories.Repositories
{
    public class SolFacHistRepository : BaseRepository<SolFacHist>, ISolFacHistRepository
    {

        public IEnumerable<SolFacHist> GetAll()
        {
            //var appContext = (AppDbContext)context;

            return context.Set<SolFacHist>()
                .Include("SolFacState")
                //.Where(s => s.IdBillingMilestone == idBillingMilestone)
                .OrderBy(s => s.Date).ToList();

        }
    }
}

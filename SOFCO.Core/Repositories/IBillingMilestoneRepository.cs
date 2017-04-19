using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SOFCO.Models;

namespace SOFCO.Core.Repositories
{
    public interface IBillingMilestoneRepository : IRepository<BillingMilestone>
    {
        IEnumerable<BillingMilestone> GetByIdProject(int id);
    }
}

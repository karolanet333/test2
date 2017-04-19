using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SOFCO.Core.Services;
using SOFCO.Core.Repositories;
using SOFCO.Repositories.Repositories;
using SOFCO.Models;

namespace SOFCO.Service
{
    public class BillingMilestoneService : BaseService<BillingMilestone>, IBillingMilestoneService
    {
        IBillingMilestoneRepository _billingMilestoneRepository;

        public BillingMilestoneService()
        {
            base._repository = _billingMilestoneRepository = new BillingMilestoneRepository();
        }

        public IEnumerable<BillingMilestone> GetByIdProject(int id)
        {
            return _billingMilestoneRepository.GetByIdProject(id);
        }

        public override void SaveOrUpdate(BillingMilestone entity)
        {
            _billingMilestoneRepository.SaveOrUpdate(entity);
            _repository.Save();
        }
    }
}

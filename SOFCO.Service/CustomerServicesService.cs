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
    public class CustomerServicesService : BaseService<Models.CustomerService>, ICustomerServiceService
    {
        ICustomerServiceRepository _customerServiceRepository;

        public CustomerServicesService()
        {
            base._repository = _customerServiceRepository = new CustomerServiceRepository();
        }

        public IEnumerable<Models.CustomerService> GetByIdCustomer(int id)
        {
            return _customerServiceRepository.GetByIdCustomer(id);
        }
    }
}

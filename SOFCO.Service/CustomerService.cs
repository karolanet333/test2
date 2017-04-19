using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SOFCO.Core.Services;
using SOFCO.Repositories.Repositories;
using SOFCO.Models;

namespace SOFCO.Service
{
    public class CustomerService : BaseService<Customer>, ICustomerService
    {
        public CustomerService()
        {
            base._repository = new CustomerRepository();
        }
    }
}

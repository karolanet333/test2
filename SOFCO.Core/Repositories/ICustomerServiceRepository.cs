using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SOFCO.Models;

namespace SOFCO.Core.Repositories
{
    public interface ICustomerServiceRepository : IRepository<CustomerService>
    {
        IEnumerable<CustomerService> GetByIdCustomer(int id);
    }
}

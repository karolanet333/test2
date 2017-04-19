using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SOFCO.Models;

namespace SOFCO.Core.Services
{
    public interface ICustomerServiceService : IService<CustomerService>
    {
        IEnumerable<CustomerService> GetByIdCustomer(int id);
    }
}

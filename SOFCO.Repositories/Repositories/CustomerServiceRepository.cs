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
    public class CustomerServiceRepository : BaseRepository<CustomerService>, ICustomerServiceRepository
    {
        public IEnumerable<CustomerService> GetByIdCustomer(int id)
        {
            IQueryable<CustomerService> query = context.Set<CustomerService>().Include(c => c.Customer);

            query = query.Where(s => s.IdCustomer == id).OrderBy(s => s.Name);

            return query.ToList();
        }
    }
}

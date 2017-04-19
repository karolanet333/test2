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
    public class ProjectRepository : BaseRepository<Project>, IProjectRepository
    {
        /*public IEnumerable<Project> GetByIdCustomer(int id)
        {
            IQueryable<Project> query = context.Set<Project>().Include(c => c.Customer);

            query = query.Where(s => s.Customer.Id == id).OrderBy(s => s.Name);

            return query.ToList();
        }*/

        public IEnumerable<Project> GetAll(int idCustomer, int idService)
        {
            IQueryable<Project> query = context.Set<Project>();//.Include(c => c.Customer);

            query = query.Where(s => 
                   s.IdCustomer == idCustomer
                && s.IdService == idService).OrderBy(s => s.Name);

            return query.ToList();
        }
    }
}

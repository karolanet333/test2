using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SOFCO.Models;

namespace SOFCO.Core.Repositories
{
    public interface IProjectRepository : IRepository<Project>
    {
        //IEnumerable<Project> GetByIdCustomer(int id);

        IEnumerable<Project> GetAll(int idCustomer, int idService);
    }
}

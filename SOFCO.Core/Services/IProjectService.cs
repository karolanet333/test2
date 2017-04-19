using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SOFCO.Models;

namespace SOFCO.Core.Services
{
    public interface IProjectService :IService<Project>
    {
        //IEnumerable<Project> GetByIdCustomer(int id);

        IEnumerable<Project> GetAll(int idCustomer, int idService);
    }
}

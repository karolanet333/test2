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
    public class ProjectService : BaseService<Project>, IProjectService
    {
        IProjectRepository _projectRepository;
        public ProjectService()
        {
            base._repository = _projectRepository = new ProjectRepository();
        }

        /*public IEnumerable<Project> GetByIdCustomer(int id)
        {
            return _projectRepository.GetByIdCustomer(id);
        }*/

        public IEnumerable<Project> GetAll(int idCustomer, int idService)
        {
            return _projectRepository.GetAll(idCustomer, idService);
        }
    }
}

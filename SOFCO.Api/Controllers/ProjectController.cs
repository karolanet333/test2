using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using SOFCO.Models;
using SOFCO.Core.Services;
using SOFCO.Service;
using SOFCO.Api.ActionFilters;

namespace SOFCO.Api.Controllers
{
    [AuthorizationRequired]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ProjectController : ApiController
    {
        IProjectService _projectService = new ProjectService();

        /*[Route("api/getByIdCustomer")]
        public IEnumerable<Project> GetByIdCustomer(int id)
        {
            return _projectService.GetByIdCustomer(id);
        }*/

        [Route("api/getAll")]
        public IEnumerable<Project> GetAll(int idCustomer, int idService)
        {
            return _projectService.GetAll(idCustomer, idService);
        }

        [Route("api/getById")]
        public Project GetById(int id)
        {
            return _projectService.GetById(id);
        }

        public HttpResponseMessage Post(Project project)
        {
            if (ModelState.IsValid)
            {
                _projectService.Insert(project);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }
    }
}
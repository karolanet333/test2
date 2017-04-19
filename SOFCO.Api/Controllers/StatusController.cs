using System.Collections.Generic;
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
    public class StatusController : ApiController
    {
        IStatusService _statusService = new StatusService();

        public IEnumerable<Status> Get()
        {
            return _statusService.GetAll();
        }
    }
}
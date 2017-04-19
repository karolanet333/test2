using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using SOFCO.Models;
using SOFCO.Core.Services;
using SOFCO.Api.ActionFilters;

namespace SOFCO.Api.Controllers
{
    [AuthorizationRequired]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class BillingMilestoneController : ApiController
    {
        IBillingMilestoneService _milestoneService = new SOFCO.Service.BillingMilestoneService();
        
        [HttpGet]
        [System.Web.Http.ActionName("getByIdProject")]
        [Route("api/getByIdProject")]
        public IEnumerable<BillingMilestone> GetByIdProject(int id)
        {
            return _milestoneService.GetByIdProject(id);
        }

        [HttpGet]
        [System.Web.Http.ActionName("GetById")]
        [Route("api/getById")]
        public BillingMilestone GetById(int id)
        {
            return _milestoneService.GetById(id);
        }

        [AcceptVerbs("Post", "Put")]
        public HttpResponseMessage Post(BillingMilestone bm)
        {
            if (ModelState.IsValid)
            {
                _milestoneService.SaveOrUpdate(bm);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

    }
}
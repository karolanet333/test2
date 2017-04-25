using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using SOFCO.Models;
using SOFCO.Core.Services;
using SOFCO.Api.ActionFilters;
using Newtonsoft.Json.Linq;
using SOFCO.Repositories.Repositories;
using SOFCO.Models.DTO;

namespace SOFCO.Api.Controllers
{
    [AuthorizationRequired]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class BillingMilestoneController : ApiController
    {
        //IBillingMilestoneService _milestoneService = new SOFCO.Service.BillingMilestoneService();
        BillingMilestoneRepository repo = new BillingMilestoneRepository();

        [HttpGet]
        [System.Web.Http.ActionName("getAll")]
        [Route("api/getAll")]
        public IEnumerable<BillingMilestone> GetAll(int idCustomer, int idService, int idProject)
        {
            var rpta = repo.GetAll(idCustomer, idService, idProject);
            return rpta;
        }

        [HttpGet]
        [System.Web.Http.ActionName("GetById")]
        [Route("api/getById")]
        public BillingMilestone GetById(int id)
        {
            return repo.GetById(id);
        }

        [AcceptVerbs("Post", "Put")]
        public HttpResponseMessage Post([FromBody] BillingMilestoneDTO dto)
        {
            //BillingMilestone bm = data["BillingMilestone"].ToObject<BillingMilestone>();
            //int idUser = int.Parse(data["IdUser"].ToString());

            if (ModelState.IsValid)
            {
                repo.SaveOrUpdate2(dto.BillingMilestone, dto.IdUser, dto.Simple, dto.Update, dto.Rechazar);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

    }
}
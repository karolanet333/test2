using SOFCO.Api.ActionFilters;
using SOFCO.Core.Services;
using SOFCO.Models;
using SOFCO.Repositories.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;

namespace SOFCO.Api.Controllers
{
    [AuthorizationRequired]
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class SolFacHistController : ApiController
    {
        //ISolFacHistService service = new SOFCO.Service.SolFacHistService();
        SolFacHistRepository repo = new SolFacHistRepository();

        [HttpGet]
        [System.Web.Http.ActionName("getAll")]
        [Route("api/getAll")]
        public IEnumerable<SolFacHist> GetAll()
        {
            return repo.GetAll().OrderBy(c => c.Date );
        }

        /*
        public SolFacHist GetById(int id)
        {
            return repo.GetById(id);
        }*/

            /*
        public HttpResponseMessage Post(SolFacHist item)
        {
            if (ModelState.IsValid)
            {
                repo.Insert(item);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }*/
    }
}
using SOFCO.Api.ActionFilters;
using SOFCO.Core.Services;
using SOFCO.Models;
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
    public class ProvinceController : ApiController
    {
        IProvinceService service = new SOFCO.Service.ProvinceService();

        public IEnumerable<Province> Get()
        {
            return service.GetAll().OrderBy(c => c.Name);
        }

        public Province Get(int id)
        {
            return service.GetById(id);
        }

        public HttpResponseMessage Post(Province province)
        {
            if (ModelState.IsValid)
            {
                service.Insert(province);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }
    }
}
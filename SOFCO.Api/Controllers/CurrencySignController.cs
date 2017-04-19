using System.Collections.Generic;
using System.Linq;
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
    public class CurrencySignController : ApiController
    {
        ICurrencySignService service = new SOFCO.Service.CurrencySignService();

        public IEnumerable<CurrencySign> Get()
        {
            return service.GetAll().OrderBy(c => c.Name);
        }

        public CurrencySign Get(int id)
        {
            return service.GetById(id);
        }

        public HttpResponseMessage Post(CurrencySign currencySign)
        {
            if (ModelState.IsValid)
            {
                service.Insert(currencySign);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }
    }
}
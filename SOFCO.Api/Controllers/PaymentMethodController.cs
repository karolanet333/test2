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
    public class PaymentMethodController : ApiController
    {
        IPaymentMethodService service = new SOFCO.Service.PaymentMethodService();

        public IEnumerable<PaymentMethod> Get()
        {
            return service.GetAll().OrderBy(c => c.Name);
        }

        public PaymentMethod Get(int id)
        {
            return service.GetById(id);
        }

        public HttpResponseMessage Post(PaymentMethod paymentMethod)
        {
            if (ModelState.IsValid)
            {
                service.Insert(paymentMethod);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }
    }
}
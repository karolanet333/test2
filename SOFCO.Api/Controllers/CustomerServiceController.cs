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
    public class CustomerServiceController : ApiController
    {
        ICustomerServiceService _customerServices = new CustomerServicesService();

        [Route("api/getByIdCustomer")]
        public IEnumerable<Models.CustomerService> GetByIdCustomer(int id)
        {
            return _customerServices.GetByIdCustomer(id);
        }

        [Route("api/getById")]
        public Models.CustomerService GetById(int id)
        {
            return _customerServices.GetById(id);
        }

        public HttpResponseMessage Post(Models.CustomerService cs)
        {
            if (ModelState.IsValid)
            {
                _customerServices.SaveOrUpdate(cs);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }
    }
}
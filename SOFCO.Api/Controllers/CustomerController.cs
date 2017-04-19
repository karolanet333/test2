using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using SOFCO.Models;
using SOFCO.Core.Services;
using SOFCO.Api.ActionFilters;
using System;

namespace SOFCO.Api.Controllers
{
    [AuthorizationRequired]
    public class CustomerController : ApiController
    {
        ICustomerService _customersService = new SOFCO.Service.CustomerService();

        public IEnumerable<Customer> Get()
        {
            IEnumerable<Customer> rpta = new List<Customer>();
            rpta = _customersService.GetAll().OrderBy(c => c.Name);

            return rpta;
        }

        public Customer Get(int id)
        {
            return _customersService.GetById(id);
        }

        public HttpResponseMessage Post(Customer customer)
        {
            if (ModelState.IsValid)
            {
                _customersService.Insert(customer);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }
    }
}
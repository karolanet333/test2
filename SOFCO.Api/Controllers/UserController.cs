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
    public class UserController : ApiController
    {
        IUserService service = new SOFCO.Service.UserService();

        [HttpGet]
        public IEnumerable<User> Get()
        {
            var rpta = service.GetAll().OrderBy(c => c.Name);
            return rpta;
        }

        /*
        public User Get(int id)
        {
            return service.GetById(id);
        }

        public HttpResponseMessage Post(User item)
        {
            if (ModelState.IsValid)
            {
                service.Insert(item);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }*/
    }
}
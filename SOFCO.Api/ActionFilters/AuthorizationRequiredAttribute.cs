using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace SOFCO.Api.ActionFilters
{
    public class AuthorizationRequiredAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(HttpActionContext filterContext)
        {
            /*
            string token = System.Configuration.ConfigurationManager.AppSettings["Token"];
            
            
            if (filterContext.Request.Headers.Contains("Authorization") && filterContext.Request.Headers.GetValues("Authorization").Contains(token))
            {
                var tokenRequest = filterContext.Request.Headers.GetValues("Authorization").First();

                // Validate Token
                if (tokenRequest != token)
                {
                    var responseMessage = new HttpResponseMessage(HttpStatusCode.Unauthorized) { ReasonPhrase = "Invalid Request" };
                    filterContext.Response = responseMessage;
                }
            }
            else
            {
                filterContext.Response = new HttpResponseMessage(HttpStatusCode.Unauthorized);
            }
            
            base.OnActionExecuting(filterContext);
            */
        }
    }
}
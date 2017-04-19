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
    public class DocumentTypeController : ApiController
    {
        IDocumentTypeService service = new SOFCO.Service.DocumentTypeService();

        public IEnumerable<DocumentType> Get()
        {
            return service.GetAll().OrderBy(c => c.Name);
        }

        public DocumentType Get(int id)
        {
            return service.GetById(id);
        }

        public HttpResponseMessage Post(DocumentType documentType)
        {
            if (ModelState.IsValid)
            {
                service.Insert(documentType);
                return new HttpResponseMessage(HttpStatusCode.OK);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SOFCO.Core.Services;
using SOFCO.Repositories.Repositories;
using SOFCO.Models;

namespace SOFCO.Service
{
    public class StatusService : BaseService<Status>, IStatusService
    {
        public StatusService()
        {
            base._repository = new StatusRepository();
        }
    }
}

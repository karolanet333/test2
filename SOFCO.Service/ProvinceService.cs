using SOFCO.Core.Services;
using SOFCO.Models;
using SOFCO.Repositories.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFCO.Service
{
    public class ProvinceService : BaseService<Province>, IProvinceService
    {
        public ProvinceService()
        {
            base._repository = new ProvinceRepository();
        }
    }
}

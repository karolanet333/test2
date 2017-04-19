using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using SOFCO.Core.Repositories;
using SOFCO.Models;

namespace SOFCO.Repositories.Repositories
{
    public class StatusRepository : BaseRepository<Status>, IStatusRepository
    {
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace SOFCO.Repositories
{
    public interface IDbContextFactory
    {
        DbContext GetContext();
    }
    public class AppDbContextFactory
    {
        private readonly DbContext context;

        public AppDbContextFactory()
        {
            context = new AppDbContext();
            //context.Configuration.LazyLoadingEnabled = false;
            //context.Configuration.ProxyCreationEnabled = false;
        }

        public DbContext GetContext()
        {
            return context;
        }
    }
}

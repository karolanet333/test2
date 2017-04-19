using SOFCO.Core.Repositories;
using SOFCO.Core.Services;
using SOFCO.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SOFCO.Service
{
    public class PaymentMethodService : BaseService<PaymentMethod>, IPaymentMethodService
    {
        public PaymentMethodService()
        {
            base._repository = new PaymentMethodRepository();
        }
    }
}

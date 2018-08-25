using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface ICanNangRepository: IRepository<CanNang>
    {
    }
    public class CanNangRepository: RepositoryBase<CanNang>, ICanNangRepository
    {
        public CanNangRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IGioiThieuRepository: IRepository<GioiThieu>
    {

    }
    public class GioiThieuRepository: RepositoryBase<GioiThieu>, IGioiThieuRepository
    {
        public GioiThieuRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
    }
}

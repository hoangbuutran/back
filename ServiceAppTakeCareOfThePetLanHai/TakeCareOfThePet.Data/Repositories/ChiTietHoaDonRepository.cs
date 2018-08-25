using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IChiTietHoaDonRepository : IRepository<ChiTietHoaDon>
    {
    }
    public class ChiTietHoaDonRepository : RepositoryBase<ChiTietHoaDon>, IChiTietHoaDonRepository
    {
        public ChiTietHoaDonRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
    }
}

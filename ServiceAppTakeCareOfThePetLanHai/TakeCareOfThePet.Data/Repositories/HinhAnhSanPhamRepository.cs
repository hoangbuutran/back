using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IHinhAnhSanPhamRepository : IRepository<HinhAnhSanPham>
    {
    }
    public class HinhAnhSanPhamRepository : RepositoryBase<HinhAnhSanPham>, IHinhAnhSanPhamRepository
    {
        public HinhAnhSanPhamRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
    }
}

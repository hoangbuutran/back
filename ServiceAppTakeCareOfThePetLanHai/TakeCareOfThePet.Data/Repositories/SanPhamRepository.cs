using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface ISanPhamRepository : IRepository<SanPham>
    {
        void KhoaMo(int id);
    }
    public class SanPhamRepository : RepositoryBase<SanPham>, ISanPhamRepository
    {
        public SanPhamRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var sanPham = DbContext.SanPhams.Find(id);
            if (sanPham != null) sanPham.TrangThai = !sanPham.TrangThai;
        }
    }
}

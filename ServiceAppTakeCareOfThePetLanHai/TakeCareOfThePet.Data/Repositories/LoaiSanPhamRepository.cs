using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface ILoaiSanPhamRepository : IRepository<LoaiSanPham>
    {
        void KhoaMo(int id);
        IEnumerable<LoaiSanPham> SearchWithKey(string keySearch);
    }
    public class LoaiSanPhamRepository : RepositoryBase<LoaiSanPham>, ILoaiSanPhamRepository
    {
        public LoaiSanPhamRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var loaiSanPham = DbContext.LoaiSanPhams.Find(id);
            if (loaiSanPham != null) loaiSanPham.TrangThai = !loaiSanPham.TrangThai;
        }


        public IEnumerable<LoaiSanPham> SearchWithKey(string keySearch)
        {
            return DbContext.LoaiSanPhams.Where(x => x.TenLoaiSanPham.Contains(keySearch));
        }
    }
}

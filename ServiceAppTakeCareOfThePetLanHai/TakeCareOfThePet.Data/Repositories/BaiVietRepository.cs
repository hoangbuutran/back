using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IBaiVietRepository : IRepository<BaiViet>
    {
        void KhoaMo(int id);
        IEnumerable<BaiViet> GetAllSortDate();
        IEnumerable<BaiViet> GetAllSortDateLan2();
        void Like(int id);
    }
    public class BaiVietRepository : RepositoryBase<BaiViet>, IBaiVietRepository
    {
        public BaiVietRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var baiViet = DbContext.BaiViets.Find(id);
            if (baiViet != null) baiViet.TrangThai = !baiViet.TrangThai;
        }


        public IEnumerable<BaiViet> GetAllSortDate()
        {
            return DbContext.BaiViets.Where(x => x.TrangThai == true).OrderByDescending(x => x.NgayDang).ToList();
        }


        public void Like(int id)
        {
            var baiViet = DbContext.BaiViets.Find(id);
            if (baiViet != null) baiViet.SoLike += 1;
        }


        public IEnumerable<BaiViet> GetAllSortDateLan2()
        {
            return DbContext.BaiViets.Where(x => x.TrangThai == true).OrderByDescending(x => x.NgayDang).ToList();
        }
    }
}

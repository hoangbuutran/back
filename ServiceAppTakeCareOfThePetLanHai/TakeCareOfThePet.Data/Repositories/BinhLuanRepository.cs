using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IBinhLuanRepository : IRepository<BinhLuan>
    {
        void KhoaMo(int id);
        void Like(int id);
    }
    public class BinhLuanRepository : RepositoryBase<BinhLuan>, IBinhLuanRepository
    {
        public BinhLuanRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var binhLuan = DbContext.BinhLuans.Find(id);
            if (binhLuan != null) binhLuan.TrangThai = !binhLuan.TrangThai;
        }
        public void Like(int id)
        {
            var binhLuan = DbContext.BinhLuans.Find(id);
            if (binhLuan != null) binhLuan.SoLike += 1;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IChuyenMucRepository : IRepository<ChuyenMuc>
    {
        void KhoaMo(int id);
    }
    public class ChuyenMucRepository : RepositoryBase<ChuyenMuc>, IChuyenMucRepository
    {
        public ChuyenMucRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var chuyenMuc = DbContext.ChuyenMucs.Find(id);
            if (chuyenMuc != null) chuyenMuc.TrangThai = !chuyenMuc.TrangThai;
        }
    }
}

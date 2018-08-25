using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{

    public interface ITinhTrangRepository : IRepository<TinhTrang>
    {
        void KhoaMo(int id);
    }
    public class TinhTrangRepository : RepositoryBase<TinhTrang>, ITinhTrangRepository
    {
        public TinhTrangRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var tinhTrang = DbContext.TinhTrangs.Find(id);
            if (tinhTrang != null) tinhTrang.TrangThai = !tinhTrang.TrangThai;
        }
    }
}

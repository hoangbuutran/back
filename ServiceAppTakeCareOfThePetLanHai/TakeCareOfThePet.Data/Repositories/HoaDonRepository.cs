using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IHoaDonRepository : IRepository<HoaDon>
    {
        void UpdateTrangThai(int id);
        //IEnumerable<ChiTietHoaDon> GetAllCthdbyIdHoaDons(int id);
    }
    public class HoaDonRepository : RepositoryBase<HoaDon>, IHoaDonRepository
    {
        public HoaDonRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void UpdateTrangThai(int id)
        {
            var hoaDon = DbContext.HoaDons.Find(id);
            if (hoaDon != null) hoaDon.TrangThai = true;
        }


        //public IEnumerable<ChiTietHoaDon> GetAllCthdbyIdHoaDons(int id)
        //{
        //    return DbContext.ChiTietHoaDons.Where(x => x.IdHoaDon == id).ToList();
        //}
    }
}

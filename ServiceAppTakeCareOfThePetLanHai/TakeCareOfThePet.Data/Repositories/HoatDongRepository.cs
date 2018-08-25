using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IHoatDongRepository : IRepository<HoatDong>
    {
        void KhoaMo(int id);
        IEnumerable<HoatDong> SearchWithKey(string keySearch);
    }
    public class HoatDongRepository: RepositoryBase<HoatDong>, IHoatDongRepository
    {
        public HoatDongRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var hoatDong = DbContext.HoatDongs.Find(id);
            if (hoatDong != null) hoatDong.TinhTrang = !hoatDong.TinhTrang;
        }


        public IEnumerable<HoatDong> SearchWithKey(string keySearch)
        {
            return DbContext.HoatDongs.Where(x => x.MoTa.Contains(keySearch));
        }
    }
}

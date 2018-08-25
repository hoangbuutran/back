using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IGiongThuCungRepository : IRepository<GiongThuCung>
    {
        void KhoaMo(int id);
        IEnumerable<GiongThuCung> SearchWithKey(string keySearch);
    }
    public class GiongThuCungRepository : RepositoryBase<GiongThuCung>, IGiongThuCungRepository
    {
        public GiongThuCungRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var giongThuCung = DbContext.GiongThuCungs.Find(id);
            if (giongThuCung != null) giongThuCung.TrangThai = !giongThuCung.TrangThai;
        }


        public IEnumerable<GiongThuCung> SearchWithKey(string keySearch)
        {
            return DbContext.GiongThuCungs.Where(x => x.TenGiongThuCung.Contains(keySearch));
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface ISucKhoeThuCungRepository : IRepository<SucKhoeThuCung>
    {
        void KhoaMo(int id);
        IEnumerable<SucKhoeThuCung> SearchWithKey(string keySearch);
    }
    public class SucKhoeThuCungRepository: RepositoryBase<SucKhoeThuCung>, ISucKhoeThuCungRepository
    {
        public SucKhoeThuCungRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var sucKhoeThuCung = DbContext.SucKhoeThuCungs.Find(id);
            if (sucKhoeThuCung != null) sucKhoeThuCung.TinhTrang = !sucKhoeThuCung.TinhTrang;
        }


        public IEnumerable<SucKhoeThuCung> SearchWithKey(string keySearch)
        {
            return DbContext.SucKhoeThuCungs.Where(x => x.MoTa.Contains(keySearch) || x.NoiDung.Contains(keySearch) || x.TenSKTC.Contains(keySearch));
        }
    }
}

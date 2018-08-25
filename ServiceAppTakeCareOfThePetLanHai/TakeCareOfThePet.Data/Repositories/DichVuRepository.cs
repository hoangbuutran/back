using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IDichVuRepository : IRepository<DichVu>
    {
        void KhoaMo(int id);
        IEnumerable<DichVu> SearchWithKey(string keySearch);
    }
    public class DichVuRepository: RepositoryBase<DichVu>, IDichVuRepository
    {
        public DichVuRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public void KhoaMo(int id)
        {
            var dichVu = DbContext.DichVus.Find(id);
            if (dichVu != null) dichVu.TinhTrang = !dichVu.TinhTrang;
        }


        public IEnumerable<DichVu> SearchWithKey(string keySearch)
        {
            return DbContext.DichVus.Where(x => x.MoTaDichVu.Contains(keySearch));
        }
    }
}

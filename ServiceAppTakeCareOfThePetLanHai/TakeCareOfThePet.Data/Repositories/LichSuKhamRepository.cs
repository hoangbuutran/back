using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface ILichSuKhamRepository : IRepository<LichSuKham>
    {
        IEnumerable<LichSuKham> SearchWithKey(string keySearch);
    }
    public class LichSuKhamRepository: RepositoryBase<LichSuKham>, ILichSuKhamRepository
    {
        public LichSuKhamRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }
        public IEnumerable<LichSuKham> SearchWithKey(string keySearch)
        {
            return DbContext.LichSuKhams.Where(x => x.TinhTrangBenh.Contains(keySearch));
        }
    }
}

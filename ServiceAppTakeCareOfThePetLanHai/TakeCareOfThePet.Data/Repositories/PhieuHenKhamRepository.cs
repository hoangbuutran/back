using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IPhieuHenKhamRepository : IRepository<PhieuHenKham>
    {
        List<PhieuHenKham> listPhieuVoiNgay(int idThuY, DateTime ngay);
    }
    public class PhieuHenKhamRepository: RepositoryBase<PhieuHenKham>, IPhieuHenKhamRepository
    {
        public PhieuHenKhamRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public List<PhieuHenKham> listPhieuVoiNgay(int idThuY, DateTime ngay)
        {
            return DbContext.PhieuHenKhams.Where(x => x.IdCoSoThuY == idThuY && x.NgayHenKham == ngay).ToList();
        }

    }
}

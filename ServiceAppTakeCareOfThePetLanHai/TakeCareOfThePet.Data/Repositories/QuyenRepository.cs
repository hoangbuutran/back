using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IQuyenRepository : IRepository<Quyen>
    {
        void KhoaMo(int id);
    }
    public class QuyenRepository : RepositoryBase<Quyen>, IQuyenRepository
    {
        public QuyenRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var quyen = DbContext.Quyens.Find(id);
            if (quyen != null) quyen.TrangThai = !quyen.TrangThai;
        }
    }
}

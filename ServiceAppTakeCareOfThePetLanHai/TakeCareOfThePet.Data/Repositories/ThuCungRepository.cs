using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IThuCungRepository : IRepository<ThuCung>
    {
        void KhoaMo(int id);
    }
    public class ThuCungRepository : RepositoryBase<ThuCung>, IThuCungRepository
    {
        public ThuCungRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var thuCung = DbContext.ThuCungs.Find(id);
            if (thuCung != null) thuCung.TrangThai = !thuCung.TrangThai;
        }
    }
}

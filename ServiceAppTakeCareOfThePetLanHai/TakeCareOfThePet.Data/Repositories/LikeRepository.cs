using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface ILikeRepository : IRepository<Like>
    {
        Like FindLike(int? idBaiViet, int? idNguoiDung);
    }
    public class LikeRepository : RepositoryBase<Like>, ILikeRepository
    {
        public LikeRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }

        public Like FindLike(int? idBaiViet, int? idNguoiDung)
        {
            Like like = null;
            like = DbContext.Likes.Where(x => x.IdBaiViet == idBaiViet && x.IdNguoiDung == idNguoiDung).SingleOrDefault();
            if (like != null)
            {
                return like;
            }
            return null;
        }
    }
}

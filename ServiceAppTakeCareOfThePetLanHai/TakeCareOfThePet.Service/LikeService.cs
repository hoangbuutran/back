using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface ILikeService
    {
        IEnumerable<Like> GetAllWithIdBaiViet(int id);
        void Like(Like like);
        void SaveChange();
    }
    public class LikeService : ILikeService
    {
        private readonly ILikeRepository _likeRepository;
        private readonly IBaiVietRepository _baiVietRepository;
        private readonly IUnitOfWork _unitOfWork;

        public LikeService(IBaiVietRepository baiVietRepository, ILikeRepository lieLikeRepository, IUnitOfWork unitOfWork)
        {
            _likeRepository = lieLikeRepository;
            _unitOfWork = unitOfWork;
            _baiVietRepository = baiVietRepository;
        }

        public IEnumerable<Like> GetAllWithIdBaiViet(int id)
        {
            return _likeRepository.GetMulti(x => x.IdBaiViet == id, new string[] { "NguoiDung" });
        }

        public void Like(Like like)
        {
            Like likeFind = _likeRepository.FindLike(like.IdBaiViet, like.IdNguoiDung);
            if (likeFind != null)
            {
                UnLike(likeFind);
            }
            else
            {
                BaiViet baiViet = _baiVietRepository.GetSingleById((int)like.IdBaiViet);
                baiViet.SoLike++;
                _unitOfWork.Commit();
                like.TinhTrang = true;
                _likeRepository.Add(like);
            }
        }

        public void UnLike(Like like)
        {
            if ((bool)like.TinhTrang)
            {
                BaiViet baiViet = _baiVietRepository.GetSingleById((int)like.IdBaiViet);
                baiViet.SoLike--;
                _unitOfWork.Commit();
            }
            else
            {
                BaiViet baiViet = _baiVietRepository.GetSingleById((int)like.IdBaiViet);
                baiViet.SoLike++;
                _unitOfWork.Commit();
            }
            like.TinhTrang = !like.TinhTrang;
            _likeRepository.Update(like);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }
    }
}

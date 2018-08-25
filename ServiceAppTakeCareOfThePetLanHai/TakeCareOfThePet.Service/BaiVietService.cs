using System.Collections.Generic;
using System.Linq;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface IBaiVietService
    {
        BaiViet GetById(int id);
        IEnumerable<BaiViet> GetAll();
        IEnumerable<BaiViet> GetAllSortDate();
        IEnumerable<BaiViet> BaiVietWithIdNguoiDung(int id);
        IEnumerable<BaiViet> BaiVietWithIdChuyenMuc(int id);
        int ListCountBaiViet();
        void Like(int id);
        BaiViet Add(BaiViet baiViet);
        void Update(BaiViet baiViet);
        BaiViet Delete(int id);
        void KhoaMo(int id);
        IEnumerable<BaiViet> GetAllSortDateLan2();
        void SaveChange();
    }
    public class BaiVietService : IBaiVietService
    {
        private readonly IBaiVietRepository _baiVietRepository;
        private readonly IUnitOfWork _unitOfWork;

        public BaiVietService(IBaiVietRepository baiVietRepository, IUnitOfWork unitOfWork)
        {
            _baiVietRepository = baiVietRepository;
            _unitOfWork = unitOfWork;
        }
        public BaiViet GetById(int id)
        {
            return _baiVietRepository.GetSingleByCondition(x => x.IdBaiViet == id, new string[] { "ChuyenMuc", "NguoiDung", "BinhLuans " });
        }

        public IEnumerable<BaiViet> GetAll()
        {
            return _baiVietRepository.GetAll(new string[] { "ChuyenMuc", "NguoiDung", "BinhLuans " });
        }

        public BaiViet Add(BaiViet baiViet)
        {
            return _baiVietRepository.Add(baiViet);
        }

        public void Update(BaiViet baiViet)
        {
            _baiVietRepository.Update(baiViet);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public BaiViet Delete(int id)
        {
            return _baiVietRepository.Delete(id);
        }


        public int ListCountBaiViet()
        {
            return _baiVietRepository.Count(x => x.TrangThai == true || x.TrangThai == false);
        }



        public IEnumerable<BaiViet> BaiVietWithIdNguoiDung(int id)
        {
            return _baiVietRepository.GetMulti(x => x.IdNguoiDung == id, new string[] { "ChuyenMuc", "NguoiDung", "BinhLuans " }).OrderByDescending(y => y.NgayDang);
        }


        public IEnumerable<BaiViet> BaiVietWithIdChuyenMuc(int id)
        {
            return _baiVietRepository.GetMulti(x => x.IdChuyenMuc == id, new string[] { "ChuyenMuc", "NguoiDung", "BinhLuans " }).OrderByDescending(y => y.NgayDang);
        }


        public void KhoaMo(int id)
        {
            _baiVietRepository.KhoaMo(id);
        }


        public IEnumerable<BaiViet> GetAllSortDate()
        {
            return _baiVietRepository.GetMulti(x => x.TrangThai == true, new string[] { "ChuyenMuc", "NguoiDung", "BinhLuans " }).OrderByDescending(x => x.NgayDang).ToList();
        }


        public void Like(int id)
        {
            _baiVietRepository.Like(id);
        }


        public IEnumerable<BaiViet> GetAllSortDateLan2()
        {
            return _baiVietRepository.GetAllSortDateLan2();
        }
    }
}

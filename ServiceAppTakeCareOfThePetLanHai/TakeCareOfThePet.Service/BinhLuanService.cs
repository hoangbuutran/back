using System.Collections.Generic;
using System.Linq;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface IBinhLuanService
    {
        BinhLuan GetById(int id);
        IEnumerable<BinhLuan> GetAll();
        IEnumerable<BinhLuan> BinhLuanWithIdBaiViet(int id);
        int ListCountBinhLuan();
        BinhLuan Add(BinhLuan binhLuan);
        void Update(BinhLuan binhLuan);
        void Like(int id);
        BinhLuan Delete(int id);
        void KhoaMo(int id);
        void SaveChange();
    }
    public class BinhLuanService : IBinhLuanService
    {
        private readonly IBinhLuanRepository _binhLuanRepository;
        private readonly IUnitOfWork _unitOfWork;

        public BinhLuanService(IBinhLuanRepository binhLuanRepository, IUnitOfWork unitOfWork)
        {
            _binhLuanRepository = binhLuanRepository;
            _unitOfWork = unitOfWork;
        }
        public BinhLuan GetById(int id)
        {
            return _binhLuanRepository.GetSingleById(id);
        }

        public IEnumerable<BinhLuan> GetAll()
        {
            return _binhLuanRepository.GetAll(new string[] { "BaiViet" });
        }

        public BinhLuan Add(BinhLuan binhLuan)
        {
            return _binhLuanRepository.Add(binhLuan);
        }

        public void Update(BinhLuan binhLuan)
        {
            _binhLuanRepository.Update(binhLuan);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public BinhLuan Delete(int id)
        {
            return _binhLuanRepository.Delete(id);
        }


        public int ListCountBinhLuan()
        {
            return _binhLuanRepository.Count(x => x.TrangThai == true || x.TrangThai == false);
        }



        public IEnumerable<BinhLuan> BinhLuanWithIdBaiViet(int id)
        {
            return _binhLuanRepository.GetMulti(x => x.IdBaiViet == id, new string[] { "NguoiDung" }).OrderByDescending(y => y.NgayBinhLuan);
        }


        public void Like(int id)
        {
            _binhLuanRepository.Like(id);
        }


        public void KhoaMo(int id)
        {
            _binhLuanRepository.KhoaMo(id);
        }
    }
}

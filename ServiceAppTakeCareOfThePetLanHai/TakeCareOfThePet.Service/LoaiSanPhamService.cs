using System.Collections.Generic;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface ILoaiSanPhamService
    {
        LoaiSanPham GetById(int id);
        IEnumerable<LoaiSanPham> GetAll();
        IEnumerable<LoaiSanPham> GetAllLoaiSanPhamWithSanPham();
        
        IEnumerable<LoaiSanPham> GetAllByIdShop(int id);
        IEnumerable<LoaiSanPham> GetAllByIdShopForTrue(int id);
        IEnumerable<LoaiSanPham> GetAllKeySearch(string keySearch);
        int ListCountLoaiSanPhamWithShop(int id);
        LoaiSanPham Add(LoaiSanPham loaiSanPham);
        void Update(LoaiSanPham loaiSanPham);
        void KhoaMo(int id);
        LoaiSanPham Delete(int id);
        void SaveChange();
    }
    public class LoaiSanPhamService : ILoaiSanPhamService
    {
        private readonly ILoaiSanPhamRepository _loaiSanPhamRepository;
        private readonly IUnitOfWork _unitOfWork;

        public LoaiSanPhamService(ILoaiSanPhamRepository loaiSanPhamRepository, IUnitOfWork unitOfWork)
        {
            _loaiSanPhamRepository = loaiSanPhamRepository;
            _unitOfWork = unitOfWork;
        }

        public LoaiSanPham GetById(int id)
        {
            return _loaiSanPhamRepository.GetSingleById(id);
        }

        public IEnumerable<LoaiSanPham> GetAll()
        {
            return _loaiSanPhamRepository.GetAll(new string[] { });
        }

        public LoaiSanPham Add(LoaiSanPham loaiSanPham)
        {
            return _loaiSanPhamRepository.Add(loaiSanPham);
        }

        public void Update(LoaiSanPham loaiSanPham)
        {
            _loaiSanPhamRepository.Update(loaiSanPham);
        }

        public void KhoaMo(int id)
        {
            _loaiSanPhamRepository.KhoaMo(id);
        }


        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public LoaiSanPham Delete(int id)
        {
            return _loaiSanPhamRepository.Delete(id);
        }

        public IEnumerable<LoaiSanPham> GetAllKeySearch(string keySearch)
        {
            return _loaiSanPhamRepository.SearchWithKey(keySearch);
        }

        public int ListCountLoaiSanPhamWithShop(int id)
        {
            return _loaiSanPhamRepository.Count(x => x.IdShop == id);
        }


        public IEnumerable<LoaiSanPham> GetAllByIdShop(int id)
        {
            return _loaiSanPhamRepository.GetMulti(x => x.IdShop == id);
        }


        public IEnumerable<LoaiSanPham> GetAllByIdShopForTrue(int id)
        {
            return _loaiSanPhamRepository.GetMulti(x => x.IdShop == id && x.TrangThai == true);
        }


        public IEnumerable<LoaiSanPham> GetAllLoaiSanPhamWithSanPham()
        {
            return _loaiSanPhamRepository.GetAll(new string[] { "SanPhams" });
        }
    }
}

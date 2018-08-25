using System.Collections.Generic;
using System.Linq;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface ISanPhamService
    {
        SanPham GetById(int id);
        IEnumerable<SanPham> GetAll();
        IEnumerable<SanPham> GetAllForTrue();
        int ListCountSanPhamWithShop(int idShop);
        SanPham Add(SanPham sanPham);
        IEnumerable<SanPham> GetAllForTrueToPage(int page, int pageSize);
        void Update(SanPham sanPham);
        IEnumerable<SanPham> GetAllByIdShop(int id);
        IEnumerable<SanPham> GetAllByIdShopForTrue(int id);
        IEnumerable<SanPham> GetAllByIdLoaiSanPham(int id);
        void KhoaMo(int id);
        SanPham Delete(int id);
        void SaveChange();
    }
    public class SanPhamService : ISanPhamService
    {
        private readonly ISanPhamRepository _sanPhamRepository;
        private readonly IUnitOfWork _unitOfWork;

        public SanPhamService(ISanPhamRepository sanPhamRepository, IUnitOfWork unitOfWork)
        {
            _sanPhamRepository = sanPhamRepository;
            _unitOfWork = unitOfWork;
        }

        public SanPham GetById(int id)
        {
            return _sanPhamRepository.GetSingleByCondition(x => x.IdSanPham == id, new string[] { "HinhAnhSanPhams" });
        }

        public IEnumerable<SanPham> GetAll()
        {
            return _sanPhamRepository.GetAll(new string[] {});
        }

        public SanPham Add(SanPham sanPham)
        {
            return _sanPhamRepository.Add(sanPham);
        }

        public void Update(SanPham sanPham)
        {
            _sanPhamRepository.Update(sanPham);
        }

        public void KhoaMo(int id)
        {
            _sanPhamRepository.KhoaMo(id);
        }


        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public SanPham Delete(int id)
        {
            return _sanPhamRepository.Delete(id);
        }


        public int ListCountSanPhamWithShop(int idShop)
        {
            return _sanPhamRepository.Count(x => x.IdShop == idShop);
        }


        public IEnumerable<SanPham> GetAllByIdShop(int id)
        {
            return _sanPhamRepository.GetMulti(x => x.IdShop == id, new string[] { }).OrderByDescending(y => y.NgayNhap);
        }


        public IEnumerable<SanPham> GetAllByIdLoaiSanPham(int id)
        {
            return _sanPhamRepository.GetMulti(x => x.IdLoaiSanPham == id, new string[] { }).OrderByDescending(y => y.NgayNhap);
        }


        public IEnumerable<SanPham> GetAllByIdShopForTrue(int id)
        {
            return _sanPhamRepository.GetMulti(x => x.IdShop == id && x.TrangThai == true, new string[] { }).OrderByDescending(y => y.NgayNhap);
        }


        public IEnumerable<SanPham> GetAllForTrue()
        {
            return _sanPhamRepository.GetMulti(x => x.TrangThai == true, new string[] { }).OrderByDescending(y => y.NgayNhap);
        }


        public IEnumerable<SanPham> GetAllForTrueToPage(int page, int pageSize)
        {
            throw new System.NotImplementedException();
        }
    }
}

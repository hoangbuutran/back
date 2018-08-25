using System.Collections.Generic;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface IHinhAnhSanPhamService
    {
        HinhAnhSanPham GetById(int id);
        IEnumerable<HinhAnhSanPham> GetAllWithIdSanPham(int id);
        HinhAnhSanPham Add(HinhAnhSanPham hinhAnhSanPham);
        void Update(HinhAnhSanPham hinhAnhSanPham);
        HinhAnhSanPham Delete(int id);
        void SaveChange();
    }
    public class HinhAnhSanPhamService : IHinhAnhSanPhamService
    {
        private readonly IHinhAnhSanPhamRepository _hinhAnhSanPhamRepository;
        private readonly IUnitOfWork _unitOfWork;

        public HinhAnhSanPhamService(IHinhAnhSanPhamRepository hinhAnhSanPhamRepository, IUnitOfWork unitOfWork)
        {
            _hinhAnhSanPhamRepository = hinhAnhSanPhamRepository;
            _unitOfWork = unitOfWork;
        }
        public HinhAnhSanPham GetById(int id)
        {
            return _hinhAnhSanPhamRepository.GetSingleById(id);
        }


        public HinhAnhSanPham Add(HinhAnhSanPham hinhAnhSanPham)
        {
            return _hinhAnhSanPhamRepository.Add(hinhAnhSanPham);
        }

        public void Update(HinhAnhSanPham hinhAnhSanPham)
        {
            _hinhAnhSanPhamRepository.Update(hinhAnhSanPham);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public HinhAnhSanPham Delete(int id)
        {
            return _hinhAnhSanPhamRepository.Delete(id);
        }


        public IEnumerable<HinhAnhSanPham> GetAllWithIdSanPham(int id)
        {
            return _hinhAnhSanPhamRepository.GetMulti(x => x.IdSanPham == id);
        }
    }
}

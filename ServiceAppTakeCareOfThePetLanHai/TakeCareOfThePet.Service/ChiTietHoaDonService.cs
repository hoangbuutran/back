using System.Collections.Generic;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface IChiTietHoaDonService
    {
        IEnumerable<ChiTietHoaDon> GetAllByIdHoaDon(int id);
        ChiTietHoaDon Add(ChiTietHoaDon chiTietHoaDon);
        ChiTietHoaDon Delete(int id);
        void SaveChange();
    }
    public class ChiTietHoaDonService : IChiTietHoaDonService
    {
        private readonly IChiTietHoaDonRepository _chiTietHoaDonRepository;
        private readonly IUnitOfWork _unitOfWork;

        public ChiTietHoaDonService(IChiTietHoaDonRepository chiTietHoaDonRepository, IUnitOfWork unitOfWork)
        {
            _chiTietHoaDonRepository = chiTietHoaDonRepository;
            _unitOfWork = unitOfWork;
        }

        public IEnumerable<ChiTietHoaDon> GetAllByIdHoaDon(int id)
        {
            return _chiTietHoaDonRepository.GetMulti(x => x.IdHoaDon == id, new string[] { "SanPham" });
        }

        public ChiTietHoaDon Add(ChiTietHoaDon chiTietHoaDon)
        {
            return _chiTietHoaDonRepository.Add(chiTietHoaDon);
        }


        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public ChiTietHoaDon Delete(int id)
        {
            return _chiTietHoaDonRepository.Delete(id);
        }
    }
}

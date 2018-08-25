using System.Collections.Generic;
using System.Linq;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface IHoaDonService
    {
        HoaDon GetById(int id);
        IEnumerable<HoaDon> GetAllByIdShop(int id);
        IEnumerable<HoaDon> GetAllByIdNguoiDung(int id);
        int ListCountHoaDonByIdShop(int id);
        HoaDon Add(HoaDon hoaDon);
        HoaDon Delete(int id);
        void Update(HoaDon hoaDon);
        void UpdateTrangThai(int id);        
        void SaveChange();
    }
    public class HoaDonService : IHoaDonService
    {
        private readonly IHoaDonRepository _hoaDonRepository;
        private readonly IUnitOfWork _unitOfWork;

        public HoaDonService(IHoaDonRepository hoaDonRepository, IUnitOfWork unitOfWork)
        {
            _hoaDonRepository = hoaDonRepository;
            _unitOfWork = unitOfWork;
        }

        public HoaDon GetById(int id)
        {
            return _hoaDonRepository.GetSingleByCondition(x => x.IdHoaDon == id, new string[] { "ChiTietHoaDons" });
        }

        public IEnumerable<HoaDon> GetAllByIdShop(int id)
        {
            return _hoaDonRepository.GetMulti(x => x.IdShop == id, new string[] { }).OrderByDescending(x => x.NgayLapHoaDon);
        }

        public HoaDon Add(HoaDon hoaDon)
        {
            return _hoaDonRepository.Add(hoaDon);
        }


        public void UpdateTrangThai(int id)
        {
            _hoaDonRepository.UpdateTrangThai(id);
        }


        public void SaveChange()
        {
            _unitOfWork.Commit();
        }


        public int ListCountHoaDonByIdShop(int id)
        {
            return _hoaDonRepository.Count(x => x.IdShop == id);
        }



        public void Update(HoaDon hoaDon)
        {
            _hoaDonRepository.Update(hoaDon);
        }


        public HoaDon Delete(int id)
        {
            return _hoaDonRepository.Delete(id);
        }


        public IEnumerable<HoaDon> GetAllByIdNguoiDung(int id)
        {
            return _hoaDonRepository.GetMulti(x => x.IdNguoiDung == id, new string[] { }).OrderByDescending(x => x.NgayLapHoaDon);
        }
    }
}

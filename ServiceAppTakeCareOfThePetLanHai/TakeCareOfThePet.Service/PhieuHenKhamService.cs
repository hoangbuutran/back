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
    public interface IPhieuHenKhamService
    {
        PhieuHenKham GetById(int id);
        IEnumerable<PhieuHenKham> GetAllWithIdCoSoThuY(int id);
        IEnumerable<PhieuHenKham> GetAllWithIdNguoiDung(int id);
        PhieuHenKham Add(PhieuHenKham phieuHenKham);
        void Update(PhieuHenKham phieuHenKham);
        void DuyetPhieuHenKham(int id);
        void TuChoiPhieuHenKham(int id);
        PhieuHenKham Delete(int id);
        List<PhieuHenKham> listPhieuVoiNgay(int idThuY, DateTime ngay);
        void SaveChange();
    }
    
    public class PhieuHenKhamService : IPhieuHenKhamService
    {
        private readonly IPhieuHenKhamRepository _phieuHenKhamRepository;
        private readonly IUnitOfWork _unitOfWork;
        private readonly ITaiKhoanService _taiKhoanService;
        private readonly INguoiDungService _nguoiDungService;
        public PhieuHenKhamService(IPhieuHenKhamRepository phieuHenKhamRepository, IUnitOfWork unitOfWork, ITaiKhoanService taiKhoanService, INguoiDungService nguoiDungService)
        {
            _phieuHenKhamRepository = phieuHenKhamRepository;
            _unitOfWork = unitOfWork;
            _taiKhoanService = taiKhoanService;
            _nguoiDungService = nguoiDungService;
        }

        public PhieuHenKham GetById(int id)
        {
            return _phieuHenKhamRepository.GetSingleByCondition(x => x.IdLichHenKham == id, new string[] { });
        }

        public IEnumerable<PhieuHenKham> GetAllWithIdCoSoThuY(int id)
        {
            return _phieuHenKhamRepository.GetMulti(x => x.IdCoSoThuY == id, new string[] { }).OrderByDescending(x => x.NgayHenKham);
        }

        public IEnumerable<PhieuHenKham> GetAllWithIdNguoiDung(int id)
        {
            return _phieuHenKhamRepository.GetMulti(x => x.IdNguoiDung == id, new string[] { }).OrderByDescending(x => x.NgayHenKham);
        }

        public PhieuHenKham Add(PhieuHenKham phieuHenKham)
        {
            phieuHenKham.TinhTrang = false;
            return _phieuHenKhamRepository.Add(phieuHenKham);
        }

        public void Update(PhieuHenKham phieuHenKham)
        {
            phieuHenKham.TinhTrang = false;
            _phieuHenKhamRepository.Update(phieuHenKham);
        }

        public void DuyetPhieuHenKham(int id)
        {
            PhieuHenKham phieuHenKhamModel = _phieuHenKhamRepository.GetSingleById(id);
            if (phieuHenKhamModel.IdNguoiDung != null)
            {
                phieuHenKhamModel.TinhTrang = true;
                var nguoiDungModel = _nguoiDungService.GetById((int)phieuHenKhamModel.IdNguoiDung);
                var content = "Phiếu hẹn khám của quý khách đã được thông qua" +
                              "mời quý khách ngày: " + phieuHenKhamModel.NgayHenKham + "," +
                              " vào lúc: " + phieuHenKhamModel.GioHenKham + " giờ," +
                              " đến cơ sở của chúng tôi để thăm khám cho thú y của quý khách";
                _taiKhoanService.SenEmail(nguoiDungModel.Email, "Email from TakeCareOfThePetService", content);
                _phieuHenKhamRepository.Update(phieuHenKhamModel);
            }
        }

        public void TuChoiPhieuHenKham(int id)
        {
            PhieuHenKham phieuHenKhamModel = _phieuHenKhamRepository.GetSingleById(id);
            if (phieuHenKhamModel.IdNguoiDung != null)
            {
                var nguoiDungModel = _nguoiDungService.GetById((int)phieuHenKhamModel.IdNguoiDung);
                var content = "Phiếu hẹn khám của quý khách" +
                              " ngày: " + phieuHenKhamModel.NgayHenKham + "," +
                              " lúc: " + phieuHenKhamModel.GioHenKham + " giờ," +
                              " không được thông qua vì một số lý do của cơ sở thú y";
                _taiKhoanService.SenEmail(nguoiDungModel.Email, "Email from TakeCareOfThePetService", content);
                Delete(phieuHenKhamModel.IdLichHenKham);
            }
        }

        public PhieuHenKham Delete(int id)
        {
            return _phieuHenKhamRepository.Delete(id);
        }

        public List<PhieuHenKham> listPhieuVoiNgay(int idThuY, DateTime ngay)
        {
            return _phieuHenKhamRepository.listPhieuVoiNgay(int idThuY, DateTime ngay);
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }
    }
}

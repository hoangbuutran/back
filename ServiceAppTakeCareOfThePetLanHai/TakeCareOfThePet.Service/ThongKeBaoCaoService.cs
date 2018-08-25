using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Common.ModelChung;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Repositories;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Service
{
    public interface IThongKeBaoCaoService
    {
        IEnumerable<ThongKeTheoSanPham> Lay_Ra_5_San_Pham_Max_Trong_Ngay(int idShop);
        IEnumerable<ThongKeTheoSanPham> Lay_Ra_10_San_Pham_Max_Trong_Thang(DateTime ngay, int idShop);
        IEnumerable<HoaDon> Hoa_Don_Theo_Thang(DateTime ngayThang, int idShop);
        IEnumerable<HoaDon> Hoa_Don_Trong_Khoang_Thang(DateTime tuThang, DateTime denThang, int idShop);
        void SaveChange();
    }
    public class ThongKeBaoCaoService : IThongKeBaoCaoService
    {
        private readonly IThongKeBaoCaoRepository _thongKeBaoCaoRepository;
        private readonly IUnitOfWork _unitOfWork;

        public ThongKeBaoCaoService(IThongKeBaoCaoRepository thongKeBaoCaoRepository, IUnitOfWork unitOfWork)
        {
            _thongKeBaoCaoRepository = thongKeBaoCaoRepository;
            _unitOfWork = unitOfWork;
        }

        public void SaveChange()
        {
            _unitOfWork.Commit();
        }

        public IEnumerable<ThongKeTheoSanPham> Lay_Ra_5_San_Pham_Max_Trong_Ngay(int idShop)
        {
            DateTime ngayNow = DateTime.Now;
            return _thongKeBaoCaoRepository.Lay_Ra_5_San_Pham_Max_Trong_Ngay(ngayNow, idShop);
        }


        public IEnumerable<ThongKeTheoSanPham> Lay_Ra_10_San_Pham_Max_Trong_Thang(DateTime ngay, int idShop)
        {
            int soThang = ngay.Month;
            return _thongKeBaoCaoRepository.Lay_Ra_10_San_Pham_Max_Trong_Thang(soThang, idShop);
        }

        public IEnumerable<HoaDon> Hoa_Don_Theo_Thang(DateTime ngayThang, int idShop)
        {
            int soThang = ngayThang.Month;
            return _thongKeBaoCaoRepository.Hoa_Don_Theo_Thang(soThang, idShop);
        }


        public IEnumerable<HoaDon> Hoa_Don_Trong_Khoang_Thang(DateTime tuThang, DateTime denThang, int idShop)
        {
            int tu = tuThang.Month;
            int den = denThang.Month;
            return _thongKeBaoCaoRepository.Hoa_Don_Trong_Khoang_Thang(tu, den, idShop);
        }
    }
}

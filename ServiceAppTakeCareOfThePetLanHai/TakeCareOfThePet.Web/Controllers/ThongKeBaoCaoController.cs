using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using TakeCareOfThePet.Common.ModelChung;
using TakeCareOfThePet.Model.Models;
using TakeCareOfThePet.Service;
using TakeCareOfThePet.Web.Infrastructure.Core;

namespace TakeCareOfThePet.Web.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/thongkebaocao")]
    public class ThongKeBaoCaoController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly IThongKeBaoCaoService _thongKeBaoCaoService;
        public ThongKeBaoCaoController(IErrorService errorService, IThongKeBaoCaoService thongKeBaoCaoService)
            : base(errorService)
        {
            _thongKeBaoCaoService = thongKeBaoCaoService;
        }
        #endregion

        [Route("Lay_Ra_5_San_Pham_Max_Trong_Ngay/{idShop:int}")]
        [HttpGet]
        public HttpResponseMessage Lay_Ra_5_San_Pham_Max_Trong_Ngay(HttpRequestMessage request, int idShop)
        {
            IEnumerable<ThongKeTheoSanPham> listThongKeTheoSanPhams = null;
            var toTal = 0;
            try
            {
                listThongKeTheoSanPhams = _thongKeBaoCaoService.Lay_Ra_5_San_Pham_Max_Trong_Ngay(idShop);
                toTal = listThongKeTheoSanPhams.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách 5 sản phẩm bán nhiều nhất trong ngày";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại sản phẩm nào bán trong ngày");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listThongKeTheoSanPhams);
        }

        [Route("Lay_Ra_10_San_Pham_Max_Trong_Thang/{idShop:int}")]
        [HttpPost]
        public HttpResponseMessage Lay_Ra_10_San_Pham_Max_Trong_Thang(HttpRequestMessage request, int idShop, ThongKeSanPham10SPMax thongKeSanPham10SpMax)
        {
            IEnumerable<ThongKeTheoSanPham> listThongKeTheoSanPhams = null;
            var toTal = 0;
            try
            {
                listThongKeTheoSanPhams = _thongKeBaoCaoService.Lay_Ra_10_San_Pham_Max_Trong_Thang(thongKeSanPham10SpMax.NgayThang, idShop);
                toTal = listThongKeTheoSanPhams.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách 10 sản phẩm bán nhiều nhất trong thang";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại sản phẩm nào bán trong thang");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listThongKeTheoSanPhams);
        }

        [Route("Hoa_Don_Trong_Thang/{idShop:int}")]
        [HttpPost]
        public HttpResponseMessage Hoa_Don_Trong_Khoang_Thang(HttpRequestMessage request, int idShop, ThongKeHoaDon thongKeHoaDon)
        {
            IEnumerable<HoaDon> listThongKeTheoSanPhams = null;
            var toTal = 0;
            try
            {
                listThongKeTheoSanPhams = _thongKeBaoCaoService.Hoa_Don_Trong_Khoang_Thang(thongKeHoaDon.TuNgay, thongKeHoaDon.DenNgay, idShop);
                toTal = listThongKeTheoSanPhams.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách hóa đơn trong khoảng tháng đó";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại hóa đơn nào bán trong khoảng tháng đó");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listThongKeTheoSanPhams);
        }


        [Route("Hoa_Don_Theo_Thang/{idShop:int}")]
        [HttpPost]
        public HttpResponseMessage Hoa_Don_Theo_Thang(HttpRequestMessage request, int idShop, ThongKeHoaDon thongKeHoaDon)
        {
            IEnumerable<HoaDon> listThongKeTheoSanPhams = null;
            var toTal = 0;
            try
            {
                listThongKeTheoSanPhams = _thongKeBaoCaoService.Hoa_Don_Theo_Thang(thongKeHoaDon.TuNgay, idShop);
                toTal = listThongKeTheoSanPhams.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách hóa đơn trong thang";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại hóa đơn nào bán trong thang");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listThongKeTheoSanPhams);
        }
    }
}

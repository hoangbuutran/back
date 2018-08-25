using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using TakeCareOfThePet.Model.Models;
using TakeCareOfThePet.Service;
using TakeCareOfThePet.Web.Infrastructure.Core;

namespace TakeCareOfThePet.Web.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/hoadon")]
    public class HoaDonController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly IHoaDonService _hoaDonService;
        private readonly IChiTietHoaDonService _chiTietHoaDonService;
        private readonly ISanPhamService _sanPhamService;
        private readonly INguoiDungService _nguoiDungService;
        private readonly ITaiKhoanService _taiKhoanService;
        public HoaDonController(
            IErrorService errorService,
            IHoaDonService hoaDonService,
            IChiTietHoaDonService chiTietHoaDonService,
            ISanPhamService sanPhamService,
            INguoiDungService nguoiDungService,
            ITaiKhoanService taiKhoanService
            )
            : base(errorService)
        {
            _hoaDonService = hoaDonService;
            _chiTietHoaDonService = chiTietHoaDonService;
            _sanPhamService = sanPhamService;
            _nguoiDungService = nguoiDungService;
            _taiKhoanService = taiKhoanService;
        }
        #endregion

        #region getbyid
        [Route("getbyid/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request, int id)
        {
            HoaDon hoaDonSinger = null;
            try
            {
                hoaDonSinger = _hoaDonService.GetById(id);
                if (hoaDonSinger != null)
                {
                    Message = "thông tin hóa đơn";
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tồn tại hóa đơn với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, hoaDonSinger);
        }
        #endregion

        #region getallcthdbyidhoadon
        [Route("getallcthdbyidhoadon/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllChiTietHoaDonByIdHoaDon(HttpRequestMessage request, int id)
        {
            IEnumerable<ChiTietHoaDon> listCthoaDon = null;
            var count = 0;
            try
            {
                listCthoaDon = _chiTietHoaDonService.GetAllByIdHoaDon(id);
                count = listCthoaDon.ToList().Count;
                if (count > 0)
                {
                    Message = "danh sach hang trong hoa don";
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tồn tại hang trong hóa đơn với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, count, listCthoaDon);
        }
        #endregion

        #region getallbyidshop
        [Route("getallbyidshop/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllByIdShop(HttpRequestMessage request, int id)
        {
            IEnumerable<HoaDon> listHoaDon = null;
            var toTal = 0;
            try
            {
                listHoaDon = _hoaDonService.GetAllByIdShop(id);
                toTal = listHoaDon.ToList().Count;
                if (toTal > 0)
                {
                    Message = "thông tin hóa đơn";
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tồn tại hóa đơn với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listHoaDon);
        }
        #endregion

        #region GetAllByIdNguoiDung
        [Route("getallbyidnguoidung/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllByIdNguoiDung(HttpRequestMessage request, int id)
        {
            IEnumerable<HoaDon> listHoaDon = null;
            var toTal = 0;
            try
            {
                listHoaDon = _hoaDonService.GetAllByIdNguoiDung(id);
                toTal = listHoaDon.ToList().Count;
                if (toTal > 0)
                {
                    Message = "danh sách hóa đơn với id người dùng";
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tồn tại danh sách hóa đơn với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listHoaDon);
        }
        #endregion

        #region listcounthoadonshop
        [Route("listcounthoadonshop/{id:int}")]
        [HttpGet]
        public HttpResponseMessage ListCountHoaDonByIdShop(HttpRequestMessage request, int id)
        {
            var listCount = 0;
            try
            {
                listCount = _hoaDonService.ListCountHoaDonByIdShop(id);
                Message = "số lượng hóa đơn";
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, listCount, listCount);
        }
        #endregion

        //#region checkcthoadon
        //[Route("checkcthoadon")]
        //[HttpPost]
        //public HttpResponseMessage CheckCtHoaDon(HttpRequestMessage request, ChiTietHoaDon[] chiTietHoaDon)
        //{
        //    var trangThai = new bool[chiTietHoaDon.Length];
        //    var tenSanPham = new string[chiTietHoaDon.Length];
        //    var mess = "sản phẩm ";
        //    try
        //    {
        //        var i = 0;
        //        foreach (var item in chiTietHoaDon)
        //        {
        //            trangThai[i] = true;
        //            if (item.IdSanPham != null)
        //            {
        //                var sanPham = _sanPhamService.GetById((int)item.IdSanPham);
        //                if (sanPham.SoLuong < item.SoLuong)
        //                {
        //                    trangThai[i] = false;
        //                    tenSanPham[i] = sanPham.TenSanPham;
        //                }
        //            }
        //            i++;
        //        }

        //        var cout = 0;
        //        for (var j = 0; j < trangThai.Length; j++)
        //        {
        //            if (trangThai[j]) continue;
        //            cout++;
        //            mess += tenSanPham[j] + " ";
        //        }
        //        mess += "không đủ số lượng để mua";
        //        if (cout == 0)
        //        {
        //            Message = "Hóa đơn được thông qua";
        //        }
        //        else
        //        {
        //            Message = mess;
        //            IsSuccess = false;
        //        }
        //    }
        //    catch (DbEntityValidationException ex)
        //    {
        //        LogException(ex);
        //    }
        //    return GetResponseMessage(IsSuccess, Message, 1, null);
        //}
        //#endregion

        #region checkcthoadon
        [Route("checkcthoadonandcreatehoadon/{IdNguoiDung:int}")]
        [HttpPost]
        public HttpResponseMessage CheckCtHoaDonAndCreareHoaDon(HttpRequestMessage request, ChiTietHoaDon[] chiTietHoaDon, int idNguoiDung)
        {
            // kiểm tra danh sách sản phẩm có bị thiếu hàng hay không
            var trangThai = new bool[chiTietHoaDon.Length];
            var tenSanPham = new string[chiTietHoaDon.Length];
            IList<SanPham> listSanPhams = new List<SanPham>();
            var mess = "sản phẩm ";
            try
            {
                var i = 0;
                foreach (var item in chiTietHoaDon)
                {
                    trangThai[i] = true;
                    if (item.IdSanPham != null)
                    {
                        var sanPham = _sanPhamService.GetById((int)item.IdSanPham);
                        listSanPhams.Add(sanPham);
                        if (sanPham.SoLuong < item.SoLuong)
                        {
                            trangThai[i] = false;
                            tenSanPham[i] = sanPham.TenSanPham;
                        }
                    }
                    i++;
                }

                var cout = 0;
                for (var j = 0; j < trangThai.Length; j++)
                {
                    if (trangThai[j]) continue;
                    cout++;
                    mess += tenSanPham[j] + " ";
                }
                mess += "không đủ số lượng để mua";
                if (cout == 0)
                {
                    // lấy ra danh sách các shop
                    int[] mangShop = new int[listSanPhams.Count];
                    int k = 0;
                    foreach (var listSanPham in listSanPhams)
                    {
                        if (listSanPham.IdShop != null) mangShop[k] = (int)listSanPham.IdShop;
                        k++;
                    }
                    // gộp id shop trùng lại với nhau
                    IList<int> mangShopSort = new List<int>();
                    for (int j = 0; j < mangShop.Length; j++)
                    {
                        int countmang = 0;
                        foreach (var t in mangShopSort)
                        {
                            if (mangShop[j] == t)
                            {
                                countmang++;
                            }
                        }
                        if (countmang == 0)
                        {
                            mangShopSort.Add(mangShop[j]);
                        }
                    }

                    // có id shop rồi thì tạo hóa đơn tương ứng
                    foreach (var item1 in mangShopSort)
                    {
                        var hoadon = new HoaDon()
                        {
                            IdNguoiDung = idNguoiDung,
                            IdShop = item1,
                            NgayLapHoaDon = DateTime.Now,
                            TrangThai = false,
                        };
                        HoaDon hoaDon = _hoaDonService.Add(hoadon);
                        _hoaDonService.SaveChange();
                        double tongGia = 0;
                        foreach (var item2 in chiTietHoaDon)
                        {
                            if (item2.IdSanPham != null)
                            {
                                var sanPham = _sanPhamService.GetById((int)item2.IdSanPham);
                                if (sanPham.IdShop == item1)
                                {
                                    item2.IdHoaDon = hoaDon.IdHoaDon;
                                    if (item2.Gia != null)
                                        if (item2.SoLuong != null)
                                            tongGia += (double)item2.Gia * (int)item2.SoLuong;
                                    _chiTietHoaDonService.Add(item2);
                                    _chiTietHoaDonService.SaveChange();
                                }
                            }
                        }

                        hoaDon.TongGia = tongGia;
                        _hoaDonService.Update(hoaDon);
                        _hoaDonService.SaveChange();

                        var listCthoaDon = _chiTietHoaDonService.GetAllByIdHoaDon(hoaDon.IdHoaDon);
                        foreach (var item in listCthoaDon)
                        {
                            if (item.IdSanPham == null) continue;
                            var sanPham = _sanPhamService.GetById((int)item.IdSanPham);
                            if (sanPham.SoLuong == null) continue;
                            var soLuong = (int)sanPham.SoLuong;
                            sanPham.SoLuong = soLuong - item.SoLuong;
                        }
                        _hoaDonService.SaveChange();
                    }
                    _hoaDonService.SaveChange();
                    Message = "Hóa đơn được thông qua";
                }
                else
                {
                    Message = mess;
                    IsSuccess = false;
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, null);
        }
        #endregion

        #region HuyDonHangForShop
        [Route("huydonhangforshop/{id:int}")]
        [HttpGet]
        public HttpResponseMessage HuyDonHangForShop(HttpRequestMessage request, int id)
        {
            HoaDon modelHoaDon = _hoaDonService.GetById(id);
            if (modelHoaDon.IdNguoiDung != null)
            {
                int idNguoiDung = (int)modelHoaDon.IdNguoiDung;
                try
                {
                    var listCthoaDon = _chiTietHoaDonService.GetAllByIdHoaDon(id);
                    var chiTietHoaDons = listCthoaDon as ChiTietHoaDon[] ?? listCthoaDon.ToArray();
                    foreach (var item in chiTietHoaDons)
                    {
                        if (item.IdSanPham == null) continue;
                        var sanPham = _sanPhamService.GetById((int)item.IdSanPham);
                        if (sanPham.SoLuong == null) continue;
                        var soLuong = (int)sanPham.SoLuong;
                        sanPham.SoLuong = soLuong + item.SoLuong;
                    }
                    _hoaDonService.SaveChange();
                    foreach (ChiTietHoaDon chiTietHoaDon in chiTietHoaDons)
                    {
                        _chiTietHoaDonService.Delete(chiTietHoaDon.IdCTHoaDon);
                    }
                    _hoaDonService.SaveChange();
                    _hoaDonService.Delete(id);
                    _hoaDonService.SaveChange();
                    {
                        var nguoiDung = _nguoiDungService.GetById(idNguoiDung);
                        var toEmail = nguoiDung.Email;
                        var content = "Hóa đơn của quý khách mua vào thời gian " + modelHoaDon.NgayLapHoaDon + " đã được admin từ chối, vì một số lý do nhất định, mong quý khách thông cảm";
                        _taiKhoanService.SenEmail(toEmail, "Email from TakeCareOfThePetService", content);
                        Message = "Hủy hóa đơn thành công";
                    }
                }
                catch (DbEntityValidationException ex)
                {
                    LogException(ex);
                }
            }

            return GetResponseMessage(IsSuccess, Message, 1, modelHoaDon);

        }
        #endregion

        #region HuyDonHangForNguoiDung
        [Route("huydonhangfornguoidung/{id:int}")]
        [HttpGet]
        public HttpResponseMessage HuyDonHangForNguoiDung(HttpRequestMessage request, int id)
        {
            try
            {
                var listCthoaDon = _chiTietHoaDonService.GetAllByIdHoaDon(id);
                var chiTietHoaDons = listCthoaDon as ChiTietHoaDon[] ?? listCthoaDon.ToArray();
                foreach (var item in chiTietHoaDons)
                {
                    if (item.IdSanPham == null) continue;
                    var sanPham = _sanPhamService.GetById((int)item.IdSanPham);
                    if (sanPham.SoLuong == null) continue;
                    var soLuong = (int)sanPham.SoLuong;
                    sanPham.SoLuong = soLuong + item.SoLuong;
                }
                _hoaDonService.SaveChange();
                foreach (ChiTietHoaDon chiTietHoaDon in chiTietHoaDons)
                {
                    _chiTietHoaDonService.Delete(chiTietHoaDon.IdCTHoaDon);
                }
                _hoaDonService.SaveChange();
                _hoaDonService.Delete(id);
                _hoaDonService.SaveChange();
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, null);

        }
        #endregion

        #region UpdateTrangThai
        [Route("updatetrangthai/{id:int}")]
        [HttpGet]
        public HttpResponseMessage UpdateTrangThai(HttpRequestMessage request, int id)
        {
            HoaDon modelHoaDon = null;
            try
            {
                _hoaDonService.UpdateTrangThai(id);
                _hoaDonService.SaveChange();
                modelHoaDon = _hoaDonService.GetById(id);
                if (modelHoaDon != null)
                {
                    if (modelHoaDon.TrangThai != null && (bool)modelHoaDon.TrangThai)
                    {
                        if (modelHoaDon.IdNguoiDung != null)
                        {
                            var nguoiDung = _nguoiDungService.GetById((int)modelHoaDon.IdNguoiDung);
                            var toEmail = nguoiDung.Email;
                            var content = "Hóa đơn của quý khách đã được admin duyệt, hàng hóa sẻ được giao hàng trong thời gian sớm nhất, tổng giá trị hóa đơn là " + modelHoaDon.TongGia;
                            _taiKhoanService.SenEmail(toEmail, "Email from TakeCareOfThePetService", content);
                        }

                        Message = "Mở hóa đơn thành công";
                    }
                    else
                    {
                        Message = "Khóa hóa đơn thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở hóa đơn không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelHoaDon);

        }
        #endregion
    }
}

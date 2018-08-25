using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using TakeCareOfThePet.Common.ModelChung;
using TakeCareOfThePet.Model.Models;
using TakeCareOfThePet.Service;
using TakeCareOfThePet.Web.Infrastructure.Core;

namespace TakeCareOfThePet.Web.Controllers
{
    #region api/shop
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/shop")]
    public class ShopController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly IShopService _shopService;
        private readonly ITaiKhoanService _taiKhoanService;
        public ShopController(IErrorService errorService, IShopService shopService, ITaiKhoanService taiKhoanService)
            : base(errorService)
        {
            _shopService = shopService;
            _taiKhoanService = taiKhoanService;
        }
        #endregion

        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {
            IEnumerable<Shop> listShop = null;
            var toTal = 0;
            try
            {
                listShop = _shopService.GetAll();
                toTal = listShop.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách shop";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại shop nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listShop);
        }
        #endregion

        #region chuapheduyet
        [Route("chuapheduyet")]
        [HttpGet]
        public HttpResponseMessage ChuaPheDuyet(HttpRequestMessage request)
        {
            IEnumerable<Shop> listShop = null;
            var toTal = 0;
            try
            {
                listShop = _shopService.GetAllChuaDuyet();
                toTal = listShop.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách shop chưa phê duyệt";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại shop nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listShop);
        }
        #endregion


        [Route("listcountShop")]
        [HttpGet]
        public HttpResponseMessage ListCountShop(HttpRequestMessage request)
        {
            var listCount = 0;
            try
            {
                listCount = _shopService.ListCountShop();
                Message = "số lượng shop";
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, listCount, listCount);
        }

        #region getbyid
        [Route("getbyid/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            Shop shopSingler = null;
            try
            {
                shopSingler = _shopService.GetById(id);
                if (shopSingler != null)
                {
                    Message = "Thông tin shop với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được shop với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, shopSingler);
        }
        #endregion

        #region getbyid
        [Route("getbyidtaikhoan/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetByIdTaiKhoan(HttpRequestMessage request, int id)
        {
            Shop shopSingler = null;
            try
            {
                shopSingler = _shopService.GetByIdTaiKhoan(id);
                if (shopSingler != null)
                {
                    Message = "Thông tin shop với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được shop với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, shopSingler);
        }
        #endregion

        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, Shop shop)
        {
            Shop modelShop = null;
            try
            {
                var tenTaiKhoan1 = shop.TenShop.ToLower();
                var tenTaiKhoan2 = _shopService.ThayDoiChuoi(tenTaiKhoan1);
                var tenTaiKhoan3 = tenTaiKhoan2.Replace(" ", "");
                var pass = shop.SDT.Substring(shop.SDT.Length == 11 ? 7 : 6);

                var taikhoan = new TaiKhoan
                {
                    UserName = tenTaiKhoan3,
                    Pass = pass,
                    IdQuyen = 4,// quyen shop
                    TrangThai = true,
                };
                var taiKhoan = _taiKhoanService.Add(taikhoan);
                _shopService.SaveChange();
                if (taiKhoan.IdTaiKhoan != 0)
                {
                    shop.IdTaiKhoan = taikhoan.IdTaiKhoan;
                    shop.PheDuyet = false;
                    if (shop.DongYChinhSach == null)
                    {
                        shop.DongYChinhSach = false;
                    }
                    modelShop = _shopService.Add(shop);
                    _shopService.SaveChange();
                    if (modelShop != null)
                    {
                        Message = "Tạo mới shop và tài khoản thành công thành công";
                        _taiKhoanService.SaveChange();
                    }
                }
                if (modelShop != null)
                {
                    Message = "Tạo mới shop thành công";
                    _shopService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo mới shop không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelShop);
        }
        #endregion

        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {

            Shop modelShop = null;
            try
            {
                _shopService.KhoaMo(id);
                _shopService.SaveChange();
                modelShop = _shopService.GetById(id);
                if (modelShop != null)
                {
                    if (modelShop.TrangThai != null && (bool)modelShop.TrangThai)
                    {
                        Message = "Mở shop thành công";
                    }
                    else
                    {
                        Message = "Khóa shop thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở shop không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelShop);
        }
        #endregion

        #region duyetshop
        [Route("duyet/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Duyet(HttpRequestMessage request, int id)
        {
            Shop shopModel = null;
            
            try
            {
                shopModel = _shopService.Duyet(id);
                _shopService.SaveChange();
                TaiKhoan taiKhoan = _taiKhoanService.GetById((int)shopModel.IdTaiKhoan);
                var toEmail = shopModel.Email;
                var content = "Tài khoản đăng ký shop của quý khách đã được admin duyệt,tài khoản đăng nhập shop của quý khách là: UserName: " + taiKhoan.UserName + ", Pass: " + taiKhoan.Pass + ", ";
                _taiKhoanService.SenEmail(toEmail, "Email from TakeCareOfThePetService", content);
                Message = "Duyệt shop thành công";
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, null);
        }
        #endregion

        #region tuchoishop
        [Route("tuchoi/{id:int}")]
        [HttpGet]
        public HttpResponseMessage TuChoi(HttpRequestMessage request, int id)
        {
            Shop shopModel = null;

            try
            {
                shopModel = _shopService.Xoa(id);
                _shopService.SaveChange();
                
                var toEmail = shopModel.Email;
                var content = "Tài khoản đăng ký shop của quý khách đã được admin từ chối";
                _taiKhoanService.SenEmail(toEmail, "Email from TakeCareOfThePetService", content);

                Message = "Xóa shop thành công";
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, null);
        }
        #endregion


        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, Shop shop)
        {
            Shop modelShop = null;
            try
            {
                _shopService.Update(shop);
                _shopService.SaveChange();
                modelShop = _shopService.GetById(shop.IdShop);
                if (modelShop != null)
                {
                    Message = "Sửa thông tin shop thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin shop không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelShop);
        }
        #endregion


        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            Shop modelShop = null;
            try
            {
                modelShop = _shopService.GetById(id);
                if (modelShop.IdTaiKhoan != null) _taiKhoanService.Delete((int)modelShop.IdTaiKhoan);
                _shopService.SaveChange();
                modelShop = _shopService.Delete(id);
                _shopService.SaveChange();
                if (modelShop != null)
                {
                    Message = "Xóa shop thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa shop không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelShop);
        }
        #endregion

    }
    #endregion
}

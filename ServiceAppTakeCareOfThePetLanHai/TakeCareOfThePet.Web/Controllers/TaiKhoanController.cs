using TakeCareOfThePet.Model.Models;
using TakeCareOfThePet.Service;
using TakeCareOfThePet.Web.Infrastructure.Core;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using TakeCareOfThePet.Common.ModelChung;
using System.Data.Entity.Validation;
using System.Linq;

namespace TakeCareOfThePet.Web.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/taikhoan")]
    public class TaiKhoanController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly ITaiKhoanService _taiKhoanService;
        private readonly INguoiDungService _nguoiDungService;
        private readonly ICoSoThuYService _coSoThuYService;
        private readonly IShopService _shopService;
        public TaiKhoanController(IErrorService errorService, ITaiKhoanService taiKhoanService, INguoiDungService nguoiDungService, ICoSoThuYService coSoThuYService, IShopService shopService)
            : base(errorService)
        {
            _taiKhoanService = taiKhoanService;
            _nguoiDungService = nguoiDungService;
            _coSoThuYService = coSoThuYService;
            _shopService = shopService;
        }
        #endregion

        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {
            IEnumerable<TaiKhoan> listTaiKhoan = null;
            var toTal = 0;
            try
            {
                listTaiKhoan = _taiKhoanService.GetAll();
                toTal = listTaiKhoan.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách tài khoản";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại tài khoản nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listTaiKhoan);
        }


        [Route("sendmailforgotpasss")]
        [HttpPost]
        public HttpResponseMessage SendEmailViaWebApi(HttpRequestMessage request, SendEmailModel emailModel)
        {
            try
            {
                var listNguoiDung = _nguoiDungService.GetAllCoEmail(emailModel.Email);
                var listCoSoThuY = _coSoThuYService.GetAllCoEmail(emailModel.Email);
                var listShop = _shopService.GetAllCoEmail(emailModel.Email);
                var checkCout = 0;
                if (listNguoiDung.Count() > 0)
                {
                    foreach (var item in listNguoiDung)
                    {
                        if (!item.Email.Equals(emailModel.Email)) continue;
                        checkCout++;
                        var toEmail = emailModel.Email;
                        if (item.IdTaiKhoan != null)
                        {
                            var taiKhoanModel = _taiKhoanService.GetById((int)item.IdTaiKhoan);
                            var content = "The login password is for you: " + "\"" + taiKhoanModel.Pass + "\"";
                            _taiKhoanService.SenEmail(toEmail, "Email from TakeCareOfThePetService", content);
                        }
                        Message = "pass đã được cấp lại";
                    }
                }

                if (listCoSoThuY.Count() > 0)
                {
                    foreach (var item in listCoSoThuY)
                    {
                        if (!item.Email.Equals(emailModel.Email)) continue;
                        checkCout++;
                        var toEmail = emailModel.Email;
                        if (item.IdTaiKhoan != null)
                        {
                            var taiKhoanModel = _taiKhoanService.GetById((int)item.IdTaiKhoan);
                            var content = "The login password is for you: " + "\"" + taiKhoanModel.Pass + "\"";
                            _taiKhoanService.SenEmail(toEmail, "Email from TakeCareOfThePetService", content);
                        }

                        Message = "pass đã được cấp lại";
                    }
                }

                if (listShop.Count() > 0)
                {
                    foreach (var item in listShop)
                    {
                        if (!item.Email.Equals(emailModel.Email)) continue;
                        checkCout++;
                        var toEmail = emailModel.Email;
                        if (item.IdTaiKhoan != null)
                        {
                            var taiKhoanModel = _taiKhoanService.GetById((int)item.IdTaiKhoan);
                            var content = "The login password is for you: " + "\"" + taiKhoanModel.Pass + "\"";
                            _taiKhoanService.SenEmail(toEmail, "Email from TakeCareOfThePetService", content);
                        }

                        Message = "pass đã được cấp lại";
                    }
                }

                if (checkCout == 0)
                {
                    IsSuccess = false;
                    Message = "không tồn tại email";
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, null);
        }



        [Route("getbyid/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            TaiKhoan taiKhoanSinger = null;
            try
            {
                taiKhoanSinger = _taiKhoanService.GetById(id);
                if (taiKhoanSinger != null)
                {
                    Message = "Thông tin tài khoản với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được tài khoản với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, taiKhoanSinger);
        }

        [Route("login")]
        [HttpPost]
        public HttpResponseMessage Login(HttpRequestMessage request, LoginModel login)
        {

            TaiKhoan taiKhoanSinger = null;
            var loginSucess = false;
            try
            {
                taiKhoanSinger = _taiKhoanService.Login(login.UserName, login.Pass);
                if (taiKhoanSinger != null)
                {
                    var idQuyen = taiKhoanSinger.IdQuyen;
                    switch (idQuyen)
                    {
                        case 1:
                            loginSucess = true;
                            break;
                        case 2:
                            var coSoThuY = _coSoThuYService.GetByIdTaiKhoan(taiKhoanSinger.IdTaiKhoan);
                            if (coSoThuY.TrangThai != null && (bool)coSoThuY.TrangThai)
                            {
                                loginSucess = true;
                            }

                            break;
                        case 3:
                            var nguoiDung = _nguoiDungService.GetByIdTaiKhoan(taiKhoanSinger.IdTaiKhoan);
                            if (nguoiDung.TrangThai != null && (bool)nguoiDung.TrangThai)
                            {
                                loginSucess = true;
                            }

                            break;
                        case 4:
                            var shop = _shopService.GetByIdTaiKhoan(taiKhoanSinger.IdTaiKhoan);
                            if (shop.TrangThai != null && (bool)shop.TrangThai && (bool)shop.PheDuyet)
                            {
                                loginSucess = true;
                            }

                            break;
                    }

                }
                else
                {
                    IsSuccess = false;
                    Message = "Đăng nhập thất bại";
                }
                if (loginSucess)
                {
                    Message = "Thông tin tài khoản đã đăng nhập thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Đăng nhập thất bại");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, taiKhoanSinger);
        }

        [Route("doimatkhau")]
        [HttpPost]
        public HttpResponseMessage DoiMatKhau(HttpRequestMessage request, DoiMatKhauModel model)
        {
            TaiKhoan doiMatKhauTaiKhoan = null;
            try
            {
                doiMatKhauTaiKhoan = _taiKhoanService.DoiMatKhau(model.PassNew, model.PassOld, model.UserName);
                if (doiMatKhauTaiKhoan != null)
                {
                    _taiKhoanService.SaveChange();
                    Message = "Đổi mật khẩu thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Username and pass fail");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, doiMatKhauTaiKhoan);
        }


        [Route("createnguoidung")]
        [HttpPost]
        public HttpResponseMessage CreateNguoiDung(HttpRequestMessage request, TaiKhoan taiKhoan)
        {
            TaiKhoan modelTaiKhoan = null;

            try
            {
                taiKhoan.IdQuyen = 3;
                taiKhoan.TrangThai = true;
                modelTaiKhoan = _taiKhoanService.Add(taiKhoan);
                _taiKhoanService.SaveChange();
                if (modelTaiKhoan.IdTaiKhoan != 0)
                {
                    var nguoiDung = new NguoiDung
                    {
                        IdTaiKhoan = modelTaiKhoan.IdTaiKhoan,
                        TenNguoiDung = modelTaiKhoan.UserName,
                        TrangThai = true,
                    };
                    _nguoiDungService.Add(nguoiDung);
                    _nguoiDungService.SaveChange();
                }

                Message = "Tạo mới tài khoản thành công";
                _taiKhoanService.SaveChange();
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelTaiKhoan);
        }

        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, TaiKhoan taiKhoan)
        {
            TaiKhoan modelTaiKhoan = null;
            try
            {
                _taiKhoanService.Update(taiKhoan);
                _taiKhoanService.SaveChange();
                modelTaiKhoan = _taiKhoanService.GetById(taiKhoan.IdTaiKhoan);
                if (modelTaiKhoan != null)
                {
                    Message = "sửa thông tin tài khoản thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin tài khoản không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelTaiKhoan);
        }

        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {
            TaiKhoan modelTaiKhoan = null;
            try
            {
                _taiKhoanService.SaveChange();
                modelTaiKhoan = _taiKhoanService.GetById(id);
                if (modelTaiKhoan != null)
                {
                    if (modelTaiKhoan.TrangThai != null && (bool)modelTaiKhoan.TrangThai)
                    {
                        Message = "Mở tài khoản thành công";
                    }
                    else
                    {
                        Message = "Khóa tài khoản thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở tài khoản không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelTaiKhoan);
        }
    }
}

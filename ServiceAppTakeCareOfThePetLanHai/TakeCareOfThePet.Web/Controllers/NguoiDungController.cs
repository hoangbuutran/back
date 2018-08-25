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
    #region api/NguoiDung
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/nguoidung")]
    public class NguoiDungController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly INguoiDungService _nguoiDungService;
        private readonly ITaiKhoanService _taiKhoanService;
        public NguoiDungController(IErrorService errorService, INguoiDungService nguoiDungService, ITaiKhoanService taiKhoanService)
            : base(errorService)
        {
            _nguoiDungService = nguoiDungService;
            _taiKhoanService = taiKhoanService;
        }
        #endregion

        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {

            IEnumerable<NguoiDung> listNguoiDung = null;
            var toTal = 0;
            try
            {
                listNguoiDung = _nguoiDungService.GetAll();
                toTal = listNguoiDung.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách người dùng";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại người dùng nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listNguoiDung);
        }
        #endregion

        #region listcountnguoidung
        [Route("listcountnguoidung")]
        [HttpGet]
        public HttpResponseMessage ListCountNguoiDung(HttpRequestMessage request)
        {
            var listNumberNguoiDung = 0;
            try
            {
                listNumberNguoiDung = _nguoiDungService.ListCountNguoiDung();
                Message = "Danh sách số lượng người dùng";
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, listNumberNguoiDung, listNumberNguoiDung);
        }
        #endregion

        #region getbyid/ load thông tin người dùng theo ID
        [Route("getbyid/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            NguoiDung nguoiDungSinger = null;
            try
            {
                nguoiDungSinger = _nguoiDungService.GetById(id);
                if (nguoiDungSinger != null)
                {
                    Message = "Thông tin người dùng với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được người dùng với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, nguoiDungSinger);
        }
        #endregion

        #region load người dùng theo ID của cơ sở y tế
        [Route("getallbyidcosoyte/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllByIdCoSoYTe(HttpRequestMessage request, int id)
        {
            IEnumerable<NguoiDung> nguoiDungVoiIdCsyt = null;
            var toTal = 0;
            try
            {
                nguoiDungVoiIdCsyt = _nguoiDungService.GetAllByIdCoSoYTe(id);
                toTal = nguoiDungVoiIdCsyt.ToList().Count;
                if (toTal > 0)
                {
                    Message = "danh sách người dùng với id csyt: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được danh sách người dùng với id csyt {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, nguoiDungVoiIdCsyt);
        }
        #endregion

        #region getbyid
        [Route("getbyidtaikhoan/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetByIdTaiKhoan(HttpRequestMessage request, int id)
        {
            NguoiDung nguoiDungSingler = null;
            try
            {
                nguoiDungSingler = _nguoiDungService.GetByIdTaiKhoan(id);
                if (nguoiDungSingler != null)
                {
                    Message = "Thông tin người dùng với id tài khoản: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được người dùng với id tài khoản {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, nguoiDungSingler);
        }
        #endregion

        //[Route("sendmailfornguoidung")]
        //[HttpPost]
        //public HttpResponseMessage SendEmailViaWebApi(HttpRequestMessage request, SendEmailModel emailModel)
        //{
        //    try
        //    {
        //        var listNguoiDung = _nguoiDungService.GetAllCoEmail();
        //        var checkCout = 0;
        //        foreach (var item in listNguoiDung)
        //        {
        //            if (!item.Email.Equals(emailModel.Email)) continue;
        //            checkCout++;
        //            var toEmail = emailModel.Email;
        //            if (item.IdTaiKhoan != null)
        //            {
        //                var taiKhoanModel = _taiKhoanService.GetById((int)item.IdTaiKhoan);
        //                var content = "The login password is for you: " + "\"" + taiKhoanModel.Pass + "\"";
        //                _taiKhoanService.SenEmail(toEmail, "Email from TakeCareOfThePetService", content);
        //            }

        //            Message = "pass đã được cấp lại";
        //        }
        //        if (checkCout == 0)
        //        {
        //            IsSuccess = false;
        //            Message = "không tồn tại email";
        //        }
        //    }
        //    catch (DbEntityValidationException ex)
        //    {
        //        LogException(ex);
        //    }
        //    return GetResponseMessage(IsSuccess, Message, 1, null);
        //}


        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, NguoiDung nguoiDung)
        {
            NguoiDung modelNguoiDung = null;
            try
            {
                var tentaikhoan1 = nguoiDung.TenNguoiDung.ToLower();
                var tentaikhoan2 = _nguoiDungService.ThayDoiChuoi(tentaikhoan1);
                var tentaikhoan3 = tentaikhoan2.Replace(" ", "");
                var pass = nguoiDung.SDT.Substring(6);
                var taikhoan = new TaiKhoan
                {
                    UserName = tentaikhoan3,
                    Pass = pass,
                    IdQuyen = 3,
                    TrangThai = true,
                };
                var taiKhoan = _taiKhoanService.Add(taikhoan);
                _nguoiDungService.SaveChange();
                if (taiKhoan.IdTaiKhoan != 0)
                {
                    nguoiDung.IdTaiKhoan = taikhoan.IdTaiKhoan;
                    nguoiDung.TrangThai = true;
                    modelNguoiDung = _nguoiDungService.Add(nguoiDung);
                    _nguoiDungService.SaveChange();
                    if (modelNguoiDung != null)
                    {
                        Message = "Tạo mới người dùng và tài khoản thành công thành công";
                        _taiKhoanService.SaveChange();
                    }
                }
                else
                {
                    throw new DbEntityValidationException("tạo người dùng và tài khoản không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelNguoiDung);
        }
        #endregion


        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, NguoiDung nguoiDung)
        {

            NguoiDung modelNguoiDung = null;
            try
            {
                _nguoiDungService.Update(nguoiDung);
                _nguoiDungService.SaveChange();
                modelNguoiDung = _nguoiDungService.GetById(nguoiDung.IdNguoiDung);
                if (modelNguoiDung != null)
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
            return GetResponseMessage(IsSuccess, Message, 1, modelNguoiDung);
        }
        #endregion


        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {
            NguoiDung modelNguoiDung = null;
            try
            {
                _nguoiDungService.KhoaMo(id);
                _nguoiDungService.SaveChange();
                modelNguoiDung = _nguoiDungService.GetById(id);
                if (modelNguoiDung != null)
                {
                    if (modelNguoiDung.TrangThai != null && (bool)modelNguoiDung.TrangThai)
                    {
                        Message = "Mở người dùng thành công";
                    }
                    else
                    {
                        Message = "Khóa người dùng thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở thú cưng không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelNguoiDung);

        }
        #endregion

    }
    #endregion
}

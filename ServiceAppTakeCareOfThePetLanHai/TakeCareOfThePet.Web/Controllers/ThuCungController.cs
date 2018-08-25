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
    #region api/ThuCung
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/thucung")]
    public class ThuCungController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly IThuCungService _thuCungService;
        private readonly ITinhTrangService _tinhTrangService;
        private readonly ICanNangService _canNangService;
        public ThuCungController(IErrorService errorService, IThuCungService thuCungService, ITinhTrangService tinhTrangService, ICanNangService canNangService)
            : base(errorService)
        {
            _thuCungService = thuCungService;
            _canNangService = canNangService;
            _tinhTrangService = tinhTrangService;
        }
        #endregion

        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {
            IEnumerable<ThuCung> listThuCung = null;
            var toTal = 0;
            try
            {
                listThuCung = _thuCungService.GetAll();
                toTal = listThuCung.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách thú cưng";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại thú cưng nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listThuCung);
        }
        #endregion

        #region listcountthucung
        [Route("listcountthucung")]
        [HttpGet]
        public HttpResponseMessage ListCountThuCung(HttpRequestMessage request)
        {
            var listCount = 0;
            try
            {
                listCount = _thuCungService.ListCountThuCung();
                Message = "số lượng thú cưng";
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, listCount, listCount);
        }
        #endregion

        #region getbyid
        [Route("getbyid/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            ThuCung thuCungSingler = null;
            try
            {
                thuCungSingler = _thuCungService.GetById(id);
                if (thuCungSingler != null)
                {
                    Message = "Thông tin thú cưng với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được thú cưng với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, thuCungSingler);
        }
        #endregion

        #region Load danh sách thông tin của thú cưng theo id người dùng
        [Route("getallbyidnguoidung/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllByIdNguoiDung(HttpRequestMessage request, int id)
        {
            IEnumerable<ThuCung> thuCungAllByIdNguoiDung = null;
            var toTal = 0;
            try
            {
                thuCungAllByIdNguoiDung = _thuCungService.GetAllByIdNguoiDung(id);
                toTal = thuCungAllByIdNguoiDung.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Thông thú cưng với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được thông tin thú cưng với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, thuCungAllByIdNguoiDung);
        }
        #endregion

        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, ThuCung thuCung)
        {
            ThuCung modelThuCung = null;
            try
            {
                thuCung.NgayNuoi = DateTime.Now;
                modelThuCung = _thuCungService.Add(thuCung);
                if (modelThuCung != null)
                {
                    Message = "Tạo mới thú cưng thành công";
                    _thuCungService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo thú cưng không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelThuCung);
        }
        #endregion


        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, ThuCung thuCung)
        {
            ThuCung modelThuCung = null;
            try
            {
                _thuCungService.Update(thuCung);
                _thuCungService.SaveChange();
                modelThuCung = _thuCungService.GetById(thuCung.IdThuCung);
                if (modelThuCung != null)
                {
                    Message = "Tạo mới tài khoản thành công";
                }
                else
                {
                    throw new DbEntityValidationException("tạo tài khoản không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelThuCung);
        }
        #endregion


        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {

            ThuCung modelThuCung = null;
            try
            {
                _thuCungService.KhoaMo(id);
                _thuCungService.SaveChange();
                modelThuCung = _thuCungService.GetById(id);
                if (modelThuCung != null)
                {
                    if (modelThuCung.TrangThai != null && (bool)modelThuCung.TrangThai)
                    {
                        Message = "Mở thú cưng thành công";
                    }
                    else
                    {
                        Message = "Khóa thú cưng thành công";
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
            return GetResponseMessage(IsSuccess, Message, 1, modelThuCung);

        }
        #endregion


        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            ThuCung modelThuCung = null;
            try
            {
                var listCanNang = _canNangService.GetAll();
                foreach (var item in listCanNang)
                {
                    if (item.IdThuCung != id) continue;
                    _canNangService.GetById(item.IdCanNang);
                    _canNangService.Delete(item.IdCanNang);
                }
                _thuCungService.SaveChange();
                var listTinhTrang = _tinhTrangService.GetAll();
                foreach (var item in listTinhTrang)
                {
                    if (item.IdThuCung != id) continue;
                    _tinhTrangService.GetById(item.IdTinhTrang);
                    _tinhTrangService.Delete(item.IdTinhTrang);
                }
                _thuCungService.SaveChange();
                modelThuCung = _thuCungService.Delete(id);
                if (modelThuCung != null)
                {
                    Message = "Xóa thú cưng thành công";
                    _thuCungService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("Xóa thú cưng không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelThuCung);

        }
        #endregion

    }
    #endregion
}

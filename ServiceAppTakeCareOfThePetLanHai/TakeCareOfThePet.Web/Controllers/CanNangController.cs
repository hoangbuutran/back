using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using TakeCareOfThePet.Model.Models;
using TakeCareOfThePet.Service;
using TakeCareOfThePet.Web.Infrastructure.Core;

namespace TakeCareOfThePet.Web.Controllers
{
    #region api/CanNang
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/cannang")]
    public class CanNangController : ApiControllerBase
    {
        #region Khởi tạo

        readonly ICanNangService _canNangService;
        public CanNangController(IErrorService errorService, ICanNangService canNangService)
            : base(errorService)
        {
            _canNangService = canNangService;
        }
        #endregion

        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {
            IEnumerable<CanNang> listCanNang = null;
            var toTal = 0;
            try
            {
                listCanNang = _canNangService.GetAll();
                toTal = listCanNang.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách cân nặng";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại cân nặng nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listCanNang);
        }
        #endregion

        #region getallcannangwithidthucung
        [Route("getallcannangwithidthucung/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllCanNangWithIdThuCung(HttpRequestMessage request, int id)
        {
            IEnumerable<CanNang> listCanNangWithIdThuCung = null;
            var toTal = 0;
            try
            {
                listCanNangWithIdThuCung = _canNangService.GetAllCanNangWithIdThuCung(id);
                toTal = listCanNangWithIdThuCung.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách cân nặng của thú cưng";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại cân nặng thú cưng nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal,listCanNangWithIdThuCung);
        }
        #endregion

        #region listcountcancang
        [Route("listcountcancang")]
        [HttpGet]
        public HttpResponseMessage ListCountCanNang(HttpRequestMessage request)
        {
            var listCount = 0;
            try
            {
                listCount = _canNangService.ListCountCanNang();
                Message = "số lượng cân nặng";
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
            CanNang canNangSingler = null;
            try
            {
                canNangSingler = _canNangService.GetById(id);
                if (canNangSingler != null)
                {
                    Message = "Thông tin cân nặng với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được cân nặng với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message,1, canNangSingler);
        }
        #endregion


        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, CanNang canNang)
        {
            CanNang modelCanNang = null;
            try
            {
                canNang.NgayCapNhat = DateTime.Now;
                canNang.TrangThai = true;
                modelCanNang = _canNangService.Add(canNang);
                if (modelCanNang != null)
                {
                    Message = "Tạo mới cân nặng thành công";
                    _canNangService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo mới cân nặng không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelCanNang);
        }
        #endregion


        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, CanNang canNang)
        {
            CanNang modelCanNang = null;
            try
            {
                canNang.TrangThai = true;
                _canNangService.Update(canNang);
                _canNangService.SaveChange();
                modelCanNang = _canNangService.GetById(canNang.IdCanNang);
                if (modelCanNang != null)
                {
                    Message = "Sửa thông tin cân nặng thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin cân nặng không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelCanNang);
        }
        #endregion

        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            CanNang modelCanNang = null;
            try
            {
                modelCanNang = _canNangService.Delete(id);
                _canNangService.SaveChange();
                if (modelCanNang != null)
                {
                    Message = "Xóa can nang thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa can nang không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelCanNang);
        }
        #endregion

    }
    #endregion
}

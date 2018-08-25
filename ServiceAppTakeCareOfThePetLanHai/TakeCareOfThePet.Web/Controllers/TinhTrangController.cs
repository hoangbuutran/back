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
    #region api/tinhTrang
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/tinhtrang")]
    public class TinhTrangController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly ITinhTrangService _tinhTrangService;
        public TinhTrangController(IErrorService errorService, ITinhTrangService tinhTrangService)
            : base(errorService)
        {
            _tinhTrangService = tinhTrangService;
        }
        #endregion

        #region getallbyidthucung
        [Route("getalltinhtrangbyidthucung/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllByIdThuCung(HttpRequestMessage request, int id)
        {
            IEnumerable<TinhTrang> listTinhTrangThuCung = null;
            var toTal = 0;
            try
            {
                listTinhTrangThuCung = _tinhTrangService.GetAllByIdThuCung(id);
                toTal = listTinhTrangThuCung.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách tình trạng thú cưng";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại tình trạng thú cưng nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal,listTinhTrangThuCung);
        }
        #endregion

        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {
            IEnumerable<TinhTrang> listTinhTrang = null;
            var toTal = 0;
            try
            {
                listTinhTrang = _tinhTrangService.GetAll();
                toTal = listTinhTrang.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách tình trạng";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại tình trạng nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listTinhTrang);
        }
        #endregion

        #region listcounttinhtrang
        [Route("listcounttinhtrang")]
        [HttpGet]
        public HttpResponseMessage ListCounttinhTrang(HttpRequestMessage request)
        {
            var listCount = 0;
            try
            {
                listCount = _tinhTrangService.ListCountTinhTrang();
                Message = "số lượng tình trạng";
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message,listCount, listCount);
        }
        #endregion

        #region getbyid
        [Route("getbyid/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request, int id)
        {
            TinhTrang tinhTrang = null;
            try
            {
                tinhTrang = _tinhTrangService.GetById(id);
                if (tinhTrang != null)
                {
                    Message = "thông tin tình trạng";
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tồn tại tình trạng với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, tinhTrang);
        }
        #endregion


        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, TinhTrang tinhTrang)
        {
            TinhTrang modelTinhTrang = null;
            try
            {
                tinhTrang.TrangThai = true;
                tinhTrang.NgayCapNhat = DateTime.Now;
                modelTinhTrang = _tinhTrangService.Add(tinhTrang);
                if (modelTinhTrang != null)
                {
                    Message = "Tạo mới tình trạng thành công";
                    _tinhTrangService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo tình trạng không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelTinhTrang);
        }
        #endregion


        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, TinhTrang tinhTrang)
        {
            TinhTrang modelTinhTrang = null;
            try
            {
                tinhTrang.TrangThai = true;
                _tinhTrangService.Update(tinhTrang);
                _tinhTrangService.SaveChange();
                modelTinhTrang = _tinhTrangService.GetById(tinhTrang.IdTinhTrang);
                if (modelTinhTrang != null)
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
            return GetResponseMessage(IsSuccess, Message, 1, modelTinhTrang);
        }
        #endregion


        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {
            TinhTrang modelTinhTrang = null;
            try
            {
                _tinhTrangService.KhoaMo(id);
                _tinhTrangService.SaveChange();
                modelTinhTrang = _tinhTrangService.GetById(id);
                if (modelTinhTrang != null)
                {
                    if (modelTinhTrang.TrangThai != null && (bool)modelTinhTrang.TrangThai)
                    {
                        Message = "Mở tình trạng thành công";
                    }
                    else
                    {
                        Message = "Khóa tình trạng thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở tình trạng không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelTinhTrang);
        }
        #endregion


        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            TinhTrang modelTinhTrang = null;
            try
            {
                modelTinhTrang = _tinhTrangService.Delete(id);
                _tinhTrangService.SaveChange();
                if (modelTinhTrang != null)
                {
                    Message = "Xóa tình trạng thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa tình trạng không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message,1, modelTinhTrang);
        }
        #endregion

    }
    #endregion
}

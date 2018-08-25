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
    #region api/ChuyenMuc
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/chuyenmuc")]
    public class ChuyenMucController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly IChuyenMucService _chuyenMucService;
        private readonly IBaiVietService _baiVietService;
        private readonly IBinhLuanService _binhLuanService;
        public ChuyenMucController(IErrorService errorService, IChuyenMucService chuyenMucService, IBaiVietService baiVietService, IBinhLuanService binhLuanService)
            : base(errorService)
        {
            _chuyenMucService = chuyenMucService;
            _baiVietService = baiVietService;
            _binhLuanService = binhLuanService;
        }
        #endregion

        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {
            IEnumerable<ChuyenMuc> listChuyenMuc = null;
            var toTal = 0;
            try
            {
                listChuyenMuc = _chuyenMucService.GetAll();
                toTal = listChuyenMuc.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách chuyên mục";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại chuyên mục nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listChuyenMuc);
        }
        #endregion

        #region getallfortrue
        [Route("getallfortrue")]
        [HttpGet]
        public HttpResponseMessage GetAllForTrue(HttpRequestMessage request)
        {
            IEnumerable<ChuyenMuc> listChuyenMuc = null;
            var toTal = 0;
            try
            {
                listChuyenMuc = _chuyenMucService.GetAllForTrue();
                toTal = listChuyenMuc.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách chuyên mục dành cho người dùng xem";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại chuyên mục nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listChuyenMuc);
        }
        #endregion


        [Route("listcountchuyenmuc")]
        [HttpGet]
        public HttpResponseMessage ListCountChuyenMuc(HttpRequestMessage request)
        {
            var listCount = 0;
            try
            {
                listCount = _chuyenMucService.ListCountChuyenMuc();
                Message = "số lượng chuyên mục";
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
            ChuyenMuc chuyenMucSingler = null;
            try
            {
                chuyenMucSingler = _chuyenMucService.GetById(id);
                if (chuyenMucSingler != null)
                {
                    Message = "Thông tin chuyên mục với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được chuyên mục với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, chuyenMucSingler);
        }
        #endregion


        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, ChuyenMuc chuyenMuc)
        {
            ChuyenMuc modelChuyenMuc = null;
            try
            {
                modelChuyenMuc = _chuyenMucService.Add(chuyenMuc);
                if (modelChuyenMuc != null)
                {
                    Message = "Tạo mới chuyên mục thành công";
                    _chuyenMucService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo mới chuyên mục không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelChuyenMuc);
        }
        #endregion


        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, ChuyenMuc chuyenMuc)
        {
            ChuyenMuc modelChuyenMuc = null;
            try
            {
                _chuyenMucService.Update(chuyenMuc);
                _chuyenMucService.SaveChange();
                modelChuyenMuc = _chuyenMucService.GetById(chuyenMuc.IdChuyenMuc);
                if (modelChuyenMuc != null)
                {
                    Message = "Sửa thông tin chuyên mục thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin chuyên mục không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelChuyenMuc);
        }
        #endregion

        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {

            ChuyenMuc modelChuyenMuc = null;
            try
            {
                _chuyenMucService.KhoaMo(id);
                _chuyenMucService.SaveChange();
                modelChuyenMuc = _chuyenMucService.GetById(id);
                if (modelChuyenMuc != null)
                {
                    if (modelChuyenMuc.TrangThai != null && (bool)modelChuyenMuc.TrangThai)
                    {
                        Message = "Mở chuyên mục thành công";
                    }
                    else
                    {
                        Message = "Khóa chuyên mục thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở chuyên mục không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelChuyenMuc);
        }
        #endregion


        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            ChuyenMuc modelChuyenMuc = null;
            try
            {
                var listBaiViet = _baiVietService.BaiVietWithIdChuyenMuc(id);
                foreach (var item in listBaiViet)
                {
                    var listBinhLuan = _binhLuanService.BinhLuanWithIdBaiViet(id);
                    foreach (var item2 in listBinhLuan)
                    {
                        _binhLuanService.Delete(item2.IdBinhLuan);
                    }
                    _chuyenMucService.SaveChange();
                    _baiVietService.Delete(item.IdBaiViet);
                }
                _chuyenMucService.SaveChange();
                modelChuyenMuc = _chuyenMucService.Delete(id);
                _chuyenMucService.SaveChange();
                if (modelChuyenMuc != null)
                {
                    Message = "Xóa chuyên mục thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa chuyên mục không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelChuyenMuc);
        }
        #endregion

    }
    #endregion
}

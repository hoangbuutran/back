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
    #region api/BinhLuan
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/binhluan")]
    public class BinhLuanController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly IBinhLuanService _binhLuanService;
        private readonly IBaiVietService _baiVietService;
        public BinhLuanController(IErrorService errorService, IBinhLuanService binhLuanService, IBaiVietService baiVietService)
            : base(errorService)
        {
            _binhLuanService = binhLuanService;
            _baiVietService = baiVietService;
        }
        #endregion


        #region getallBinhLuanwithidbaiviet
        [Route("getallbinhluanwithidbaiviet/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, int id)
        {
            IEnumerable<BinhLuan> listBinhLuanWithIdBaiViet = null;
            var toTal = 0;
            try
            {
                listBinhLuanWithIdBaiViet = _binhLuanService.BinhLuanWithIdBaiViet(id);
                toTal = listBinhLuanWithIdBaiViet.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách bình luận của bai viet";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại bình luận bai viet nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listBinhLuanWithIdBaiViet);
        }
        #endregion

        #region getbyid
        [Route("getbyid/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            BinhLuan binhLuanSingler = null;
            try
            {
                binhLuanSingler = _binhLuanService.GetById(id);
                if (binhLuanSingler != null)
                {
                    Message = "Thông tin bình luận với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được bình luận với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, binhLuanSingler);
        }
        #endregion


        #region like
        [Route("like/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Like(HttpRequestMessage request, int id)
        {
            try
            {
                _binhLuanService.Like(id);
                Message = "like binh luan thành công";
                _binhLuanService.SaveChange();
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, null);
        }
        #endregion

        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, BinhLuan binhLuan)
        {
            BinhLuan modelBinhLuan = null;
            try
            {
                binhLuan.NgayBinhLuan = DateTime.Now;
                binhLuan.TrangThai = true;
                binhLuan.SoLike = 0;
                modelBinhLuan = _binhLuanService.Add(binhLuan);
                _binhLuanService.SaveChange();
                if (modelBinhLuan != null)
                {
                    if (binhLuan.IdBaiViet != null)
                    {
                        var baiViet = _baiVietService.GetById((int) binhLuan.IdBaiViet);
                        baiViet.SoCmt++;
                        _baiVietService.SaveChange();
                    }

                    Message = "Tạo mới bình luận thành công";
                }
                else
                {
                    throw new DbEntityValidationException("tạo mới bình luận không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelBinhLuan);
        }
        #endregion


        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, BinhLuan binhLuan)
        {
            BinhLuan modelBinhLuan = null;
            try
            {
                _binhLuanService.Update(binhLuan);
                _binhLuanService.SaveChange();
                modelBinhLuan = _binhLuanService.GetById(binhLuan.IdBinhLuan);
                if (modelBinhLuan != null)
                {
                    Message = "Sửa thông tin bình luận thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin bình luận không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelBinhLuan);
        }
        #endregion


        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            BinhLuan modelBinhLuan = null;
            try
            {
                modelBinhLuan = _binhLuanService.Delete(id);
                _binhLuanService.SaveChange();
                if (modelBinhLuan != null)
                {
                    if (modelBinhLuan.IdBaiViet != null)
                    {
                        var baiViet = _baiVietService.GetById((int)modelBinhLuan.IdBaiViet);
                        baiViet.SoCmt--;
                        _baiVietService.SaveChange();
                    }
                    Message = "Xóa binh luan thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa binh luan không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelBinhLuan);
        }
        #endregion

    }
    #endregion
}

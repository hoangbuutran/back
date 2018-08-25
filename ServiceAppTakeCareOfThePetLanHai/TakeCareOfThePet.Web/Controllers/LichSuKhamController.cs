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
    [RoutePrefix("api/lich-su-kham")]
    public class LichSuKhamController : ApiControllerBase
    {
        private readonly ILichSuKhamService _lichSuKhamService;
        public LichSuKhamController(IErrorService errorService, ILichSuKhamService lichSuKhamService)
            : base(errorService)
        {
            _lichSuKhamService = lichSuKhamService;
        }

        #region getbyid
        [Route("get-by-id/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            LichSuKham lichSuKhamSinger = null;
            try
            {
                lichSuKhamSinger = _lichSuKhamService.GetById(id);
                if (lichSuKhamSinger != null)
                {
                    Message = "Thông tin Lich Su Kham với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được Lich Su Kham với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, lichSuKhamSinger);
        }
        #endregion

        #region searchkey
        [Route("search-key/{searchKey}")]
        [HttpGet]
        public HttpResponseMessage SearchKey(HttpRequestMessage request, string searchKey)
        {

            IEnumerable<LichSuKham> listLichSuKhams = null;
            var toTal = 0;
            try
            {
                listLichSuKhams = _lichSuKhamService.GetAllKeySearch(searchKey);
                toTal = listLichSuKhams.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách Lich Su Kham";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại Lich Su Kham nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listLichSuKhams);
        }
        #endregion

        #region GetAllWithIdthucung
        [Route("get-all-with-id-thucung/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllWithIdCoSoThuY(HttpRequestMessage request, int id)
        {
            IEnumerable<LichSuKham> listLichSuKhams = null;
            var toTal = 0;
            try
            {
                listLichSuKhams = _lichSuKhamService.GetAllWithIdThuCungKhams(id);
                toTal = listLichSuKhams.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách Lich Su Kham voi id thu cung";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại Lich Su Kham nào voi id thu cung");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listLichSuKhams);
        }
        #endregion

        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, LichSuKham lichSuKham)
        {
            LichSuKham lichSuKhamSinger = null;
            try
            {
                lichSuKham.NgayThang = DateTime.Now;
                lichSuKhamSinger = _lichSuKhamService.Add(lichSuKham);
                if (lichSuKhamSinger != null)
                {
                    Message = "Tạo mới Lich Su Kham thành công";
                    _lichSuKhamService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo mới Lich Su Kham không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, lichSuKhamSinger);
        }
        #endregion

        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, LichSuKham lichSuKham)
        {
            LichSuKham lichSuKhamSinger = null;
            try
            {
                _lichSuKhamService.Update(lichSuKham);
                _lichSuKhamService.SaveChange();
                lichSuKhamSinger = _lichSuKhamService.GetById(lichSuKham.IdLichSuKham);
                if (lichSuKhamSinger != null)
                {
                    Message = "Sửa thông tin Lich Su Kham thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin Lich Su Kham không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, lichSuKhamSinger);
        }
        #endregion

        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            LichSuKham lichSuKhamSinger = null;
            try
            {
                lichSuKhamSinger = _lichSuKhamService.Delete(id);
                _lichSuKhamService.SaveChange();
                if (lichSuKhamSinger != null)
                {
                    Message = "Xóa Lich Su Kham thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa Lich Su Kham không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, lichSuKhamSinger);
        }
        #endregion
    }
}

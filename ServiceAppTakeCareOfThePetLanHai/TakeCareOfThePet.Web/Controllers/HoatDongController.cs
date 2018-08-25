using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using TakeCareOfThePet.Model.Models;
using TakeCareOfThePet.Service;
using TakeCareOfThePet.Web.Infrastructure.Core;

namespace TakeCareOfThePet.Web.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/hoat-dong")]
    public class HoatDongController : ApiControllerBase
    {
        private readonly IHoatDongService _hoatDongService;
        public HoatDongController(IErrorService errorService, IHoatDongService hoatDongService) : base(errorService)
        {
            _hoatDongService = hoatDongService;
        }


        #region getbyid
        [Route("get-by-id/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            HoatDong hoatDongSinger = null;
            try
            {
                hoatDongSinger = _hoatDongService.GetById(id);
                if (hoatDongSinger != null)
                {
                    Message = "Thông tin hoat dong với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được hoat dong với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, hoatDongSinger);
        }
        #endregion


        #region UploadImage
        [Route("uploadimage")]
        [HttpPost]
        public HttpResponseMessage UploadImage(HttpRequestMessage request)
        {
            HoatDong modelHoatDong = null;
            try
            {
                var httpRequest = HttpContext.Current.Request;

                //Upload Image
                var postedFile = httpRequest.Files["ImageShow"];
                var id = httpRequest["Id"];
                var hoatDong = _hoatDongService.GetById(int.Parse(id));
                //Create custom filename
                if (postedFile != null)
                {
                    var imageName = new String(Path.GetFileNameWithoutExtension(postedFile.FileName).Take(10).ToArray())
                        .Replace(" ", "-");
                    imageName = imageName + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(postedFile.FileName);
                    var filePath = HttpContext.Current.Server.MapPath("~/Images/" + imageName);
                    postedFile.SaveAs(filePath);
                    hoatDong.ImageShow = imageName;
                    _hoatDongService.Update(hoatDong);
                    _hoatDongService.SaveChange();
                    modelHoatDong = _hoatDongService.GetById(hoatDong.IdHoatDong);
                }
                if (modelHoatDong != null)
                {
                    Message = "Upload ảnh thành công thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Upload ảnh không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelHoatDong);
        }
        #endregion


        #region searchkey
        [Route("search-key/{searchKey}")]
        [HttpGet]
        public HttpResponseMessage SearchKey(HttpRequestMessage request, string searchKey)
        {

            IEnumerable<HoatDong> listHoatDongs = null;
            var toTal = 0;
            try
            {
                listHoatDongs = _hoatDongService.GetAllKeySearch(searchKey);
                toTal = listHoatDongs.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách hoat dong";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại hoat dong nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listHoatDongs);
        }
        #endregion


        #region GetAllWithIdCoSoThuYfortrue
        [Route("get-all-with-id-cosothuy-for-true/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, int id)
        {
            IEnumerable<HoatDong> listHoatDongs = null;
            var toTal = 0;
            try
            {
                listHoatDongs = _hoatDongService.GetAllWithIdCoSoThuYForTrue(id);
                toTal = listHoatDongs.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách hoat dong voi id co so thu y";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại hoat dong nào voi id co so thu y");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listHoatDongs);
        }
        #endregion

        #region GetAllWithIdCoSoThuY
        [Route("get-all-with-id-cosothuy/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllWithIdCoSoThuY(HttpRequestMessage request, int id)
        {
            IEnumerable<HoatDong> listHoatDongs = null;
            var toTal = 0;
            try
            {
                listHoatDongs = _hoatDongService.GetAllWithIdCoSoThuY(id);
                toTal = listHoatDongs.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách hoat dong voi id co so thu y";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại hoat dong nào voi id co so thu y");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listHoatDongs);
        }
        #endregion

        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, HoatDong hoatDong)
        {
            HoatDong hoatDongSinger = null;
            try
            {
                hoatDong.NgayThang = DateTime.Now;
                hoatDongSinger = _hoatDongService.Add(hoatDong);
                if (hoatDongSinger != null)
                {
                    Message = "Tạo mới hoat dong thành công";
                    _hoatDongService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo mới hoat dong không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, hoatDongSinger);
        }
        #endregion


        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, HoatDong hoatDong)
        {
            HoatDong hoatDongSinger = null;
            try
            {
                _hoatDongService.Update(hoatDong);
                _hoatDongService.SaveChange();
                hoatDongSinger = _hoatDongService.GetById(hoatDong.IdHoatDong);
                if (hoatDongSinger != null)
                {
                    Message = "Sửa thông tin hoat dong thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin hoat dong không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, hoatDongSinger);
        }
        #endregion

        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {

            HoatDong hoatDongSinger = null;
            try
            {
                _hoatDongService.KhoaMo(id);
                _hoatDongService.SaveChange();
                hoatDongSinger = _hoatDongService.GetById(id);
                if (hoatDongSinger != null)
                {
                    if (hoatDongSinger.TinhTrang != null && (bool)hoatDongSinger.TinhTrang)
                    {
                        Message = "Mở hoat dong thành công";
                    }
                    else
                    {
                        Message = "Khóa hoat dong thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở hoat dong không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, hoatDongSinger);
        }
        #endregion


        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            HoatDong hoatDongSinger = null;
            try
            {
                hoatDongSinger = _hoatDongService.Delete(id);
                _hoatDongService.SaveChange();
                if (hoatDongSinger != null)
                {
                    Message = "Xóa hoat dong thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa hoat dong không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, hoatDongSinger);
        }
        #endregion

    }
}

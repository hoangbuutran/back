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
    [RoutePrefix("api/suc-khoe-thu-cung")]
    public class SucKhoeThuCungController : ApiControllerBase
    {
        private readonly ISucKhoeThuCungService _sucKhoeThuCungService;
        public SucKhoeThuCungController(IErrorService errorService, ISucKhoeThuCungService sucKhoeThuCungService) : base(errorService)
        {
            _sucKhoeThuCungService = sucKhoeThuCungService;
        }

        #region UploadImage
        [Route("uploadimage")]
        [HttpPost]
        public HttpResponseMessage UploadImage(HttpRequestMessage request)
        {
            SucKhoeThuCung modelSucKhoeThuCung = null;
            try
            {
                var httpRequest = HttpContext.Current.Request;

                //Upload Image
                var postedFile = httpRequest.Files["ImageShow"];
                var id = httpRequest["Id"];
                var sucKhoeThuCung = _sucKhoeThuCungService.GetById(int.Parse(id));
                //Create custom filename
                if (postedFile != null)
                {
                    var imageName = new String(Path.GetFileNameWithoutExtension(postedFile.FileName).Take(10).ToArray())
                        .Replace(" ", "-");
                    imageName = imageName + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(postedFile.FileName);
                    var filePath = HttpContext.Current.Server.MapPath("~/Images/" + imageName);
                    postedFile.SaveAs(filePath);
                    sucKhoeThuCung.ImageShow = imageName;
                    _sucKhoeThuCungService.Update(sucKhoeThuCung);
                    _sucKhoeThuCungService.SaveChange();
                    modelSucKhoeThuCung = _sucKhoeThuCungService.GetById(sucKhoeThuCung.IdSKTC);
                }
                if (modelSucKhoeThuCung != null)
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
            return GetResponseMessage(IsSuccess, Message, 1, modelSucKhoeThuCung);
        }
        #endregion


        #region getbyid
        [Route("get-by-id/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            SucKhoeThuCung sucKhoeThuCungSinger = null;
            try
            {
                sucKhoeThuCungSinger = _sucKhoeThuCungService.GetById(id);
                if (sucKhoeThuCungSinger != null)
                {
                    Message = "Thông tin Suc Khoe Thu Cung với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được Suc Khoe Thu Cung với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, sucKhoeThuCungSinger);
        }
        #endregion

        #region searchkey
        [Route("search-key/{searchKey}")]
        [HttpGet]
        public HttpResponseMessage SearchKey(HttpRequestMessage request, string searchKey)
        {

            IEnumerable<SucKhoeThuCung> listSucKhoeThuCungs = null;
            var toTal = 0;
            try
            {
                listSucKhoeThuCungs = _sucKhoeThuCungService.GetAllKeySearch(searchKey);
                toTal = listSucKhoeThuCungs.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách Suc Khoe Thu Cung";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại Suc Khoe Thu Cung nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listSucKhoeThuCungs);
        }
        #endregion

        #region GetAllWithIdCoSoThuYfortrue
        [Route("get-all-with-id-cosothuy-for-true/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, int id)
        {
            IEnumerable<SucKhoeThuCung> listSucKhoeThuCungs = null;
            var toTal = 0;
            try
            {
                listSucKhoeThuCungs = _sucKhoeThuCungService.GetAllWithIdCoSoThuYForTrue(id);
                toTal = listSucKhoeThuCungs.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách Suc Khoe Thu Cung voi id co so thu y";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listSucKhoeThuCungs);
        }
        #endregion

        #region GetAll
        [Route("get-all-for-true")]
        [HttpGet]
        public HttpResponseMessage GetAllForTrue(HttpRequestMessage request)
        {
            IEnumerable<SucKhoeThuCung> listSucKhoeThuCungs = null;
            var toTal = 0;
            try
            {
                listSucKhoeThuCungs = _sucKhoeThuCungService.GetAllForTrue();
                toTal = listSucKhoeThuCungs.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách Suc Khoe Thu Cung voi id co so thu y";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listSucKhoeThuCungs);
        }
        #endregion

        #region GetAllWithIdCoSoThuY
        [Route("get-all-with-id-cosothuy/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllWithIdCoSoThuY(HttpRequestMessage request, int id)
        {
            IEnumerable<SucKhoeThuCung> listSucKhoeThuCungs = null;
            var toTal = 0;
            try
            {
                listSucKhoeThuCungs = _sucKhoeThuCungService.GetAllWithIdCoSoThuY(id);
                toTal = listSucKhoeThuCungs.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách Suc Khoe Thu Cung voi id co so thu y";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listSucKhoeThuCungs);
        }
        #endregion

        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, SucKhoeThuCung sucKhoeThuCung)
        {
            SucKhoeThuCung sucKhoeThuCungSinger = null;
            try
            {
                sucKhoeThuCung.NgayThang = DateTime.Now;
                sucKhoeThuCungSinger = _sucKhoeThuCungService.Add(sucKhoeThuCung);
                if (sucKhoeThuCungSinger != null)
                {
                    Message = "Tạo mới Suc Khoe Thu Cung thành công";
                    _sucKhoeThuCungService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo mới Suc Khoe Thu Cung không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, sucKhoeThuCungSinger);
        }
        #endregion

        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, SucKhoeThuCung sucKhoeThuCung)
        {
            SucKhoeThuCung sucKhoeThuCungSinger = null;
            try
            {
                _sucKhoeThuCungService.Update(sucKhoeThuCung);
                _sucKhoeThuCungService.SaveChange();
                sucKhoeThuCungSinger = _sucKhoeThuCungService.GetById(sucKhoeThuCung.IdSKTC);
                if (sucKhoeThuCungSinger != null)
                {
                    Message = "Sửa thông tin Suc Khoe Thu Cung thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin Suc Khoe Thu Cung không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, sucKhoeThuCungSinger);
        }
        #endregion

        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {

            SucKhoeThuCung sucKhoeThuCungSinger = null;
            try
            {
                _sucKhoeThuCungService.KhoaMo(id);
                _sucKhoeThuCungService.SaveChange();
                sucKhoeThuCungSinger = _sucKhoeThuCungService.GetById(id);
                if (sucKhoeThuCungSinger != null)
                {
                    if (sucKhoeThuCungSinger.TinhTrang != null && (bool)sucKhoeThuCungSinger.TinhTrang)
                    {
                        Message = "Mở Suc Khoe Thu Cung thành công";
                    }
                    else
                    {
                        Message = "Khóa Suc Khoe Thu Cung thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở Suc Khoe Thu Cung không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, sucKhoeThuCungSinger);
        }
        #endregion

        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            SucKhoeThuCung sucKhoeThuCungSinger = null;
            try
            {
                sucKhoeThuCungSinger = _sucKhoeThuCungService.Delete(id);
                _sucKhoeThuCungService.SaveChange();
                if (sucKhoeThuCungSinger != null)
                {
                    Message = "Xóa Suc Khoe Thu Cung thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa Suc Khoe Thu Cung không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, sucKhoeThuCungSinger);
        }
        #endregion

    }
}

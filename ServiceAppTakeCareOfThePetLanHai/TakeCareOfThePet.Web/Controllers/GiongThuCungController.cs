using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Cors;
using TakeCareOfThePet.Model.Models;
using TakeCareOfThePet.Service;
using TakeCareOfThePet.Web.Infrastructure.Core;

namespace TakeCareOfThePet.Web.Controllers
{
    #region api/ThuCung
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/giongthucung")]
    public class GiongThuCungController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly IGiongThuCungService _giongThuCungService;
        public GiongThuCungController(IErrorService errorService, IGiongThuCungService giongThuCungService)
            : base(errorService)
        {
            _giongThuCungService = giongThuCungService;
        }
        #endregion

        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {

            IEnumerable<GiongThuCung> listGiongThuCung = null;
            var toTal = 0;
            try
            {
                listGiongThuCung = _giongThuCungService.GetAll();
                toTal = listGiongThuCung.ToList().Count;
                if ( toTal> 0)
                {
                    Message = "Danh sách giống thú cưng";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại giống thú cưng nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message,toTal ,listGiongThuCung);
        }
        #endregion

        #region GetAll for true
        [Route("getallfortrue")]
        [HttpGet]
        public HttpResponseMessage GetAllForTrue(HttpRequestMessage request)
        {
            IEnumerable<GiongThuCung> listGiongThuCung = null;
            var toTal = 0;
            try
            {
                listGiongThuCung = _giongThuCungService.GetAllForTrue();
                toTal = listGiongThuCung.ToList().Count;
                if ( toTal> 0)
                {
                    Message = "Danh sách giống thú cưng cho người dùng xem";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại giống thú cưng nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message,toTal ,listGiongThuCung);
        }
        #endregion

        #region GetAllsearchkey
        [Route("searchkey/{searchKey}")]
        [HttpGet]
        public HttpResponseMessage SearchKey(HttpRequestMessage request, string searchKey)
        {

            IEnumerable<GiongThuCung> listGiongThuCung = null;
            var toTal = 0;
            try
            {
                listGiongThuCung = _giongThuCungService.GetAllKeySearch(searchKey);
                toTal = listGiongThuCung.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách giống thú cưng";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại giống thú cưng nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal,listGiongThuCung);
        }
        #endregion

        [Route("listcountgiongthucung")]
        [HttpGet]
        public HttpResponseMessage ListCountGiongThuCung(HttpRequestMessage request)
        {

            var listCount = 0;
            try
            {
                listCount = _giongThuCungService.ListCountGiongThuCung();
                Message = "số lượng thú cưng";
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
            GiongThuCung giongThuCungSingler = null;
            try
            {
                giongThuCungSingler = _giongThuCungService.GetById(id);
                if (giongThuCungSingler != null)
                {
                    Message = "Thông tin giống thú cưng với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được giống thú cưng với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message,1, giongThuCungSingler);
        }
        #endregion

        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, GiongThuCung giongThuCung)
        {
            GiongThuCung modelGiongThuCung = null;
            try
            {
                modelGiongThuCung = _giongThuCungService.Add(giongThuCung);
                if (modelGiongThuCung != null)
                {
                    Message = "Tạo mới giống thú cưng thành công";
                    _giongThuCungService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo giống thú cưng không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelGiongThuCung);
        }
        #endregion


        #region UploadImage
        [Route("uploadimage")]
        [HttpPost]
        public HttpResponseMessage UploadImage(HttpRequestMessage request)
        {
            GiongThuCung modelGiongThuCung = null;
            try
            {
                var httpRequest = HttpContext.Current.Request;

                //Upload Image
                var postedFile = httpRequest.Files["Image"];
                var id = httpRequest["Id"];
                var giong = _giongThuCungService.GetById(int.Parse(id));
                //Create custom filename
                if (postedFile != null)
                {
                    var imageName = new String(Path.GetFileNameWithoutExtension(postedFile.FileName).Take(10).ToArray())
                        .Replace(" ", "-");
                    imageName = imageName + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(postedFile.FileName);
                    var filePath = HttpContext.Current.Server.MapPath("~/Images/" + imageName);
                    postedFile.SaveAs(filePath);
                    giong.HinhAnh = imageName;
                    _giongThuCungService.Update(giong);
                    _giongThuCungService.SaveChange();
                    modelGiongThuCung = _giongThuCungService.GetById(giong.IdGiongThuCung);
                }
                if (modelGiongThuCung != null)
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
            return GetResponseMessage(IsSuccess, Message, 1, modelGiongThuCung);
        }
        #endregion

        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, GiongThuCung giongThuCung)
        {
            GiongThuCung modelGiongThuCung = null;
            try
            {
                _giongThuCungService.Update(giongThuCung);
                _giongThuCungService.SaveChange();
                modelGiongThuCung = _giongThuCungService.GetById(giongThuCung.IdGiongThuCung);
                if (modelGiongThuCung != null)
                {
                    Message = "Cập nhật thông tin thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Cập nhật thông tin không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelGiongThuCung);
        }
        #endregion


        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {

            GiongThuCung modelGiongThuCung = null;
            try
            {
                _giongThuCungService.KhoaMo(id);
                _giongThuCungService.SaveChange();
                modelGiongThuCung = _giongThuCungService.GetById(id);
                if (modelGiongThuCung != null)
                {
                    if (modelGiongThuCung.TrangThai != null && (bool)modelGiongThuCung.TrangThai)
                    {
                        Message = "Mở giống thú cưng thành công";
                    }
                    else
                    {
                        Message = "Khóa giống thú cưng thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở giống thú cưng không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelGiongThuCung);
        }
        #endregion


        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            return CreateHttpResponse(request, () =>
            {
                HttpResponseMessage response;
                if (!ModelState.IsValid)
                {
                    response = request.CreateResponse(HttpStatusCode.BadRequest, ModelState);
                }
                else
                {
                    //var listNhanVien = _nhanVienService.GetAll();
                    //foreach (var item in listNhanVien)
                    //{
                    //    if (item.TaiKhoan.IdthuCung == id)
                    //    {
                    //        var nhanVien = _nhanVienService.GetById(item.IdNhanVien);
                    //        _taiKhoanService.Delete((int)item.IdTaiKhoan);
                    //        _nhanVienService.Delete(nhanVien.IdNhanVien);
                    //    }
                    //}
                    //_giongThuCungService.SaveChange();
                    //var listSinhVien = _sinhVienService.GetAll();
                    //foreach (var item in listSinhVien)
                    //{
                    //    if (item.TaiKhoan.IdthuCung == id)
                    //    {
                    //        var sinhVien = _sinhVienService.GetById(item.IdSinhVien);
                    //        _taiKhoanService.Delete((int)item.IdTaiKhoan);
                    //        _sinhVienService.Delete(sinhVien.IdSinhVien);
                    //    }
                    //}
                    //_giongThuCungService.SaveChange();
                    var giongThuCungModel = _giongThuCungService.Delete(id);
                    _giongThuCungService.SaveChange();
                    response = request.CreateResponse(HttpStatusCode.Created, giongThuCungModel);
                }
                return response;
            });
        }
        #endregion

    }
    #endregion
}

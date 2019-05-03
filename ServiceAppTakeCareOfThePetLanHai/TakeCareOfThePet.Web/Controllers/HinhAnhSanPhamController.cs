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
    #region api/hinhanhsanpham
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/hinhanhsanpham")]
    public class HinhAnhSanPhamController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly IHinhAnhSanPhamService _hinhAnhSanPhamService;

        public HinhAnhSanPhamController(IErrorService errorService, IHinhAnhSanPhamService hinhAnhSanPhamService)
            : base(errorService)
        {
            _hinhAnhSanPhamService = hinhAnhSanPhamService;
        }
        #endregion

        #region GetAll
        [Route("getallwithidsanpham/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request, int id)
        {
            IEnumerable<HinhAnhSanPham> listHinhAnhSanPham = null;
            var toTal = 0;
            try
            {
                listHinhAnhSanPham = _hinhAnhSanPhamService.GetAllWithIdSanPham(id);
                toTal = listHinhAnhSanPham.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách hình ảnh sản phẩm";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại hình ảnh sản phẩm nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal,listHinhAnhSanPham);
        }
        #endregion

        #region getbyid
        [Route("getbyid/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            HinhAnhSanPham hinhAnhSanPhamSingler = null;
            try
            {
                hinhAnhSanPhamSingler = _hinhAnhSanPhamService.GetById(id);
                if (hinhAnhSanPhamSingler != null)
                {
                    Message = "Thông tin hình ảnh sản phẩm với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được hình ảnh sản phẩm với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message,1, hinhAnhSanPhamSingler);
        }
        #endregion

        #region getonebyidsanpham
        [Route("getonebyidsanpham/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetOneById(HttpRequestMessage request, int id)
        {
            IEnumerable<HinhAnhSanPham> listHinhAnhSanPham = null;
            List<HinhAnhSanPham> hinhAnhSanPhamList = null;
            HinhAnhSanPham hinhAnhSanPhamSingler = null;
            var toTal = 0;
            try
            {
                listHinhAnhSanPham = _hinhAnhSanPhamService.GetAllWithIdSanPham(id);
                hinhAnhSanPhamList = listHinhAnhSanPham.ToList();

                for (int i = 0; i < hinhAnhSanPhamList.Count; i++)
                {
                    hinhAnhSanPhamSingler = hinhAnhSanPhamList[i];
                    return GetResponseMessage(IsSuccess, Message, 1, hinhAnhSanPhamSingler);
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, hinhAnhSanPhamSingler);
        }
        #endregion

        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, HinhAnhSanPham hinhAnhSanPham)
        {
            HinhAnhSanPham modelHinhAnhSanPham = null;
            try
            {
                modelHinhAnhSanPham = _hinhAnhSanPhamService.Add(hinhAnhSanPham);
                if (modelHinhAnhSanPham != null)
                {
                    Message = "Tạo mới hình ảnh sản phẩm thành công";
                    _hinhAnhSanPhamService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo mới hình ảnh sản phẩm không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelHinhAnhSanPham);
        }
        #endregion

        #region UploadImage
        [Route("uploadimage")]
        [HttpPost]
        public HttpResponseMessage UploadImage(HttpRequestMessage request)
        {
            HinhAnhSanPham modelHinhAnhSanPham = null;
            try
            {
                var httpRequest = HttpContext.Current.Request;

                //Upload Image
                var postedFile = httpRequest.Files["fileUpload"];
                var id = httpRequest["IdSanPham"];
                //Create custom filename
                if (postedFile != null)
                {
                    var imageName = new String(Path.GetFileNameWithoutExtension(postedFile.FileName).Take(10).ToArray()).Replace(" ", "-");
                    imageName = imageName + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(postedFile.FileName);
                    var filePath = HttpContext.Current.Server.MapPath("~/Images/" + imageName);
                    postedFile.SaveAs(filePath);

                    //Save to DB
                    var hinhAnh = new HinhAnhSanPham
                    {
                        LinkHinhAnh = imageName,
                        IdSanPham = int.Parse(id),
                    };                
                    _hinhAnhSanPhamService.Add(hinhAnh);
                    _hinhAnhSanPhamService.SaveChange();
                    modelHinhAnhSanPham = _hinhAnhSanPhamService.GetById(hinhAnh.IdHinhAnh);
                }

                if (modelHinhAnhSanPham != null)
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
            return GetResponseMessage(IsSuccess, Message, 1, modelHinhAnhSanPham);
        }
        #endregion

        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, HinhAnhSanPham hinhAnhSanPham)
        {
            HinhAnhSanPham modelHinhAnhSanPham = null;
            try
            {
                _hinhAnhSanPhamService.Update(hinhAnhSanPham);
                _hinhAnhSanPhamService.SaveChange();
                modelHinhAnhSanPham = _hinhAnhSanPhamService.GetById(hinhAnhSanPham.IdHinhAnh);
                if (modelHinhAnhSanPham != null)
                {
                    Message = "Sửa thông tin hình ảnh sản phẩm thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin hình ảnh sản phẩm không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelHinhAnhSanPham);
        }
        #endregion


        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            HinhAnhSanPham modelHinhAnhSanPham = null;
            try
            {
                var hinhAnhWithIdSanPham = _hinhAnhSanPhamService.GetAllWithIdSanPham(id);
                foreach (var item in hinhAnhWithIdSanPham)
                {
                    modelHinhAnhSanPham = _hinhAnhSanPhamService.Delete(item.IdHinhAnh);
                }
                _hinhAnhSanPhamService.SaveChange();
                if (modelHinhAnhSanPham != null)
                {
                    Message = "Xóa hình ảnh sản phẩm thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa hình ảnh sản phẩm không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelHinhAnhSanPham);
        }
        #endregion

    }
    #endregion
}

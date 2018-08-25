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
    #region api/sanpham
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/sanpham")]
    public class SanPhamController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly ISanPhamService _sanPhamService;

        public SanPhamController(IErrorService errorService, ISanPhamService sanPhamService)
            : base(errorService)
        {
            _sanPhamService = sanPhamService;
        }
        #endregion

        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {
            IEnumerable<SanPham> listSanPham = null;
            var toTal = 0;
            try
            {
                listSanPham = _sanPhamService.GetAll();
                toTal = listSanPham.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách sản phẩm";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại sản phẩm nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listSanPham);
        }
        #endregion

        #region GetAll for true
        [Route("getallfortrue")]
        [HttpGet]
        public HttpResponseMessage GetAllForTrue(HttpRequestMessage request)
        {
            IEnumerable<SanPham> listSanPham = null;
            var toTal = 0;
            try
            {
                listSanPham = _sanPhamService.GetAllForTrue();
                toTal = listSanPham.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách sản phẩm";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại sản phẩm nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listSanPham);
        }
        #endregion

        #region GetAll for true getallfortruetopage
        [Route("getallfortruetopage/{page:int}/{pageSize:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllForTrueToPage(HttpRequestMessage request, int page, int pageSize)
        {
            IEnumerable<SanPham> listSanPhamToList = null;
            var toTal = 0;
            try
            {
                var listSanPham = _sanPhamService.GetAllForTrue();
                var sanPhams = listSanPham as SanPham[] ?? listSanPham.ToArray();
                toTal = sanPhams.ToList().Count;
                if (toTal > 0)
                {
                    listSanPhamToList = sanPhams.Skip((page - 1) * pageSize).Take(pageSize);
                    Message = "Danh sách sản phẩm";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại sản phẩm nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listSanPhamToList);
        }
        #endregion

        #region listcountSanPham
        [Route("listcountsanphamwithidshop/{id:int}")]
        [HttpGet]
        public HttpResponseMessage ListCountSanPham(HttpRequestMessage request, int id)
        {
            var listCount = 0;
            try
            {
                listCount = _sanPhamService.ListCountSanPhamWithShop(id);
                Message = "số lượng sản phẩm";
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, listCount);
        }
        #endregion

        #region getbyid
        [Route("getbyid/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            SanPham sanPhamSingler = null;
            try
            {
                sanPhamSingler = _sanPhamService.GetById(id);
                if (sanPhamSingler != null)
                {
                    Message = "Thông tin sản phẩm với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được sản phẩm với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, sanPhamSingler);
        }
        #endregion

        #region Load danh sách thông tin của sản phẩm
        [Route("getallbyidshop/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllByIdShop(HttpRequestMessage request, int id)
        {
            IEnumerable<SanPham> sanPhamAllByIdNguoiDung = null;
            var toTal = 0;
            try
            {
                sanPhamAllByIdNguoiDung = _sanPhamService.GetAllByIdShop(id);
                toTal = sanPhamAllByIdNguoiDung.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Thông tin danh sach sản phẩm với id shop";
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được thông tin sản phẩm với id shop {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, sanPhamAllByIdNguoiDung);
        }
        #endregion

        #region Load danh sách thông tin của sản phẩm theo id loại sản phẩm
        [Route("getallbyidloaisanpham/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllByIdLoaiSanPham(HttpRequestMessage request, int id)
        {
            IEnumerable<SanPham> sanPhamAllByIdLoaiSanPham = null;
            var toTal = 0;
            try
            {
                sanPhamAllByIdLoaiSanPham = _sanPhamService.GetAllByIdLoaiSanPham(id);
                toTal = sanPhamAllByIdLoaiSanPham.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Thông tin danh sach sản phẩm với id shop";
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được thông tin sản phẩm với id shop {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, sanPhamAllByIdLoaiSanPham);
        }
        #endregion

        #region Load danh sách thông tin của sản phẩm
        [Route("getallbyidshopfortrue/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllByIdShopForTrue(HttpRequestMessage request, int id)
        {
            IEnumerable<SanPham> sanPhamAllByIdNguoiDung = null;
            var toTal = 0;
            try
            {
                sanPhamAllByIdNguoiDung = _sanPhamService.GetAllByIdShopForTrue(id);
                toTal = sanPhamAllByIdNguoiDung.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Thông tin danh sach sản phẩm với id shop";
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được thông tin sản phẩm với id shop {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, sanPhamAllByIdNguoiDung);
        }
        #endregion

        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, SanPham sanPham)
        {
            SanPham modelSanPham = null;
            try
            {
                sanPham.NgayNhap = DateTime.Now;
                modelSanPham = _sanPhamService.Add(sanPham);
                if (modelSanPham != null)
                {
                    Message = "Tạo mới sản phẩm thành công";
                    _sanPhamService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo sản phẩm không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelSanPham);
        }
        #endregion


        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, SanPham sanPham)
        {
            SanPham modelSanPham = null;
            try
            {
                sanPham.NgayNhap = DateTime.Now;
                _sanPhamService.Update(sanPham);
                _sanPhamService.SaveChange();
                modelSanPham = _sanPhamService.GetById(sanPham.IdSanPham);
                if (modelSanPham != null)
                {
                    Message = "Sửa thông tin sản phẩm thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin sản phẩm không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelSanPham);
        }
        #endregion


        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {

            SanPham modelSanPham = null;
            try
            {
                _sanPhamService.KhoaMo(id);
                _sanPhamService.SaveChange();
                modelSanPham = _sanPhamService.GetById(id);
                if (modelSanPham != null)
                {
                    if (modelSanPham.TrangThai != null && (bool)modelSanPham.TrangThai)
                    {
                        Message = "Mở sản phẩm thành công";
                    }
                    else
                    {
                        Message = "Khóa sản phẩm thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở sản phẩm không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelSanPham);

        }
        #endregion
    }
    #endregion
}

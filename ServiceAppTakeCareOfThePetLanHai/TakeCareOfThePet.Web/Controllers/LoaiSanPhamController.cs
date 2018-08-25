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
    #region api/loaisanpham
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/loaisanpham")]
    public class LoaiSanPhamController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly ILoaiSanPhamService _loaiSanPhamService;

        public LoaiSanPhamController(IErrorService errorService, ILoaiSanPhamService loaiSanPhamService)
            : base(errorService)
        {
            _loaiSanPhamService = loaiSanPhamService;
        }
        #endregion

        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {
            IEnumerable<LoaiSanPham> listLoaiSanPham = null;
            var toTal = 0;
            try
            {
                listLoaiSanPham = _loaiSanPhamService.GetAll();
                toTal = listLoaiSanPham.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách loại sản phẩm";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại loại sản phẩm nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listLoaiSanPham);
        }
        #endregion

        #region GetAll
        [Route("getallloaisanphamwithsanpham")]
        [HttpGet]
        public HttpResponseMessage GetAllLoaiSanPhamWithSanPham(HttpRequestMessage request)
        {
            IEnumerable<LoaiSanPham> listLoaiSanPham = null;
            var toTal = 0;
            try
            {
                listLoaiSanPham = _loaiSanPhamService.GetAllLoaiSanPhamWithSanPham();
                toTal = listLoaiSanPham.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách loại sản phẩm";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại loại sản phẩm nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listLoaiSanPham);
        }
        #endregion

        #region getallbyidshop
        [Route("getallbyidshop/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllByIdShop(HttpRequestMessage request, int id)
        {
            IEnumerable<LoaiSanPham> listLoaiSanPham = null;
            var toTal = 0;
            try
            {
                listLoaiSanPham = _loaiSanPhamService.GetAllByIdShop(id);
                toTal = listLoaiSanPham.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách loại sản phẩm với id shop";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại loại sản phẩm nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listLoaiSanPham);
        }
        #endregion

        #region getallbyidshop for true
        [Route("getallbyidshopfortrue/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllByIdShopForTrue(HttpRequestMessage request, int id)
        {
            IEnumerable<LoaiSanPham> listLoaiSanPham = null;
            var toTal = 0;
            try
            {
                listLoaiSanPham = _loaiSanPhamService.GetAllByIdShopForTrue(id);
                toTal = listLoaiSanPham.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách loại sản phẩm được hiển thi cho người dùng xem với id shop";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại loại sản phẩm nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listLoaiSanPham);
        }
        #endregion

        [Route("listcountloaisanphamwithidshop/{id:int}")]
        [HttpGet]
        public HttpResponseMessage ListCountLoaiSanPham(HttpRequestMessage request, int id)
        {
            var listCount = 0;
            try
            {
                listCount = _loaiSanPhamService.ListCountLoaiSanPhamWithShop(id);
                Message = "số lượng loại sản phẩm";
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
            LoaiSanPham loaiSanPhamSingler = null;
            try
            {
                loaiSanPhamSingler = _loaiSanPhamService.GetById(id);
                if (loaiSanPhamSingler != null)
                {
                    Message = "Thông tin loại sản phẩm với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được loại sản phẩm với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, loaiSanPhamSingler);
        }
        #endregion


        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, LoaiSanPham loaiSanPham)
        {
            LoaiSanPham modelLoaiSanPham = null;
            try
            {
                modelLoaiSanPham = _loaiSanPhamService.Add(loaiSanPham);
                if (modelLoaiSanPham != null)
                {
                    Message = "Tạo mới loại sản phẩm thành công";
                    _loaiSanPhamService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo mới loại sản phẩm không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelLoaiSanPham);
        }
        #endregion


        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, LoaiSanPham loaiSanPham)
        {
            LoaiSanPham modelLoaiSanPham = null;
            try
            {
                _loaiSanPhamService.Update(loaiSanPham);
                _loaiSanPhamService.SaveChange();
                modelLoaiSanPham = _loaiSanPhamService.GetById(loaiSanPham.IdLoaiSanPham);
                if (modelLoaiSanPham != null)
                {
                    Message = "Sửa thông tin loại sản phẩm thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin loại sản phẩm không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelLoaiSanPham);
        }
        #endregion

        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {

            LoaiSanPham modelLoaiSanPham = null;
            try
            {
                _loaiSanPhamService.KhoaMo(id);
                _loaiSanPhamService.SaveChange();
                modelLoaiSanPham = _loaiSanPhamService.GetById(id);
                if (modelLoaiSanPham != null)
                {
                    if (modelLoaiSanPham.TrangThai != null && (bool)modelLoaiSanPham.TrangThai)
                    {
                        Message = "Mở loại sản phẩm thành công";
                    }
                    else
                    {
                        Message = "Khóa loại sản phẩm thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở loại sản phẩm không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelLoaiSanPham);
        }
        #endregion


        //#region delete
        //[Route("delete/{id:int}")]
        //[HttpGet]
        //public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        //{
        //    LoaiSanPham ModelLoaiSanPham = null;
        //    try
        //    {
        //        var ListBaiViet = _baiVietService.BaiVietWithIdLoaiSanPham(id);
        //        foreach (var item in ListBaiViet)
        //        {
        //            _baiVietService.Delete(item.IdBaiViet);
        //        }
        //        _loaiSanPhamService.SaveChange();
        //        ModelLoaiSanPham = _loaiSanPhamService.Delete(id);
        //        _loaiSanPhamService.SaveChange();
        //        if (ModelLoaiSanPham != null)
        //        {
        //            _message = "Xóa loại sản phẩm thành công";
        //        }
        //        else
        //        {
        //            throw new DbEntityValidationException(string.Format("Xóa loại sản phẩm không thành công"));
        //        }
        //    }
        //    catch (DbEntityValidationException ex)
        //    {
        //        LogException(ex);
        //    }
        //    return GetResponseMessage(_isSuccess, _message, ModelLoaiSanPham);
        //}
        //#endregion

    }
    #endregion

}

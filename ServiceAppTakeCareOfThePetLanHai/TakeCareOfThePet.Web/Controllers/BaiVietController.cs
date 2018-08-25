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
    #region api/BaiViet
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/baiviet")]
    public class BaiVietController : ApiControllerBase
    {
        #region Khởi tạo

        readonly IBaiVietService _baiVietService;
        readonly IBinhLuanService _binhLuanService;
        readonly ILikeService _likeService;
        public BaiVietController(ILikeService likeService, IErrorService errorService, IBaiVietService baiVietService, IBinhLuanService binhLuanService)
            : base(errorService)
        {
            _baiVietService = baiVietService;
            _binhLuanService = binhLuanService;
            _likeService = likeService;
        }
        #endregion

        /// <summary>
        /// trả về danh sách bài viết với id người dùng truyền vào
        /// </summary>
        /// <param name="request"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        #region get all by id nguoi dung
        [Route("getallbyidnguoidung/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllByIdNguoiDung(HttpRequestMessage request, int id)
        {
            IEnumerable<BaiViet> listBaiVietNguoiDung = null;
            var toTal = 0;
            try
            {
                listBaiVietNguoiDung = _baiVietService.BaiVietWithIdNguoiDung(id);
                toTal = listBaiVietNguoiDung.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách Bài Viet thú cưng";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại Bài Viet thú cưng nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listBaiVietNguoiDung);
        }
        #endregion

        /// <summary>
        /// trả về danh sách bài viết với id chuyên mục truyền vào
        /// </summary>
        /// <param name="request"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        #region get all by id chuyen muc
        [Route("getallbyidchuyenmuc/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllByIdChuyenMuc(HttpRequestMessage request, int id)
        {
            IEnumerable<BaiViet> listLike = null;
            var toTal = 0;
            try
            {
                listLike = _baiVietService.BaiVietWithIdChuyenMuc(id);
                toTal = listLike.ToList().Count;
                if (toTal
                    > 0)
                {
                    Message = "Danh sách bài viết cua chuyên mục";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại danh sách bài viết của chuyên mục nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listLike);
        }
        #endregion

        #region GetAllLikeByIdBaiViet
        [Route("getalllikebyidbaiviet/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllLikeByIdBaiViet(HttpRequestMessage request, int id)
        {
            IEnumerable<Like> listLike = null;
            var toTal = 0;
            try
            {
                listLike = _likeService.GetAllWithIdBaiViet(id);
                toTal = listLike.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách like cua bai viet";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại danh sách like cua bai viet");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listLike);
        }
        #endregion

        /// <summary>
        /// trả về danh sách các bài viết có trong database khóa mở gì củng hiển thị
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {
            IEnumerable<BaiViet> listBaiViet = null;
            var toTal = 0;
            try
            {
                listBaiViet = _baiVietService.GetAll();
                toTal = listBaiViet.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách bài viết";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại bài viết nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listBaiViet);
        }
        #endregion

        /// <summary>
        /// trả về danh sách bài viết có trong db nhưng được lọc chỉ những bài viết được public và sắp xếp theo ngày tháng
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        #region getallsortdate
        [Route("getallsortdate")]
        [HttpGet]
        public HttpResponseMessage GetAllSortDate(HttpRequestMessage request)
        {
            IEnumerable<BaiViet> listBaiViet = null;
            var toTal = 0;
            try
            {
                listBaiViet = _baiVietService.GetAllSortDate();
                toTal = listBaiViet.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách bài viết có sắp xếp";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại bài viết sắp xếp nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listBaiViet);
        }
        #endregion

        /// <summary>
        /// trả về danh sách bài viết có trong db
        /// nhưng được lọc chỉ những bài viết được public và sắp xếp theo ngày tháng
        /// có phân trang
        /// </summary>
        /// <param name="request"></param>
        /// <param name="page"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        #region getallsortdatetopage
        [Route("getallsortdatetopage/{page:int}/{pageSize:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllSortDateToPage(HttpRequestMessage request, int page, int pageSize)
        {
            IEnumerable<BaiViet> listBaiVietToPage = null;
            var toTal = 0;
            try
            {
                var listBaiViet = _baiVietService.GetAllSortDate();
                var baiViets = listBaiViet as BaiViet[] ?? listBaiViet.ToArray();
                toTal = baiViets.ToList().Count;
                if (toTal > 0)
                {
                    listBaiVietToPage = baiViets.Skip((page - 1) * pageSize).Take(pageSize);
                    Message = "Danh sách bài viết có sắp xếp va phan trang";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại bài viết sắp xếp nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listBaiVietToPage);
        }
        #endregion

        #region listcountBaiViet
        [Route("listcountbaiviet")]
        [HttpGet]
        public HttpResponseMessage ListCountBaiViet(HttpRequestMessage request)
        {
            var listCount = 0;
            try
            {
                listCount = _baiVietService.ListCountBaiViet();
                Message = "số lượng bài viết";
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, listCount, listCount);
        }
        #endregion

        /// <summary>
        /// trả về bài viết với id bài viết được truyền vào
        /// </summary>
        /// <param name="request"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        #region getbyid
        [Route("getbyid/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request, int id)
        {
            BaiViet baiViet = null;
            try
            {
                baiViet = _baiVietService.GetById(id);
                if (baiViet != null)
                {
                    Message = "thông tin bài viết";
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tồn tại bài viết với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, baiViet);
        }
        #endregion

        /// <summary>
        /// tạo mới một bài viết
        /// </summary>
        /// <param name="request"></param>
        /// <param name="baiViet"></param>
        /// <returns></returns>
        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, BaiViet baiViet)
        {
            BaiViet modelBaiViet = null;
            try
            {
                baiViet.NgayDang = DateTime.Now;
                baiViet.TrangThai = true;
                baiViet.SoCmt = 0;
                baiViet.SoLike = 0;
                modelBaiViet = _baiVietService.Add(baiViet);
                if (modelBaiViet != null)
                {
                    Message = "Tạo mới Bài Viet thành công";
                    _baiVietService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo Bài Viet không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelBaiViet);
        }
        #endregion

        /// <summary>
        /// like bài viết với id bài viết được truyền vào
        /// tự động tăng lên
        /// </summary>
        /// <param name="request"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        #region like
        [Route("like")]
        [HttpPost]
        public HttpResponseMessage Like(HttpRequestMessage request, Like like)
        {
            try
            {
                _likeService.Like(like);
                Message = "like Bài Viet thành công";
                _baiVietService.SaveChange();
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, null);
        }
        #endregion

        /// <summary>
        /// cập nhật bài viết
        /// </summary>
        /// <param name="request"></param>
        /// <param name="baiViet"></param>
        /// <returns></returns>
        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, BaiViet baiViet)
        {
            BaiViet modelBaiViet = null;
            try
            {
                _baiVietService.Update(baiViet);
                _baiVietService.SaveChange();
                modelBaiViet = _baiVietService.GetById(baiViet.IdBaiViet);
                if (modelBaiViet != null)
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
            return GetResponseMessage(IsSuccess, Message, 1, modelBaiViet);
        }
        #endregion

        /// <summary>
        /// khóa mở bài viết ở trạng thái public hay private
        /// </summary>
        /// <param name="request"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {
            BaiViet modelBaiViet = null;
            try
            {
                _baiVietService.KhoaMo(id);
                _baiVietService.SaveChange();
                modelBaiViet = _baiVietService.GetById(id);
                if (modelBaiViet != null)
                {
                    if (modelBaiViet.TrangThai != null && (bool)modelBaiViet.TrangThai)
                    {
                        Message = "Mở Bài Viet thành công";
                    }
                    else
                    {
                        Message = "Khóa Bài Viet thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở Bài Viet không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelBaiViet);
        }
        #endregion

        /// <summary>
        /// xóa bài viết với id truyền vào
        /// </summary>
        /// <param name="request"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            BaiViet modelBaiViet = null;
            try
            {
                var listBinhLuan = _binhLuanService.BinhLuanWithIdBaiViet(id);
                foreach (var item in listBinhLuan)
                {
                    _binhLuanService.Delete(item.IdBinhLuan);
                }
                _baiVietService.SaveChange();
                modelBaiViet = _baiVietService.Delete(id);
                _baiVietService.SaveChange();
                if (modelBaiViet != null)
                {
                    Message = "Xóa Bài Viet thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa Bài Viet không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelBaiViet);
        }
        #endregion

    }
    #endregion
}

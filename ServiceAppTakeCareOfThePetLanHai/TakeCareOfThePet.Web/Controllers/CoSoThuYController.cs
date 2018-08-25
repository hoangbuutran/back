using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using TakeCareOfThePet.Common.ModelChung;
using TakeCareOfThePet.Model.Models;
using TakeCareOfThePet.Service;
using TakeCareOfThePet.Web.Infrastructure.Core;

namespace TakeCareOfThePet.Web.Controllers
{

    #region api/CoSoThuY
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/cosothuy")]
    public class CoSoThuYController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly ICoSoThuYService _coSoThuYService;
        private readonly ITaiKhoanService _taiKhoanService;
        private readonly IGioiThieuService _gioiThieuService;
        public CoSoThuYController(IErrorService errorService, ICoSoThuYService coSoThuYService, ITaiKhoanService taiKhoanService, IGioiThieuService gioiThieuService)
            : base(errorService)
        {
            _coSoThuYService = coSoThuYService;
            _taiKhoanService = taiKhoanService;
            _gioiThieuService = gioiThieuService;
        }
        #endregion

        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {
            IEnumerable<CoSoThuY> listCoSoThuY = null;
            var toTal = 0;
            try
            {
                listCoSoThuY = _coSoThuYService.GetAll();
                toTal = listCoSoThuY.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách cơ sở thú y";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại cơ sở thú y nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listCoSoThuY);
        }
        #endregion

        #region GetAll for true
        [Route("getallfortrue")]
        [HttpGet]
        public HttpResponseMessage GetAllForTrue(HttpRequestMessage request)
        {
            IEnumerable<CoSoThuY> listCoSoThuY = null;
            var toTal = 0;
            try
            {
                listCoSoThuY = _coSoThuYService.GetAll();
                toTal = listCoSoThuY.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách cơ sở thú y";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại cơ sở thú y nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listCoSoThuY);
        }
        #endregion

        #region searchkey
        [Route("searchkey/{searchKey}")]
        [HttpGet]
        public HttpResponseMessage SearchKey(HttpRequestMessage request, string keySearch)
        {
            IEnumerable<CoSoThuY> listCoSoThuY = null;
            var toTal = 0;
            try
            {
                listCoSoThuY = _coSoThuYService.GetAllSearchKey(keySearch);
                toTal = listCoSoThuY.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách cơ sở thú y theo key search";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại cơ sở thú y nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listCoSoThuY);
        }
        #endregion


        [Route("listcountcosothuy")]
        [HttpGet]
        public HttpResponseMessage ListCountCoSoThuY(HttpRequestMessage request)
        {
            var listCount = 0;
            try
            {
                listCount = _coSoThuYService.ListCountCoSoThuY();
                Message = "số lượng cơ sở thú y";
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
            CoSoThuY coSoThuYSingler = null;
            try
            {
                coSoThuYSingler = _coSoThuYService.GetById(id);
                if (coSoThuYSingler != null)
                {
                    Message = "Thông tin cơ sở thú y với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được cơ sở thú y với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, coSoThuYSingler);
        }
        #endregion

        #region getbyidtaikhoan
        [Route("getbyidtaikhoan/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetByIdTaiKhoan(HttpRequestMessage request, int id)
        {
            CoSoThuY coSoThuYSingler = null;
            try
            {
                coSoThuYSingler = _coSoThuYService.GetByIdTaiKhoan(id);
                if (coSoThuYSingler != null)
                {
                    Message = "Thông tin cơ sở thú y với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được cơ sở thú y với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, coSoThuYSingler);
        }
        #endregion

        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, CoSoThuY coSoThuY)
        {
            CoSoThuY modelCoSoThuY = null;
            try
            {
                var tenTaiKhoan1 = coSoThuY.TenCoSoThuY.ToLower();
                var tenTaiKhoan2 = _coSoThuYService.ThayDoiChuoi(tenTaiKhoan1);
                var tenTaiKhoan3 = tenTaiKhoan2.Replace(" ", "");
                var pass = coSoThuY.SDT.Substring(6);
                var taikhoan = new TaiKhoan
                {
                    UserName = tenTaiKhoan3,
                    Pass = pass,
                    IdQuyen = 2,
                    TrangThai = true,
                };
                var taiKhoan = _taiKhoanService.Add(taikhoan);
                _coSoThuYService.SaveChange();
                if (taiKhoan.IdTaiKhoan != 0)
                {
                    coSoThuY.IdTaiKhoan = taikhoan.IdTaiKhoan;
                    modelCoSoThuY = _coSoThuYService.Add(coSoThuY);
                    _coSoThuYService.SaveChange();
                    if (modelCoSoThuY != null)
                    {
                        Message = "Tạo mới người dùng và tài khoản thành công thành công";
                        _taiKhoanService.SaveChange();
                    }
                }
                if (modelCoSoThuY != null)
                {
                    var gioiThieu = new GioiThieu()
                    {
                        IdCoSoThuY = modelCoSoThuY.IdCoSoThuY,
                        NoiDung = "Phần giới thiệu của cơ sở thú y ở đây",
                    };
                    _gioiThieuService.Add(gioiThieu);
                    _coSoThuYService.SaveChange();
                    Message = "Tạo mới cơ sở thú y thành công";
                }
                else
                {
                    throw new DbEntityValidationException("tạo mới cơ sở thú y không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelCoSoThuY);
        }
        #endregion


        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {

            CoSoThuY modelCoSoThuY = null;
            try
            {
                _coSoThuYService.KhoaMo(id);
                _coSoThuYService.SaveChange();
                modelCoSoThuY = _coSoThuYService.GetById(id);
                if (modelCoSoThuY != null)
                {
                    if (modelCoSoThuY.TrangThai != null && (bool)modelCoSoThuY.TrangThai)
                    {
                        Message = "Mở cơ sở thú y thành công";
                    }
                    else
                    {
                        Message = "Khóa cơ sở thú y thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở cơ sở thú y không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelCoSoThuY);
        }
        #endregion

        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, CoSoThuY manNang)
        {
            CoSoThuY modelCoSoThuY = null;
            try
            {
                _coSoThuYService.Update(manNang);
                _coSoThuYService.SaveChange();
                modelCoSoThuY = _coSoThuYService.GetById(manNang.IdCoSoThuY);
                if (modelCoSoThuY != null)
                {
                    Message = "Sửa thông tin cơ sở thú y thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin cơ sở thú y không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelCoSoThuY);
        }
        #endregion


        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            CoSoThuY modelCoSoThuY = null;
            try
            {
                modelCoSoThuY = _coSoThuYService.GetById(id);
                if (modelCoSoThuY.IdTaiKhoan != null) _taiKhoanService.Delete((int)modelCoSoThuY.IdTaiKhoan);
                _coSoThuYService.SaveChange();
                modelCoSoThuY = _coSoThuYService.Delete(id);
                _coSoThuYService.SaveChange();
                if (modelCoSoThuY != null)
                {
                    Message = "Xóa cơ sở thú y thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa cơ sở thú y không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, modelCoSoThuY);
        }
        #endregion

    }
    #endregion
}

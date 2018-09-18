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
    [RoutePrefix("api/phieu-hen-kham")]
    public class PhieuHenKhamController : ApiControllerBase
    {
        private readonly IPhieuHenKhamService _phieuHenKhamService;
        private readonly INguoiDungService _nguoiDungService;
        public PhieuHenKhamController(IErrorService errorService, IPhieuHenKhamService phieuHenKhamService, INguoiDungService nguoiDungService)
            : base(errorService)
        {
            _phieuHenKhamService = phieuHenKhamService;
            _nguoiDungService = nguoiDungService;
        }

        #region getbyid
        [Route("get-by-id/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            PhieuHenKham phieuHenKhamSinger = null;
            try
            {
                phieuHenKhamSinger = _phieuHenKhamService.GetById(id);
                if (phieuHenKhamSinger != null)
                {
                    Message = "Thông tin Phieu Hen Kham với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được Phieu Hen Kham với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, phieuHenKhamSinger);
        }
        #endregion

        #region DuyetPhieuHenKham
        [Route("duyet-phieu-hen-kham/{id:int}")]
        [HttpGet]
        public HttpResponseMessage DuyetPhieuHenKham(HttpRequestMessage request, int id)
        {
            try
            {
                _phieuHenKhamService.DuyetPhieuHenKham(id);
                _phieuHenKhamService.SaveChange();
                Message = "Thông tin Phieu Hen Kham với id: " + id;
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, null);
        }
        #endregion

        #region TuChoiPhieuHenKham
        [Route("tu-choi-phieu-hen-kham/{id:int}")]
        [HttpGet]
        public HttpResponseMessage TuChoiPhieuHenKham(HttpRequestMessage request, int id)
        {
            try
            {
                _phieuHenKhamService.TuChoiPhieuHenKham(id);
                _phieuHenKhamService.SaveChange();
                Message = "Thông tin Phieu Hen Kham với id: " + id;
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, null);
        }
        #endregion

        #region GetAllWithIdNguoiDung
        [Route("get-all-with-id-nguoi-dung/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, int id)
        {
            IEnumerable<PhieuHenKham> listPhieuHenKhams = null;
            var toTal = 0;
            try
            {
                listPhieuHenKhams = _phieuHenKhamService.GetAllWithIdNguoiDung(id);
                toTal = listPhieuHenKhams.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách Phieu Hen Kham voi id co so thu y";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại Phieu Hen Kham nào voi id co so thu y");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listPhieuHenKhams);
        }
        #endregion

        #region GetAllWithIdCoSoThuY
        [Route("get-all-with-id-cosothuy/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllWithIdCoSoThuY(HttpRequestMessage request, int id)
        {
            IEnumerable<PhieuHenKham> listPhieuHenKhams = null;
            var toTal = 0;
            try
            {
                listPhieuHenKhams = _phieuHenKhamService.GetAllWithIdCoSoThuY(id);
                toTal = listPhieuHenKhams.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách Phieu Hen Kham voi id co so thu y";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại Phieu Hen Kham nào voi id co so thu y");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listPhieuHenKhams);
        }
        #endregion

        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, PhieuHenKham phieuHenKham)
        {
            PhieuHenKham phieuHenKhamSinger = null;
            try
            {
                if (phieuHenKham.IdNguoiDung != null)
                {
                    NguoiDung nguoiDungSinger = _nguoiDungService.GetById((int) phieuHenKham.IdNguoiDung);
                    if (!nguoiDungSinger.Email.Equals(""))
                    {
                        phieuHenKhamSinger = _phieuHenKhamService.Add(phieuHenKham);
                    }
                    else
                    {
                        throw new DbEntityValidationException("tài khoản người dùng chưa cập nhật email và những thông tin khác");
                    }    
                } 
                if (phieuHenKhamSinger != null)
                {
                    Message = "Tạo mới Phieu Hen Kham thành công";
                    _phieuHenKhamService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo mới Phieu Hen Kham không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, phieuHenKhamSinger);
        }
        #endregion

        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, PhieuHenKham phieuHenKham)
        {
            PhieuHenKham phieuHenKhamSinger = null;
            try
            {
                _phieuHenKhamService.Update(phieuHenKham);
                _phieuHenKhamService.SaveChange();
                phieuHenKhamSinger = _phieuHenKhamService.GetById(phieuHenKham.IdLichHenKham);
                if (phieuHenKhamSinger != null)
                {
                    Message = "Sửa thông tin Phieu Hen Kham thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin Phieu Hen Kham không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, phieuHenKhamSinger);
        }
        #endregion


        #region phieuvoingay
        [Route("phieu-voi-ngay")]
        [HttpPost]
        public HttpResponseMessage PhieuVoiNgay(HttpRequestMessage request, PhieuVoiNgay phieuVoiNgay)
        {
            PhieuHenKham phieuHenKhamList = null;
            try
            {
                phieuHenKhamList = _phieuHenKhamService.listPhieuVoiNgay(phieuVoiNgay);  
                if (phieuHenKhamList != null)
                {
                    Message = "ds Phieu Hen Kham voi ngay";
                    _phieuHenKhamService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("ds Phieu Hen Kham voi ngay");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, phieuHenKhamList);
        }
        #endregion


        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            PhieuHenKham phieuHenKhamSinger = null;
            try
            {
                phieuHenKhamSinger = _phieuHenKhamService.Delete(id);
                _phieuHenKhamService.SaveChange();
                if (phieuHenKhamSinger != null)
                {
                    Message = "Xóa Phieu Hen Kham thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa Phieu Hen Kham không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, phieuHenKhamSinger);
        }
        #endregion

    }
}

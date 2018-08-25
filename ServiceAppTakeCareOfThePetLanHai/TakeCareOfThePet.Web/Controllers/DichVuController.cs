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
    [RoutePrefix("api/dich-vu")]
    public class DichVuController : ApiControllerBase
    {
        private readonly IDichVuService _dichVuService;
        public DichVuController(IErrorService errorService, IDichVuService dichVuService)
            : base(errorService)
        {
            _dichVuService = dichVuService;
        }

        #region getbyid
        [Route("get-by-id/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            DichVu dichVuSinger = null;
            try
            {
                dichVuSinger = _dichVuService.GetById(id);
                if (dichVuSinger != null)
                {
                    Message = "Thông tin dich vu với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được dich vu với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, dichVuSinger);
        }
        #endregion

        #region searchkey
        [Route("search-key/{searchKey}")]
        [HttpGet]
        public HttpResponseMessage SearchKey(HttpRequestMessage request, string searchKey)
        {

            IEnumerable<DichVu> listDichVus = null;
            var toTal = 0;
            try
            {
                listDichVus = _dichVuService.GetAllKeySearch(searchKey);
                toTal = listDichVus.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách dich vu";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại dich vu nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listDichVus);
        }
        #endregion

        #region GetAllWithIdCoSoThuYfortrue
        [Route("get-all-with-id-cosothuy-for-true/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, int id)
        {
            IEnumerable<DichVu> listDichVus = null;
            var toTal = 0;
            try
            {
                listDichVus = _dichVuService.GetAllWithIdCoSoThuYForTrue(id);
                toTal = listDichVus.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách dich vu voi id co so thu y";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại dich vu nào voi id co so thu y");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listDichVus);
        }
        #endregion

        #region GetAllWithIdCoSoThuY
        [Route("get-all-with-id-cosothuy/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetAllWithIdCoSoThuY(HttpRequestMessage request, int id)
        {
            IEnumerable<DichVu> listDichVus = null;
            var toTal = 0;
            try
            {
                listDichVus = _dichVuService.GetAllWithIdCoSoThuY(id);
                toTal = listDichVus.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách dich vu voi id co so thu y";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại dich vu nào voi id co so thu y");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listDichVus);
        }
        #endregion

        #region create
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, DichVu dichVu)
        {
            DichVu dichVuSinger = null;
            try
            {
                dichVuSinger = _dichVuService.Add(dichVu);
                if (dichVuSinger != null)
                {
                    Message = "Tạo mới dich vu thành công";
                    _dichVuService.SaveChange();
                }
                else
                {
                    throw new DbEntityValidationException("tạo mới dich vu không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, dichVuSinger);
        }
        #endregion

        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, DichVu dichVu)
        {
            DichVu dichVuSinger = null;
            try
            {
                _dichVuService.Update(dichVu);
                _dichVuService.SaveChange();
                dichVuSinger = _dichVuService.GetById(dichVu.IdDichVu);
                if (dichVuSinger != null)
                {
                    Message = "Sửa thông tin dich vu thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin dich vu không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, dichVuSinger);
        }
        #endregion

        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {

            DichVu dichVuSinger = null;
            try
            {
                _dichVuService.KhoaMo(id);
                _dichVuService.SaveChange();
                dichVuSinger = _dichVuService.GetById(id);
                if (dichVuSinger != null)
                {
                    if (dichVuSinger.TinhTrang != null && (bool)dichVuSinger.TinhTrang)
                    {
                        Message = "Mở dich vu thành công";
                    }
                    else
                    {
                        Message = "Khóa dich vu thành công";
                    }
                }
                else
                {
                    throw new DbEntityValidationException("Khóa mở dich vu không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, dichVuSinger);
        }
        #endregion

        #region delete
        [Route("delete/{id:int}")]
        [HttpGet]
        public HttpResponseMessage Delete(HttpRequestMessage request, int id)
        {
            DichVu dichVuSinger = null;
            try
            {
                dichVuSinger = _dichVuService.Delete(id);
                _dichVuService.SaveChange();
                if (dichVuSinger != null)
                {
                    Message = "Xóa dich vu thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Xóa dich vu không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, dichVuSinger);
        }
        #endregion
    }
}

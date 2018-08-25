using System.Data.Entity.Validation;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using TakeCareOfThePet.Model.Models;
using TakeCareOfThePet.Service;
using TakeCareOfThePet.Web.Infrastructure.Core;

namespace TakeCareOfThePet.Web.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/gioi-thieu")]
    public class GioiThieuController : ApiControllerBase
    {
        private readonly IGioiThieuService _gioiThieuService;
        public GioiThieuController(IErrorService errorService, IGioiThieuService gioiThieuService) : base(errorService)
        {
            _gioiThieuService = gioiThieuService;
        }
        #region update
        [Route("update")]
        [HttpPut]
        public HttpResponseMessage Update(HttpRequestMessage request, GioiThieu gioiThieu)
        {
            GioiThieu gioiThieuSinger = null;
            try
            {
                _gioiThieuService.Update(gioiThieu);
                _gioiThieuService.SaveChange();
                gioiThieuSinger = _gioiThieuService.GetById(gioiThieu.IdGioiThieu);
                if (gioiThieuSinger != null)
                {
                    Message = "Sửa thông tin gioi thieu thành công";
                }
                else
                {
                    throw new DbEntityValidationException("sửa thông tin gioi thieu không thành công");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, gioiThieuSinger);
        }
        #endregion

        #region getbyid
        [Route("get-by-id/{id:int}")]
        [HttpGet]
        public HttpResponseMessage GetById(HttpRequestMessage request, int id)
        {
            GioiThieu gioiThieuSinger = null;
            try
            {
                gioiThieuSinger = _gioiThieuService.GetById(id);
                if (gioiThieuSinger != null)
                {
                    Message = "Thông tin gioi thieu với id: " + id;
                }
                else
                {
                    throw new DbEntityValidationException(string.Format("Không tìm kiếm được gioi thieu với id {0}", id));
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, gioiThieuSinger);
        }
        #endregion
    }
}

using TakeCareOfThePet.Model.Models;
using TakeCareOfThePet.Service;
using TakeCareOfThePet.Web.Infrastructure.Core;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
//using System.Web.Script.Serialization;
using System.Data.Entity.Validation;

namespace TakeCareOfThePet.Web.Controllers
{
    #region api/quyen
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    [RoutePrefix("api/quyen")]
    public class QuyenController : ApiControllerBase
    {
        #region Khởi tạo

        private readonly IQuyenService _quyenService;
        public QuyenController(IErrorService errorService, IQuyenService quyenService)
            : base(errorService)
        {
            _quyenService = quyenService;
        }
        #endregion

        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {
            IEnumerable<Quyen> listQuyen = null;
            var toTal = 0;
            try
            {
                listQuyen = _quyenService.GetAll();
                toTal = listQuyen.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách quyền";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại quyền nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listQuyen);
        }
        #endregion

        [Route("listcountquyen")]
        [HttpGet]
        public HttpResponseMessage ListCountQuyen(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listCount = _quyenService.ListCountQuyen();
                HttpResponseMessage reponse = request.CreateResponse(HttpStatusCode.OK, listCount);
                return reponse;
            });
        }


        #region khoamo
        [Route("khoamo/{id:int}")]
        [HttpGet]
        public HttpResponseMessage KhoaMo(HttpRequestMessage request, int id)
        {

            Quyen quyenSinger = null;
            try
            {
                _quyenService.KhoaMo(id);
                _quyenService.SaveChange();
                quyenSinger = _quyenService.GetById(id);
                if (quyenSinger != null)
                {
                    Message = "Khóa quyền thành công";
                }
                else
                {
                    throw new DbEntityValidationException("Khóa quyền thất bại");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, 1, quyenSinger);
        }
        #endregion


    }
    #endregion
}

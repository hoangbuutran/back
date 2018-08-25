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
    [RoutePrefix("api/error")]
    public class ErrorController : ApiControllerBase
    {
        #region Khởi tạo

        public ErrorController(IErrorService errorService)
            : base(errorService)
        {
        }
        #endregion

        #region GetAll
        [Route("getall")]
        [HttpGet]
        public HttpResponseMessage GetAll(HttpRequestMessage request)
        {

            IEnumerable<Error> listError = null;
            var toTal = 0;
            try
            {
                listError = ErrorService.GetAll().OrderByDescending(x => x.CreatedDate);
                toTal = listError.ToList().Count;
                if (toTal > 0)
                {
                    Message = "Danh sách error";
                }
                else
                {
                    throw new DbEntityValidationException("Không tồn tại Error nào");
                }
            }
            catch (DbEntityValidationException ex)
            {
                LogException(ex);
            }
            return GetResponseMessage(IsSuccess, Message, toTal, listError);
        }
        #endregion
    }
}

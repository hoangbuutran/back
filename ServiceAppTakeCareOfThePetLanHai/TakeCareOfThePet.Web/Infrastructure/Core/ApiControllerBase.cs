using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using TakeCareOfThePet.Model.Models;
using TakeCareOfThePet.Service;

namespace TakeCareOfThePet.Web.Infrastructure.Core
{
    public class ApiControllerBase : ApiController
    {
        public bool IsSuccess = true;
        public string Message = null;
        public int ToTal = 0;
        public IErrorService ErrorService;
        public ApiControllerBase(IErrorService errorService)
        {
            ErrorService = errorService;
        }

        protected HttpResponseMessage CreateHttpResponse(HttpRequestMessage requestMessage, Func<HttpResponseMessage> function)
        {
            HttpResponseMessage response;
            try
            {
                response = function.Invoke();
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var eve in ex.EntityValidationErrors)
                {
                    Trace.WriteLine("Entity of type \"{eve.Entry.Entity.GetType().Name}\" in state \"{eve.Entry.State}\" has the following validation error.");
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Trace.WriteLine("- Property: \"{ve.PropertyName}\", Error: \"{ve.ErrorMessage}\"");
                    }
                }
                LogError(ex);
                response = requestMessage.CreateResponse(HttpStatusCode.BadRequest, ex.InnerException.Message);
            }
            catch (DbUpdateException dbEx)
            {
                LogError(dbEx);
                response = requestMessage.CreateResponse(HttpStatusCode.BadRequest, dbEx.InnerException.Message);
            }
            catch (Exception ex)
            {
                LogError(ex);
                response = requestMessage.CreateResponse(HttpStatusCode.BadRequest, ex.Message);
            }
            return response;
        }

        protected HttpResponseMessage GetResponseMessage(bool isSuccess, string message, int toTal, object data)
        {
            var response = Request.CreateResponse(
                HttpStatusCode.OK,
                new
                {
                    data,
                    message,
                    isSuccess,
                    toTal
                });

            return response;
        }

        private void LogError(Exception ex)
        {
            try
            {
                var error = new Error
                {
                    CreatedDate = DateTime.Now,
                    Message = ex.Message,
                    StackTrace = ex.StackTrace
                };
                ErrorService.Create(error);
                ErrorService.Save();
            }
            catch (Exception exx)
            {
                Console.Write(exx);
            }
        }
        public string LogException(DbEntityValidationException ex)
        {
            IsSuccess = false;
            foreach (var eve in ex.EntityValidationErrors)
            {
                Trace.WriteLine("Entity of type \"{eve.Entry.Entity.GetType().Name}\" in state \"{eve.Entry.State}\" has the following validation error.");
                foreach (var ve in eve.ValidationErrors)
                {
                    Trace.WriteLine("- Property: \"{ve.PropertyName}\", Error: \"{ve.ErrorMessage}\"");
                }
            }
            LogError(ex);
            Message = ex.InnerException != null ? ex.InnerException.Message : ex.Message;
            IsSuccess = false;
            return Message;
        }
    }
}
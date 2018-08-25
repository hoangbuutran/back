using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Common;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface ITaiKhoanRepository : IRepository<TaiKhoan>
    {
        void sendEmailViaWebApi(string toEmailAddress, string subject, string content);

    }
    public class TaiKhoanRepository : RepositoryBase<TaiKhoan>, ITaiKhoanRepository
    {
        public TaiKhoanRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }

        public void sendEmailViaWebApi(string toEmailAddress, string subject, string content)
        {
            new MailHelper().SendMail(toEmailAddress, subject, content);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface INguoiDungRepository : IRepository<NguoiDung>
    {
        void KhoaMo(int id);
        string ThayDoiChuoi(string text);
        NguoiDung GetByIdTaiKhoan(int id);
        //int FindByEmail(string email);
        IEnumerable<NguoiDung> GetAllCoEmail(string email);
    }
    public class NguoiDungRepository : RepositoryBase<NguoiDung>, INguoiDungRepository
    {
        public NguoiDungRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var nguoiDung = DbContext.NguoiDungs.Find(id);
            if (nguoiDung != null) nguoiDung.TrangThai = !nguoiDung.TrangThai;
        }
        public string ThayDoiChuoi(string text)
        {
            string[] pattern = new string[7];
            pattern[0] = "a|á|ả|à|ạ|ã|ă|ắ|ẳ|ằ|ặ|ẵ|â|ấ|ẩ|ầ|ậ|ẫ";
            pattern[1] = "o|ó|ỏ|ò|ọ|õ|ô|ố|ổ|ồ|ộ|ỗ|ơ|ớ|ở|ờ|ợ|ỡ";
            pattern[2] = "e|é|è|ẻ|ẹ|ẽ|ê|ế|ề|ể|ệ|ễ";
            pattern[3] = "u|ú|ù|ủ|ụ|ũ|ư|ứ|ừ|ử|ự|ữ";
            pattern[4] = "i|í|ì|ỉ|ị|ĩ";
            pattern[5] = "y|ý|ỳ|ỷ|ỵ|ỹ";
            pattern[6] = "d|đ";
            for (int i = 0; i < pattern.Length; i++)
            {
                char replaceChar = pattern[i][0];
                MatchCollection matchs = Regex.Matches(text, pattern[i]);
                foreach (Match m in matchs)
                {
                    text = text.Replace(m.Value[0], replaceChar);
                }
            }
            return text;
        }


        public NguoiDung GetByIdTaiKhoan(int id)
        {
            return DbContext.NguoiDungs.SingleOrDefault(x => x.IdTaiKhoan == id);
        }


        //public int FindByEmail(string email)
        //{
        //    return DbContext.NguoiDungs.Where(x => x.Email == email).SingleOrDefault();
        //}


        public IEnumerable<NguoiDung> GetAllCoEmail(string email)
        {
            return DbContext.NguoiDungs.Where(x => x.Email != null && x.Email == email);
        }
    }
}

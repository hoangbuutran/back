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
    public interface ICoSoThuYRepository : IRepository<CoSoThuY>
    {
        void KhoaMo(int id);
        IEnumerable<CoSoThuY> SearchWithKey(string keySearch);
        string ThayDoiChuoi(string text);
        IEnumerable<CoSoThuY> GetAllCoEmail(string email);
        CoSoThuY GetByIdTaiKhoan(int id);
    }
    public class CoSoThuYRepository : RepositoryBase<CoSoThuY>, ICoSoThuYRepository
    {
        public CoSoThuYRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var coSoYTe = DbContext.CoSoThuYs.Find(id);
            if (coSoYTe != null) coSoYTe.TrangThai = !coSoYTe.TrangThai;
        }


        public IEnumerable<CoSoThuY> SearchWithKey(string keySearch)
        {
            return DbContext.CoSoThuYs.Where(x => x.TenCoSoThuY.Contains(keySearch) ||
                                                  x.DiaDiem.Contains(keySearch));
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


        public CoSoThuY GetByIdTaiKhoan(int id)
        {
            return DbContext.CoSoThuYs.SingleOrDefault(x => x.IdTaiKhoan == id);
        }


        public IEnumerable<CoSoThuY> GetAllCoEmail(string email)
        {
            return DbContext.CoSoThuYs.Where(x => x.Email != null && x.Email == email);
        }
    }
}

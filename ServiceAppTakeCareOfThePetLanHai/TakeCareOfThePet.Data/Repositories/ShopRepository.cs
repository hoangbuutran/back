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
    public interface IShopRepository : IRepository<Shop>
    {
        void KhoaMo(int id);
        Shop Duyet(int id);
        Shop Xoa(int id);
        //IEnumerable<Shop> SearchWithKey(string keySearch);
        string ThayDoiChuoi(string text);
        IEnumerable<Shop> GetAllCoEmail(string email);
        Shop GetByIdTaiKhoan(int id);
    }
    public class ShopRepository : RepositoryBase<Shop>, IShopRepository
    {
        public ShopRepository(IDbFactory dbFactory)
            : base(dbFactory)
        {
        }
        public void KhoaMo(int id)
        {
            var shop = DbContext.Shops.Find(id);
            if (shop != null) shop.TrangThai = !shop.TrangThai;
        }


        //public IEnumerable<Shop> SearchWithKey(string keySearch)
        //{
        //    return DbContext.Shops.Where(x => x.TenShop.Contains(keySearch)).ToList();
        //}
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

        public IEnumerable<Shop> GetAllCoEmail(string email)
        {
            return DbContext.Shops.Where(x => x.Email != null && x.Email == email);
        }

        public Shop GetByIdTaiKhoan(int id)
        {
            return DbContext.Shops.SingleOrDefault(x => x.IdTaiKhoan == id);
        }


        public Shop Duyet(int id)
        {
            var shop = DbContext.Shops.Find(id);
            if (shop != null && shop.PheDuyet == false) shop.PheDuyet = true;
            return shop;
        }


        public Shop Xoa(int id)
        {
            var shop = DbContext.Shops.Find(id);
            int idTaiKhoan = (int)shop.IdTaiKhoan;
            var taiKhoan = DbContext.TaiKhoans.Find(id);
            DbContext.TaiKhoans.Remove(taiKhoan);
            DbContext.Shops.Remove(shop);
            return shop;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TakeCareOfThePet.Common.ModelChung;
using TakeCareOfThePet.Data.Infrastructure;
using TakeCareOfThePet.Data.Models;
using TakeCareOfThePet.Model.Models;

namespace TakeCareOfThePet.Data.Repositories
{
    public interface IThongKeBaoCaoRepository
    {
        IEnumerable<HoaDon> Hoa_Don_Theo_Thang(int soThang, int idShop);
        IEnumerable<ThongKeTheoSanPham> Lay_Ra_5_San_Pham_Max_Trong_Ngay(DateTime ngay, int idShop);
        IEnumerable<ThongKeTheoSanPham> Lay_Ra_10_San_Pham_Max_Trong_Thang(int thang, int idShop);
        IEnumerable<HoaDon> Hoa_Don_Trong_Khoang_Thang(int tuThang, int denThang, int idShop);
    }
    public class ThongKeBaoCaoRepository : IThongKeBaoCaoRepository
    {
        DbContext db = new DataBaseAppPetDbContext();
        public ThongKeBaoCaoRepository(){}

        public IEnumerable<ThongKeTheoSanPham> Lay_Ra_5_San_Pham_Max_Trong_Ngay(DateTime ngay, int idShop)
        {
            object[] parameter =
            {
                new SqlParameter("@Ngay", ngay),
                new SqlParameter("@IdShop", idShop)
            };
            return db.Database.SqlQuery<ThongKeTheoSanPham>("Lay_Ra_5_San_Pham_Max_Trong_Ngay @Ngay, @IdShop", parameter).ToList();
        }


        public IEnumerable<ThongKeTheoSanPham> Lay_Ra_10_San_Pham_Max_Trong_Thang(int thang, int idShop)
        {
            object[] parameter =
            {
                new SqlParameter("@Thang", thang),
                new SqlParameter("@IdShop", idShop)
            };
            return db.Database.SqlQuery<ThongKeTheoSanPham>("Lay_Ra_10_San_Pham_Max_Trong_Thang @Thang, @IdShop", parameter).ToList();
        }

        public IEnumerable<HoaDon> Hoa_Don_Theo_Thang(int soThang, int idShop)
        {
            object[] parameter =
            {
                new SqlParameter("@Thang", soThang),
                new SqlParameter("@IdShop", idShop)
            };
            return db.Database.SqlQuery<HoaDon>("Hoa_Don_Theo_Thang @Thang, @IdShop", parameter).ToList();
        }
        public IEnumerable<HoaDon> Hoa_Don_Trong_Khoang_Thang(int tuThang, int denThang, int idShop)
        {
            object[] parameter =
            {
                new SqlParameter("@TuThang", tuThang),
                new SqlParameter("@DenThang", denThang),
                new SqlParameter("@IdShop", idShop)
            };
            return db.Database.SqlQuery<HoaDon>("Hoa_Don_Trong_Khoang_Thang @TuThang, @DenThang, @IdShop", parameter).ToList();
        }
    }
}

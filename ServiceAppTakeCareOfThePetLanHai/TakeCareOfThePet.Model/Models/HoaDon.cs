using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TakeCareOfThePet.Model.Models
{
    [Table("HoaDon")]
    public partial class HoaDon
    {
        public HoaDon()
        {
            ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
        }

        [Key]
        public int IdHoaDon { get; set; }

        public int? IdNguoiDung { get; set; }

        public double? TongGia { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayLapHoaDon { get; set; }

        public bool? TrangThai { get; set; }

        public int? IdShop { get; set; }

        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }
    }
}

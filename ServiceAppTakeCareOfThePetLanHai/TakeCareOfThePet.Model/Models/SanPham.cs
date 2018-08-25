using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TakeCareOfThePet.Model.Models
{
    [Table("SanPham")]
    public partial class SanPham
    {
        public SanPham()
        {
            ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
            HinhAnhSanPhams = new HashSet<HinhAnhSanPham>();
        }

        [Key]
        public int IdSanPham { get; set; }

        [StringLength(900)]
        public string TenSanPham { get; set; }

        public int? IdLoaiSanPham { get; set; }

        public int? IdShop { get; set; }

        public int? SoLuong { get; set; }

        public double? Gia { get; set; }

        [Column(TypeName = "ntext")]
        public string DacDiem { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayNhap { get; set; }

        public bool? TrangThai { get; set; }

        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }

        public virtual ICollection<HinhAnhSanPham> HinhAnhSanPhams { get; set; }

        public virtual LoaiSanPham LoaiSanPham { get; set; }

        public virtual Shop Shop { get; set; }
    }
}

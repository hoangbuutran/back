using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TakeCareOfThePet.Model.Models
{
    [Table("Shop")]
    public partial class Shop
    {
        public Shop()
        {
            SanPhams = new HashSet<SanPham>();
        }

        [Key]
        public int IdShop { get; set; }

        [StringLength(50)]
        public string TenShop { get; set; }

        [Column(TypeName = "ntext")]
        public string DiaChi { get; set; }

        [StringLength(10)]
        public string SDT { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        public bool? DongYChinhSach { get; set; }

        public bool? PheDuyet { get; set; }

        public bool? TrangThai { get; set; }

        public int? DoTinCay { get; set; }

        public int? IdTaiKhoan { get; set; }

        public virtual ICollection<SanPham> SanPhams { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}

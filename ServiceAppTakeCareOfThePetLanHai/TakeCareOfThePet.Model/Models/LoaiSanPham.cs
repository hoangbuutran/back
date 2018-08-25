using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TakeCareOfThePet.Model.Models
{
    [Table("LoaiSanPham")]
    public partial class LoaiSanPham
    {
        public LoaiSanPham()
        {
            SanPhams = new HashSet<SanPham>();
        }

        [Key]
        public int IdLoaiSanPham { get; set; }

        [StringLength(200)]
        public string TenLoaiSanPham { get; set; }

        public bool? TrangThai { get; set; }

        public int? IdShop { get; set; }

        public virtual ICollection<SanPham> SanPhams { get; set; }
    }
}

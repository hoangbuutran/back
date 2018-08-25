using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TakeCareOfThePet.Model.Models
{
    [Table("ChiTietHoaDon")]
    public partial class ChiTietHoaDon
    {
        [Key]
        public int IdCTHoaDon { get; set; }

        public int? IdHoaDon { get; set; }

        public int? IdSanPham { get; set; }

        public double? Gia { get; set; }

        public int? SoLuong { get; set; }

        public virtual HoaDon HoaDon { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}

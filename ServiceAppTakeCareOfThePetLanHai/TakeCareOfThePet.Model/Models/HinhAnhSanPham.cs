using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TakeCareOfThePet.Model.Models
{
    [Table("HinhAnhSanPham")]
    public partial class HinhAnhSanPham
    {
        [Key]
        public int IdHinhAnh { get; set; }

        [StringLength(600)]
        public string LinkHinhAnh { get; set; }

        public int? IdSanPham { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}

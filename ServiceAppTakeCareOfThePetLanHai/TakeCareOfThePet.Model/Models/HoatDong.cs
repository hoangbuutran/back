using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TakeCareOfThePet.Model.Models
{

    [Table("HoatDong")]
    public partial class HoatDong
    {
        [Key]
        public int IdHoatDong { get; set; }

        [StringLength(700)]
        public string TenHoatDong { get; set; }

        [StringLength(500)]
        public string ImageShow { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayThang { get; set; }

        [Column(TypeName = "ntext")]
        public string MoTa { get; set; }

        [Column(TypeName = "ntext")]
        public string NoiDung { get; set; }

        public int? IdCoSoThuY { get; set; }

        public bool? TinhTrang { get; set; }

        public virtual CoSoThuY CoSoThuY { get; set; }
    }
}

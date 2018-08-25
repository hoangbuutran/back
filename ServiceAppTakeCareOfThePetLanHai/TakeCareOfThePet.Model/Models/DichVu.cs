using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TakeCareOfThePet.Model.Models
{

    [Table("DichVu")]
    public partial class DichVu
    {
        [Key]
        public int IdDichVu { get; set; }

        [StringLength(700)]
        public string TenDichVu { get; set; }

        [Column(TypeName = "ntext")]
        public string MoTaDichVu { get; set; }

        [Column(TypeName = "ntext")]
        public string NoiDung { get; set; }

        public int? IdCoSoThuY { get; set; }

        public bool? TinhTrang { get; set; }

        public virtual CoSoThuY CoSoThuY { get; set; }
    }
}

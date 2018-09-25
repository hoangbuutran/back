using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TakeCareOfThePet.Model.Models
{

    [Table("PhieuHenKham")]
    public partial class PhieuHenKham
    {
        [Key]
        public int IdLichHenKham { get; set; }

        public int? IdNguoiDung { get; set; }

        public int? IdCoSoThuY { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayHenKham { get; set; }

        public TimeSpan? GioHenKham { get; set; }

        [Column(TypeName = "ntext")]
        public string LyDoHenKham { get; set; }

        public int? IdDichVu { get; set; }

        public bool? TinhTrang { get; set; }

        public virtual DichVu DichVu { get; set; }

        public virtual CoSoThuY CoSoThuY { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }
    }
}

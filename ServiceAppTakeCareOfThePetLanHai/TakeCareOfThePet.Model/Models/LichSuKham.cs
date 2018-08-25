using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TakeCareOfThePet.Model.Models
{

    [Table("LichSuKham")]
    public partial class LichSuKham
    {
        [Key]
        public int IdLichSuKham { get; set; }

        public int? IdThuCung { get; set; }

        [Column(TypeName = "ntext")]
        public string TinhTrangBenh { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayThang { get; set; }

        [Column(TypeName = "ntext")]
        public string LoiNhan { get; set; }

        public virtual ThuCung ThuCung { get; set; }
    }
}

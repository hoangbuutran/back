using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TakeCareOfThePet.Model.Models
{

    [Table("GioiThieu")]
    public partial class GioiThieu
    {
        [Key]
        public int IdGioiThieu { get; set; }

        [Column(TypeName = "ntext")]
        public string NoiDung { get; set; }

        public int? IdCoSoThuY { get; set; }

        public virtual CoSoThuY CoSoThuY { get; set; }
    }
}

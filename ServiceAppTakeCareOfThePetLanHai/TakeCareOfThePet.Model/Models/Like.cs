using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TakeCareOfThePet.Model.Models
{

    [Table("Like")]
    public partial class Like
    {
        [Key]
        public int IdLike { get; set; }

        public int? IdNguoiDung { get; set; }

        public int? IdBaiViet { get; set; }

        public bool? TinhTrang { get; set; }

        public virtual BaiViet BaiViet { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }
    }
}

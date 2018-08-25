namespace TakeCareOfThePet.Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BinhLuan")]
    public partial class BinhLuan
    {
        [Key]
        public int IdBinhLuan { get; set; }

        public string NoiDung { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayBinhLuan { get; set; }

        public bool? TrangThai { get; set; }

        public int? SoLike { get; set; }

        public int? IdBaiViet { get; set; }

        public virtual BaiViet BaiViet { get; set; }

        public int? IdNguoiDung { get; set; }
        public virtual NguoiDung NguoiDung { get; set; }
    }
}

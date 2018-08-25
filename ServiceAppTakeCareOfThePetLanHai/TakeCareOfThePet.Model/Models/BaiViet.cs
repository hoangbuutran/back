namespace TakeCareOfThePet.Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BaiViet")]
    public partial class BaiViet
    {
        public BaiViet()
        {
            BinhLuans = new HashSet<BinhLuan>();
        }

        [Key]
        public int IdBaiViet { get; set; }

        [Column(TypeName = "ntext")]
        public string TieuDe { get; set; }

        [Column(TypeName = "ntext")]
        public string NoiDung { get; set; }

        [StringLength(500)]
        public string HinhAnh { get; set; }

        public int? IdChuyenMuc { get; set; }

        public int? IdNguoiDung { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayDang { get; set; }

        public int? SoLike { get; set; }

        public int? SoCmt { get; set; }

        public bool? TrangThai { get; set; }

        public virtual ChuyenMuc ChuyenMuc { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }

        public virtual ICollection<BinhLuan> BinhLuans { get; set; }
    }
}

namespace TakeCareOfThePet.Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CoSoThuY")]
    public partial class CoSoThuY
    {
        public CoSoThuY()
        {
            NguoiDungs = new HashSet<NguoiDung>();
        }

        [Key]
        public int IdCoSoThuY { get; set; }

        [StringLength(100)]
        public string TenCoSoThuY { get; set; }

        [Column(TypeName = "ntext")]
        public string DiaDiem { get; set; }

        [StringLength(11)]
        public string SDT { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        public bool? TrangThai { get; set; }

        public int? IdTaiKhoan { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }

        public virtual ICollection<NguoiDung> NguoiDungs { get; set; }
    }
}

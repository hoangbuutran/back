namespace TakeCareOfThePet.Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        public TaiKhoan()
        {
            CoSoThuYs = new HashSet<CoSoThuY>();
            NguoiDungs = new HashSet<NguoiDung>();
            Shops = new HashSet<Shop>();
        }

        [Key]
        public int IdTaiKhoan { get; set; }

        [StringLength(100)]
        public string UserName { get; set; }

        [StringLength(100)]
        public string Pass { get; set; }

        public int? IdQuyen { get; set; }

        public bool? TrangThai { get; set; }

        public virtual ICollection<CoSoThuY> CoSoThuYs { get; set; }

        public virtual ICollection<NguoiDung> NguoiDungs { get; set; }

        public virtual Quyen Quyen { get; set; }

        public virtual ICollection<Shop> Shops { get; set; }
    }
}

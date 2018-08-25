namespace TakeCareOfThePet.Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThuCung")]
    public partial class ThuCung
    {
        public ThuCung()
        {
            CanNangs = new HashSet<CanNang>();
            TinhTrangs = new HashSet<TinhTrang>();
        }

        [Key]
        public int IdThuCung { get; set; }

        [StringLength(100)]
        public string TenThuongGoi { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayNuoi { get; set; }

        public int? IdGiongThuCung { get; set; }

        public int? IdNguoiDung { get; set; }

        public bool? TrangThai { get; set; }

        public virtual ICollection<CanNang> CanNangs { get; set; }

        public virtual GiongThuCung GiongThuCung { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }

        public virtual ICollection<TinhTrang> TinhTrangs { get; set; }
    }
}

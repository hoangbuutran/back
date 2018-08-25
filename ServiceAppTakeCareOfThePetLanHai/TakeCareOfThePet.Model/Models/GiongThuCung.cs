namespace TakeCareOfThePet.Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("GiongThuCung")]
    public partial class GiongThuCung
    {
        public GiongThuCung()
        {
            ThuCungs = new HashSet<ThuCung>();
        }

        [Key]
        public int IdGiongThuCung { get; set; }

        [StringLength(100)]
        public string TenGiongThuCung { get; set; }

        [Column(TypeName = "ntext")]
        public string GioiThieu { get; set; }

        [StringLength(100)]
        public string HinhAnh { get; set; }

        [Column(TypeName = "ntext")]
        public string DacDiem { get; set; }

        [Column(TypeName = "ntext")]
        public string TinhCach { get; set; }

        [Column(TypeName = "ntext")]
        public string CachChamSoc { get; set; }

        [Column(TypeName = "ntext")]
        public string LuuYSucKhoe { get; set; }

        [Column(TypeName = "ntext")]
        public string LichSu { get; set; }

        public bool? TrangThai { get; set; }

        public virtual ICollection<ThuCung> ThuCungs { get; set; }
    }
}

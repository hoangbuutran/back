namespace TakeCareOfThePet.Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TinhTrang")]
    public partial class TinhTrang
    {
        [Key]
        public int IdTinhTrang { get; set; }

        [Column("TinhTrang", TypeName = "ntext")]
        public string NoiDungTinhTrang { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayCapNhat { get; set; }

        [Column(TypeName = "ntext")]
        public string HinhAnh { get; set; }

        [Column(TypeName = "ntext")]
        public string LinkVideo { get; set; }
        public bool? TrangThai { get; set; }

        public int? IdThuCung { get; set; }

        public virtual ThuCung ThuCung { get; set; }
    }
}

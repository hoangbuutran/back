namespace TakeCareOfThePet.Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CanNang")]
    public partial class CanNang
    {
        [Key]
        public int IdCanNang { get; set; }

        [Column("CanNang")]
        public double? CanNang1 { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayCapNhat { get; set; }

        public int? IdThuCung { get; set; }

        public bool? TrangThai { get; set; }

        public virtual ThuCung ThuCung { get; set; }
    }
}

namespace TakeCareOfThePet.Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Quyen")]
    public partial class Quyen
    {
        public Quyen()
        {
            TaiKhoans = new HashSet<TaiKhoan>();
        }

        [Key]
        public int IdQuyen { get; set; }

        [StringLength(100)]
        public string TenQuyen { get; set; }
        public bool? TrangThai { get; set; }
        public virtual ICollection<TaiKhoan> TaiKhoans { get; set; }
    }
}

namespace TakeCareOfThePet.Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChuyenMuc")]
    public partial class ChuyenMuc
    {
        public ChuyenMuc()
        {
            //BaiViets = new HashSet<BaiViet>();
        }

        [Key]
        public int IdChuyenMuc { get; set; }

        [StringLength(100)]
        public string TenChuyenMuc { get; set; }

        public bool? TrangThai { get; set; }

        //public virtual ICollection<BaiViet> BaiViets { get; set; }
    }
}

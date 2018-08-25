namespace TakeCareOfThePet.Model.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NguoiDung")]
    public partial class NguoiDung
    {
        public NguoiDung()
        {
            //BaiViets = new HashSet<BaiViet>();
            HoaDons = new HashSet<HoaDon>();
            ThuCungs = new HashSet<ThuCung>();
        }

        [Key]
        public int IdNguoiDung { get; set; }

        [StringLength(100)]
        public string TenNguoiDung { get; set; }

        [Column(TypeName = "ntext")]
        public string DiaChi { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgaySinh { get; set; }

        [StringLength(11)]
        public string SDT { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        public bool? TrangThai { get; set; }

        [StringLength(100)]
        public string HinhAnh { get; set; }

        public int? IdCoSoThuY { get; set; }

        public int? IdTaiKhoan { get; set; }

        //public virtual ICollection<BaiViet> BaiViets { get; set; }

        public virtual CoSoThuY CoSoThuY { get; set; }

        public virtual ICollection<HoaDon> HoaDons { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }

        public virtual ICollection<ThuCung> ThuCungs { get; set; }
    }
}

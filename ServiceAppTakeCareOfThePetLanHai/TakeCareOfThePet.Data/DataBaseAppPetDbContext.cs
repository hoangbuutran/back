namespace TakeCareOfThePet.Data.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using TakeCareOfThePet.Model.Models;

    public partial class DataBaseAppPetDbContext : DbContext
    {
        public DataBaseAppPetDbContext()
            : base("name=DataBaseAppPetDbContext")
        {
            this.Configuration.LazyLoadingEnabled = false;
            Configuration.ProxyCreationEnabled = false;
        }

        public virtual DbSet<BaiViet> BaiViets { get; set; }
        public virtual DbSet<BinhLuan> BinhLuans { get; set; }
        public virtual DbSet<CanNang> CanNangs { get; set; }
        public virtual DbSet<ChiTietHoaDon> ChiTietHoaDons { get; set; }
        public virtual DbSet<ChuyenMuc> ChuyenMucs { get; set; }
        public virtual DbSet<CoSoThuY> CoSoThuYs { get; set; }
        public virtual DbSet<GiongThuCung> GiongThuCungs { get; set; }
        public virtual DbSet<HinhAnhSanPham> HinhAnhSanPhams { get; set; }
        public virtual DbSet<HoaDon> HoaDons { get; set; }
        public virtual DbSet<LoaiSanPham> LoaiSanPhams { get; set; }
        public virtual DbSet<NguoiDung> NguoiDungs { get; set; }
        public virtual DbSet<Quyen> Quyens { get; set; }
        public virtual DbSet<Error> Errors { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<Shop> Shops { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
        public virtual DbSet<ThuCung> ThuCungs { get; set; }
        public virtual DbSet<TinhTrang> TinhTrangs { get; set; }
        public virtual DbSet<DichVu> DichVus { get; set; }
        public virtual DbSet<GioiThieu> GioiThieus { get; set; }
        public virtual DbSet<HoatDong> HoatDongs { get; set; }
        public virtual DbSet<LichSuKham> LichSuKhams { get; set; }
        public virtual DbSet<PhieuHenKham> PhieuHenKhams { get; set; }
        public virtual DbSet<SucKhoeThuCung> SucKhoeThuCungs { get; set; }
        public virtual DbSet<Like> Likes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.ChiTietHoaDons)
                .WithOptional(e => e.SanPham)
                .HasForeignKey(e => e.IdSanPham);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.HinhAnhSanPhams)
                .WithOptional(e => e.SanPham)
                .HasForeignKey(e => e.IdSanPham);

            modelBuilder.Entity<Shop>()
                .Property(e => e.SDT)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}

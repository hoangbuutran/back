USE [PetLikeNangCao]
GO
/****** Object:  User [takecareofpet_SQLLogin_1]    Script Date: 9/12/2018 2:08:53 PM ******/
CREATE USER [takecareofpet_SQLLogin_1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [tranhoangbuu_SQLLogin_1]    Script Date: 9/12/2018 2:08:53 PM ******/
CREATE USER [tranhoangbuu_SQLLogin_1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [takecareofpet_SQLLogin_1]
GO
ALTER ROLE [db_owner] ADD MEMBER [tranhoangbuu_SQLLogin_1]
GO
/****** Object:  Schema [takecareofpet_SQLLogin_1]    Script Date: 9/12/2018 2:08:54 PM ******/
CREATE SCHEMA [takecareofpet_SQLLogin_1]
GO
/****** Object:  Schema [tranhoangbuu_SQLLogin_1]    Script Date: 9/12/2018 2:08:54 PM ******/
CREATE SCHEMA [tranhoangbuu_SQLLogin_1]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 9/12/2018 2:08:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[IdBaiViet] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [ntext] NULL,
	[NoiDung] [ntext] NULL,
	[HinhAnh] [nvarchar](500) NULL,
	[IdChuyenMuc] [int] NULL,
	[IdNguoiDung] [int] NULL,
	[NgayDang] [date] NULL,
	[SoLike] [int] NULL,
	[SoCmt] [int] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_dbo.BaiViet] PRIMARY KEY CLUSTERED 
(
	[IdBaiViet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[IdBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[IdNguoiDung] [int] NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayBinhLuan] [date] NULL,
	[TrangThai] [bit] NULL,
	[SoLike] [int] NULL,
	[IdBaiViet] [int] NULL,
 CONSTRAINT [PK_dbo.BinhLuan] PRIMARY KEY CLUSTERED 
(
	[IdBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CanNang]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CanNang](
	[IdCanNang] [int] IDENTITY(1,1) NOT NULL,
	[CanNang] [float] NULL,
	[NgayCapNhat] [date] NOT NULL,
	[IdThuCung] [int] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_CanNang] PRIMARY KEY CLUSTERED 
(
	[IdCanNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[IdCTHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[IdHoaDon] [int] NULL,
	[IdSanPham] [int] NULL,
	[Gia] [float] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[IdCTHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuyenMuc]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenMuc](
	[IdChuyenMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenChuyenMuc] [nvarchar](100) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_dbo.ChuyenMuc] PRIMARY KEY CLUSTERED 
(
	[IdChuyenMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CoSoThuY]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoSoThuY](
	[IdCoSoThuY] [int] IDENTITY(1,1) NOT NULL,
	[TenCoSoThuY] [nvarchar](100) NULL,
	[DiaDiem] [ntext] NULL,
	[SDT] [nvarchar](11) NULL,
	[Email] [nvarchar](100) NULL,
	[TrangThai] [bit] NULL,
	[IdTaiKhoan] [int] NULL,
 CONSTRAINT [PK_dbo.CoSoThuY] PRIMARY KEY CLUSTERED 
(
	[IdCoSoThuY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[IdDichVu] [int] IDENTITY(1,1) NOT NULL,
	[MoTaDichVu] [ntext] NULL,
	[NoiDung] [ntext] NULL,
	[IdCoSoThuY] [int] NULL,
	[TinhTrang] [bit] NULL,
	[TenDichVu] [nvarchar](700) NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[IdDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Error]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Error](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [ntext] NULL,
	[StackTrace] [ntext] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Error] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GioiThieu]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioiThieu](
	[IdGioiThieu] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [ntext] NULL,
	[IdCoSoThuY] [int] NULL,
 CONSTRAINT [PK_GioiThieu] PRIMARY KEY CLUSTERED 
(
	[IdGioiThieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiongThuCung]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiongThuCung](
	[IdGiongThuCung] [int] IDENTITY(1,1) NOT NULL,
	[TenGiongThuCung] [nvarchar](100) NULL,
	[GioiThieu] [ntext] NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[DacDiem] [ntext] NULL,
	[TinhCach] [ntext] NULL,
	[CachChamSoc] [ntext] NULL,
	[LuuYSucKhoe] [ntext] NULL,
	[LichSu] [ntext] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_dbo.GiongThuCung] PRIMARY KEY CLUSTERED 
(
	[IdGiongThuCung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HinhAnhSanPham]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnhSanPham](
	[IdHinhAnh] [int] IDENTITY(1,1) NOT NULL,
	[LinkHinhAnh] [nvarchar](600) NULL,
	[IdSanPham] [int] NULL,
 CONSTRAINT [PK_HinhAnhSanPham] PRIMARY KEY CLUSTERED 
(
	[IdHinhAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[IdHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[IdNguoiDung] [int] NULL,
	[TongGia] [float] NULL,
	[NgayLapHoaDon] [date] NULL,
	[TrangThai] [bit] NULL,
	[IdShop] [int] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[IdHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoatDong]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoatDong](
	[IdHoatDong] [int] IDENTITY(1,1) NOT NULL,
	[TenHoatDong] [nvarchar](700) NULL,
	[NgayThang] [date] NULL,
	[MoTa] [ntext] NULL,
	[NoiDung] [ntext] NULL,
	[IdCoSoThuY] [int] NULL,
	[TinhTrang] [bit] NULL,
	[ImageShow] [nvarchar](500) NULL,
 CONSTRAINT [PK_HoatDong] PRIMARY KEY CLUSTERED 
(
	[IdHoatDong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LichSuKham]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuKham](
	[IdLichSuKham] [int] IDENTITY(1,1) NOT NULL,
	[IdThuCung] [int] NULL,
	[TinhTrangBenh] [ntext] NULL,
	[NgayThang] [date] NULL,
	[LoiNhan] [ntext] NULL,
 CONSTRAINT [PK_LichSuKham] PRIMARY KEY CLUSTERED 
(
	[IdLichSuKham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Like]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Like](
	[IdLike] [int] IDENTITY(1,1) NOT NULL,
	[IdNguoiDung] [int] NULL,
	[IdBaiViet] [int] NULL,
	[TinhTrang] [bit] NULL,
 CONSTRAINT [PK_Like] PRIMARY KEY CLUSTERED 
(
	[IdLike] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[IdLoaiSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSanPham] [nvarchar](200) NULL,
	[TrangThai] [bit] NULL,
	[IdShop] [int] NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[IdLoaiSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[IdNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiDung] [nvarchar](100) NULL,
	[DiaChi] [ntext] NULL,
	[NgaySinh] [date] NULL,
	[SDT] [nvarchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[IdCoSoThuY] [int] NULL,
	[IdTaiKhoan] [int] NULL,
 CONSTRAINT [PK_dbo.NguoiDung] PRIMARY KEY CLUSTERED 
(
	[IdNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuHenKham]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuHenKham](
	[IdLichHenKham] [int] IDENTITY(1,1) NOT NULL,
	[IdNguoiDung] [int] NULL,
	[IdCoSoThuY] [int] NULL,
	[NgayHenKham] [date] NULL,
	[GioHenKham] [time](7) NULL,
	[LyDoHenKham] [ntext] NULL,
	[IdDichVu] [int] NULL,
	[TinhTrang] [bit] NULL,
 CONSTRAINT [PK_LichHenKham] PRIMARY KEY CLUSTERED 
(
	[IdLichHenKham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[IdQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](100) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_dbo.Quyen] PRIMARY KEY CLUSTERED 
(
	[IdQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[IdSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](900) NULL,
	[IdLoaiSanPham] [int] NULL,
	[IdShop] [int] NULL,
	[Gia] [float] NULL,
	[DacDiem] [ntext] NULL,
	[NgayNhap] [date] NULL,
	[TrangThai] [bit] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[IdSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shop]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shop](
	[IdShop] [int] IDENTITY(1,1) NOT NULL,
	[TenShop] [nvarchar](50) NULL,
	[DiaChi] [ntext] NULL,
	[SDT] [char](10) NULL,
	[Email] [nvarchar](50) NULL,
	[DongYChinhSach] [bit] NULL,
	[PheDuyet] [bit] NULL,
	[TrangThai] [bit] NULL,
	[DoTinCay] [int] NULL,
	[IdTaiKhoan] [int] NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[IdShop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SucKhoeThuCung]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SucKhoeThuCung](
	[IdSKTC] [int] IDENTITY(1,1) NOT NULL,
	[TenSKTC] [nvarchar](500) NULL,
	[NgayThang] [date] NULL,
	[MoTa] [ntext] NULL,
	[NoiDung] [ntext] NULL,
	[IdCoSoThuY] [int] NULL,
	[TinhTrang] [bit] NULL,
	[ImageShow] [nvarchar](500) NULL,
 CONSTRAINT [PK_SucKhoeThuCung] PRIMARY KEY CLUSTERED 
(
	[IdSKTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[IdTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Pass] [nvarchar](100) NULL,
	[IdQuyen] [int] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_dbo.TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[IdTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuCung]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuCung](
	[IdThuCung] [int] IDENTITY(1,1) NOT NULL,
	[TenThuongGoi] [nvarchar](100) NULL,
	[NgayNuoi] [date] NULL,
	[IdGiongThuCung] [int] NULL,
	[IdNguoiDung] [int] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_dbo.ThuCung] PRIMARY KEY CLUSTERED 
(
	[IdThuCung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinhTrang]    Script Date: 9/12/2018 2:08:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrang](
	[IdTinhTrang] [int] IDENTITY(1,1) NOT NULL,
	[TinhTrang] [ntext] NULL,
	[NgayCapNhat] [date] NOT NULL,
	[HinhAnh] [ntext] NULL,
	[TrangThai] [bit] NULL,
	[IdThuCung] [int] NULL,
	[LinkVideo] [ntext] NULL,
 CONSTRAINT [PK_TinhTrang] PRIMARY KEY CLUSTERED 
(
	[IdTinhTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BaiViet] ON 

INSERT [dbo].[BaiViet] ([IdBaiViet], [TieuDe], [NoiDung], [HinhAnh], [IdChuyenMuc], [IdNguoiDung], [NgayDang], [SoLike], [SoCmt], [TrangThai]) VALUES (1, N'sample string 2', N'sample string 3', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9onY_FSSAs3fYC39yk1FGxW-lLTAT3HZHZcW61D-dOlYc2ip0w', 1, 4, CAST(N'2018-06-22' AS Date), 1, 7, 1)
INSERT [dbo].[BaiViet] ([IdBaiViet], [TieuDe], [NoiDung], [HinhAnh], [IdChuyenMuc], [IdNguoiDung], [NgayDang], [SoLike], [SoCmt], [TrangThai]) VALUES (2, N'sample string 2', N'sample string 3', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9onY_FSSAs3fYC39yk1FGxW-lLTAT3HZHZcW61D-dOlYc2ip0w', 1, 4, CAST(N'2018-07-02' AS Date), 2, 11, 1)
INSERT [dbo].[BaiViet] ([IdBaiViet], [TieuDe], [NoiDung], [HinhAnh], [IdChuyenMuc], [IdNguoiDung], [NgayDang], [SoLike], [SoCmt], [TrangThai]) VALUES (3, N'sample string 2', N'sample string 3', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9onY_FSSAs3fYC39yk1FGxW-lLTAT3HZHZcW61D-dOlYc2ip0w', 1, 4, CAST(N'2018-07-02' AS Date), 1, 10, 1)
INSERT [dbo].[BaiViet] ([IdBaiViet], [TieuDe], [NoiDung], [HinhAnh], [IdChuyenMuc], [IdNguoiDung], [NgayDang], [SoLike], [SoCmt], [TrangThai]) VALUES (1022, N'sample string 2', N'sample string 3', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9onY_FSSAs3fYC39yk1FGxW-lLTAT3HZHZcW61D-dOlYc2ip0w', 1, 13, CAST(N'2018-07-02' AS Date), 0, 6, 1)
INSERT [dbo].[BaiViet] ([IdBaiViet], [TieuDe], [NoiDung], [HinhAnh], [IdChuyenMuc], [IdNguoiDung], [NgayDang], [SoLike], [SoCmt], [TrangThai]) VALUES (1023, N'sample string 2', N'sample string 3', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9onY_FSSAs3fYC39yk1FGxW-lLTAT3HZHZcW61D-dOlYc2ip0w', 1, 13, CAST(N'2018-07-02' AS Date), 0, 6, 1)
INSERT [dbo].[BaiViet] ([IdBaiViet], [TieuDe], [NoiDung], [HinhAnh], [IdChuyenMuc], [IdNguoiDung], [NgayDang], [SoLike], [SoCmt], [TrangThai]) VALUES (1024, N'123', N'123', N'https://firebasestorage.googleapis.com/v0/b/takecareofpets-pad.appspot.com/o/uploads%2FAlaskan-klee-kai-3.jpg?alt=media&token=07f37749-f3f4-493e-80fa-4cda3189446b', 1, 4, CAST(N'2018-08-16' AS Date), 0, 0, 1)
INSERT [dbo].[BaiViet] ([IdBaiViet], [TieuDe], [NoiDung], [HinhAnh], [IdChuyenMuc], [IdNguoiDung], [NgayDang], [SoLike], [SoCmt], [TrangThai]) VALUES (1025, N'bài này hay lắm nè', N'ahihihihi cha cha cha chahaha ahah ah ah ah aha ah ah', N'https://firebasestorage.googleapis.com/v0/b/takecareofpets-pad.appspot.com/o/uploads%2Fgiong-cho-gsd1.jpg?alt=media&token=93ce3d84-2e22-46bc-8793-ef4eff047a5b', 5, 4, CAST(N'2018-08-17' AS Date), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[BaiViet] OFF
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1, 4, N'sample string 2', CAST(N'2018-07-02' AS Date), 1, 0, 2)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (2, 13, N'sample string 2', CAST(N'2018-07-02' AS Date), 1, 0, 2)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (3, 4, N'sample string 2', CAST(N'2018-07-02' AS Date), 1, 0, 2)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (4, 13, N'sample string 2', CAST(N'2018-07-02' AS Date), 1, 0, 2)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1002, 4, N'condàdasfasd cc', CAST(N'2018-07-02' AS Date), 1, 0, 2)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1003, 13, N'Một cộng một bằng hai', CAST(N'2018-07-02' AS Date), 1, 0, 2)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1004, 4, N'sample string 2', CAST(N'2018-07-02' AS Date), 1, 0, 3)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1005, 13, N'sample string 2', CAST(N'2018-07-02' AS Date), 1, 0, 3)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1006, 4, N'sample string 2', CAST(N'2018-07-02' AS Date), 1, 0, 3)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1007, 13, N'sample string 2', CAST(N'2018-07-02' AS Date), 1, 0, 3)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1008, 4, N'condàdasfasd cc', CAST(N'2018-07-02' AS Date), 1, 0, 3)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1009, 13, N'Một cộng một bằng hai', CAST(N'2018-07-02' AS Date), 1, 0, 3)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1022, 4, N'sample string 2', CAST(N'2018-07-02' AS Date), 1, 0, 1022)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1023, 4, N'condàdasfasd cc', CAST(N'2018-07-02' AS Date), 1, 0, 1022)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1024, 4, N'Một cộng một bằng hai', CAST(N'2018-07-02' AS Date), 1, 0, 1022)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1025, 4, N'123123213', CAST(N'2018-07-20' AS Date), 1, 0, 3)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1026, 4, N'123123213', CAST(N'2018-07-20' AS Date), 1, 0, 3)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1027, 4, N'123', CAST(N'2018-07-20' AS Date), 1, 0, 2)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1028, 4, N'123', CAST(N'2018-07-20' AS Date), 1, 0, 2)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1029, 4, N'123123123', CAST(N'2018-07-20' AS Date), 1, 0, 2)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1030, 4, N'1231ewr', CAST(N'2018-07-20' AS Date), 1, 0, 3)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1031, 4, N'ưerwerwer', CAST(N'2018-07-20' AS Date), 1, 0, 3)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1033, 4, N'888888', CAST(N'2018-07-20' AS Date), 1, 0, 2)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1034, 4, N'', CAST(N'2018-07-20' AS Date), 1, 0, 2)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (1035, 4, N'99999', CAST(N'2018-07-21' AS Date), 1, 0, 2)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (2035, 4, N'1231231231', CAST(N'2018-08-16' AS Date), 1, 0, 1)
INSERT [dbo].[BinhLuan] ([IdBinhLuan], [IdNguoiDung], [NoiDung], [NgayBinhLuan], [TrangThai], [SoLike], [IdBaiViet]) VALUES (2036, 4, N'chó đẹp đấy bạn gái', CAST(N'2018-08-17' AS Date), 1, 0, 1025)
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
SET IDENTITY_INSERT [dbo].[CanNang] ON 

INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (1, 12, CAST(N'1997-01-01' AS Date), 2, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (2, 13, CAST(N'1997-01-02' AS Date), 2, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (3, 13, CAST(N'1997-01-02' AS Date), 2, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (4, 13, CAST(N'1997-01-02' AS Date), 2, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (5, 13, CAST(N'1997-01-02' AS Date), 2, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (6, 13, CAST(N'1997-01-02' AS Date), 3, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (7, 13, CAST(N'1997-01-02' AS Date), 3, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (8, 13, CAST(N'1997-01-02' AS Date), 3, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (9, 13, CAST(N'1997-01-02' AS Date), 3, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (10, 13, CAST(N'1997-01-02' AS Date), 3, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (11, 13, CAST(N'1997-01-02' AS Date), 4, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (12, 13, CAST(N'1997-01-02' AS Date), 4, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (13, 13, CAST(N'1997-01-02' AS Date), 4, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (14, 13, CAST(N'1997-01-02' AS Date), 4, 1)
INSERT [dbo].[CanNang] ([IdCanNang], [CanNang], [NgayCapNhat], [IdThuCung], [TrangThai]) VALUES (15, 13, CAST(N'1997-01-02' AS Date), 4, 1)
SET IDENTITY_INSERT [dbo].[CanNang] OFF
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (7, 5, 4, 123123, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (8, 5, 1004, 123, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (9, 5, 2, 100000, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (10, 5, 5, 123, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (11, 5, 1009, 200000, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (12, 6, 4, 123123, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (13, 6, 1004, 123, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (14, 6, 5, 123, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (18, 8, 4, 123123, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (19, 8, 1004, 123, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (20, 8, 5, 123, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (25, 11, 4, 123123, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (26, 12, 4, 123123, 4)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (2028, 2013, 2, 100000, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (2029, 2013, 5, 123, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (2030, 2013, 1004, 123, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (2031, 2014, 1, 100000, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (2032, 2014, 2, 100000, 1)
INSERT [dbo].[ChiTietHoaDon] ([IdCTHoaDon], [IdHoaDon], [IdSanPham], [Gia], [SoLuong]) VALUES (2035, 2016, 1004, 123, 1)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
SET IDENTITY_INSERT [dbo].[ChuyenMuc] ON 

INSERT [dbo].[ChuyenMuc] ([IdChuyenMuc], [TenChuyenMuc], [TrangThai]) VALUES (1, N'Chia sẻ', 1)
INSERT [dbo].[ChuyenMuc] ([IdChuyenMuc], [TenChuyenMuc], [TrangThai]) VALUES (5, N'Khoe của', 1)
INSERT [dbo].[ChuyenMuc] ([IdChuyenMuc], [TenChuyenMuc], [TrangThai]) VALUES (7, N'Bí quyết', 1)
INSERT [dbo].[ChuyenMuc] ([IdChuyenMuc], [TenChuyenMuc], [TrangThai]) VALUES (8, N'Đánh ghen', 1)
INSERT [dbo].[ChuyenMuc] ([IdChuyenMuc], [TenChuyenMuc], [TrangThai]) VALUES (9, N'Lột đồ', 1)
SET IDENTITY_INSERT [dbo].[ChuyenMuc] OFF
SET IDENTITY_INSERT [dbo].[CoSoThuY] ON 

INSERT [dbo].[CoSoThuY] ([IdCoSoThuY], [TenCoSoThuY], [DiaDiem], [SDT], [Email], [TrangThai], [IdTaiKhoan]) VALUES (1, N'Ngô Thị Thanh', N'Quảng Nam Thăng bình bình trung ke xuyen', N'0869610406', N'cosothuy@gmail.com', 1, 4)
SET IDENTITY_INSERT [dbo].[CoSoThuY] OFF
SET IDENTITY_INSERT [dbo].[DichVu] ON 

INSERT [dbo].[DichVu] ([IdDichVu], [MoTaDichVu], [NoiDung], [IdCoSoThuY], [TinhTrang], [TenDichVu]) VALUES (1, N'PetCare có đội ngũ nhân viên giàu kinh nghiệm giúp chủ nuôi gửi thú cưng đi nước ngoài hay cùng đi du lịch.', N'<header style="box-sizing: border-box; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">
<h1 style="box-sizing: border-box; margin: 0px; padding: 0px 0px 18px; direction: ltr; outline: none; font-size: 40px; color: #333333;">Thủ tục xuất cảnh</h1>
</header>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box;">L&agrave; bệnh viện th&uacute; y đầu ti&ecirc;n trong cả nước thực hiện thủ tục xuất cảnh cho th&uacute; cưng từ khi th&agrave;nh lập, PetCare c&oacute; đội ngũ nh&acirc;n vi&ecirc;n gi&agrave;u kinh nghiệm gi&uacute;p chủ nu&ocirc;i gửi th&uacute; cưng đi nước ngo&agrave;i hay c&ugrave;ng đi du lịch. Nhằm đ&aacute;p ứng c&aacute;c thủ tục xuất nhập cảnh, PetCare cung cấp dịch vụ.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box;">&bull; &nbsp; &nbsp;Tư vấn thủ tục xuất cảnh.<br style="box-sizing: border-box;" /></span><span style="box-sizing: border-box;">&bull; &nbsp; &nbsp;Cấp giấy chứng nhận sức khỏe.<br style="box-sizing: border-box;" /></span><span style="box-sizing: border-box;">&bull; &nbsp; &nbsp;Hỗ trợ cấp giấy ph&eacute;p xuất cảnh.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box;">Để chuẩn bị cho chuyến đi, th&ocirc;ng thường th&uacute; cưng cần được ch&iacute;ch ngừa, gắn microchip v&agrave; l&agrave;m c&aacute;c x&eacute;t nghiệm cần thiết. C&aacute;c dịch vụ tr&ecirc;n c&oacute; thể thay đổi (mỗi năm) t&ugrave;y theo quy định của nước nhập cảnh. Để qu&aacute; tr&igrave;nh xuất cảnh được diễn ra thuận lợi, ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn n&ecirc;n chuẩn bị cho th&uacute; cưng c&agrave;ng sớm c&agrave;ng tốt v&agrave; &iacute;t nhất 6 th&aacute;ng trước khi khởi h&agrave;nh.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-1335 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/06/petcare_01-7-copy.jpg" sizes="(max-width: 500px) 100vw, 500px" srcset="http://petcare.vn/wp-content/uploads/2016/06/petcare_01-7-copy.jpg 500w, http://petcare.vn/wp-content/uploads/2016/06/petcare_01-7-copy-291x300.jpg 291w, http://petcare.vn/wp-content/uploads/2016/06/petcare_01-7-copy-45x45.jpg 45w" alt="petcare_19" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">Để biết th&ecirc;m th&ocirc;ng tin chi tiết, xin vui l&ograve;ng li&ecirc;n hệ:</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">BỆNH VIỆN TH&Uacute; Y PETCARE VIỆT NAM</strong></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">PetCare 1: &nbsp;</strong>124A đường Xu&acirc;n Thủy, Thảo Điền, quận 2, tp.HCM.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Điện thoại:&nbsp;</strong><a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70;" href="tel:+842837442025">(028) 3744 2505</a>&nbsp;&ndash;&nbsp;<a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70;" href="tel:+842835234244">(028) 3523 4244</a></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Email:&nbsp;</strong><a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70;" href="mailto:info@petcare.vn">info@petcare.vn</a>&nbsp;&nbsp;<strong style="box-sizing: border-box;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Website: &nbsp;</strong><a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70;" href="http://petcare.vn/">www.petcare.vn</a></p>', 1, 1, N'Dịch vụ xuất cảnh chó mèo')
INSERT [dbo].[DichVu] ([IdDichVu], [MoTaDichVu], [NoiDung], [IdCoSoThuY], [TinhTrang], [TenDichVu]) VALUES (3, N'Petcare áp dụng quy trình lưu giữ thú cưng khoa học, đảm bảo cho thú cưng nhà bạn sống trong môi trường an toàn và sạch sẽ.', N'<header style="box-sizing: border-box; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">
<h1 style="box-sizing: border-box; margin: 0px; padding: 0px 0px 18px; direction: ltr; outline: none; font-size: 40px; color: #333333;">Lưu chuồng</h1>
</header>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">Nhằm hỗ trợ chủ nu&ocirc;i trong việc chăm s&oacute;c th&uacute; cưng, Bệnh viện th&uacute; y PetCare cung cấp g&oacute;i dịch vụ tr&ocirc;ng giữ ch&oacute; m&egrave;o cố định hằng tuần, qua đ&ecirc;m, hoặc nửa ng&agrave;y. Petcare &aacute;p dụng quy tr&igrave;nh lưu giữ th&uacute; cưng khoa học, đảm bảo cho th&uacute; cưng nh&agrave; bạn sống trong m&ocirc;i trường an to&agrave;n v&agrave; sạch sẽ.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">&bull;</strong>&nbsp;&nbsp; &nbsp;Petcare c&oacute; một kh&ocirc;ng gian rộng với mục đ&iacute;ch phục vụ cho việc lưu giữ ch&oacute;, m&egrave;o,Khu vực lưu tr&uacute; c&oacute; s&acirc;n cỏ, gi&uacute;p c&aacute;c bạn nhỏ thoải m&aacute;i vận động mỗi ng&agrave;y 2 lần, đảm bảo sức khoẻ v&agrave; ổn định tinh&nbsp;thần cho c&aacute;c bạn nhỏ.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">&bull;</strong>&nbsp;&nbsp; &nbsp;C&oacute; hệ thống h&uacute;t m&ugrave;i c&ocirc;ng nghiệp, tr&aacute;nh &ocirc; nhiễm do ch&iacute;nh th&uacute; cưng thải ra.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">&bull;</strong>&nbsp;&nbsp; &nbsp;C&oacute; hệ thống điều h&ograve;a nhiệt khi cần thiết v&agrave;o những ng&agrave;y nắng n&oacute;ng theo chế độ y&ecirc;u cầu.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">&bull;</strong>&nbsp;&nbsp; &nbsp;Cung cấp thức ăn Royal Canin cho th&uacute; cưng v&agrave; cả thực phẩm chế biến theo nhu cầu.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">&bull;</strong>&nbsp;&nbsp; &nbsp;C&oacute; hệ thống camera theo d&otilde;i th&uacute; cưng gi&uacute;p c&aacute;c b&aacute;c sĩ kiểm so&aacute;t t&igrave;nh h&igrave;nh.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">&bull;</strong>&nbsp;&nbsp; &nbsp;C&oacute; B&aacute;c Sỹ Th&uacute; Y kiểm tra sức khoẻ h&agrave;ng ng&agrave;y.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">&bull;</strong>&nbsp;&nbsp; &nbsp;Giờ nhận v&agrave; đ&oacute;n th&uacute; cưng linh động.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">H&atilde;y y&ecirc;n t&acirc;m khi đ&atilde; gửi th&uacute; cưng cho ch&uacute;ng t&ocirc;i, ch&uacute;ng t&ocirc;i sẽ n&acirc;ng niu th&uacute; cưng của bạn như ch&uacute;ng đang được ở ch&iacute;nh nh&agrave; m&igrave;nh.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="alignnone size-full wp-image-6476" style="box-sizing: border-box; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/06/luuchuong.jpg" sizes="(max-width: 900px) 100vw, 900px" srcset="http://petcare.vn/wp-content/uploads/2016/06/luuchuong.jpg 900w, http://petcare.vn/wp-content/uploads/2016/06/luuchuong-300x169.jpg 300w, http://petcare.vn/wp-content/uploads/2016/06/luuchuong-768x432.jpg 768w" alt="" /></p>', 1, 1, N'Dịch vụ lưu chuồng')
INSERT [dbo].[DichVu] ([IdDichVu], [MoTaDichVu], [NoiDung], [IdCoSoThuY], [TinhTrang], [TenDichVu]) VALUES (7, N'Chúng tôi cung cấp dịch vụ khám chữa bệnh tại nhà và vận chuyển thú cưng từ nhà quý khách đến PetCare và ngược lại.', N'<header style="box-sizing: border-box; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">
<h1 style="box-sizing: border-box; margin: 0px; padding: 0px 0px 18px; direction: ltr; outline: none; font-size: 40px; color: #333333;">Vận chuyển &ndash; Kh&aacute;m chữa bệnh tại nh&agrave;</h1>
</header>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">Nhằm tạo mọi điều kiện thuận lợi cho qu&yacute; kh&aacute;ch h&agrave;ng, Bệnh Viện Th&uacute; Y PetCare hỗ trợ b&aacute;c sĩ th&uacute; y tận nh&agrave; để thăm kh&aacute;m v&agrave; thực hiện c&aacute;c dịch vụ đơn giản m&agrave; kh&ocirc;ng cần kết quả x&eacute;t nghiệm v&agrave; chẩn đo&aacute;n h&igrave;nh ảnh. &nbsp;Với dịch vụ đưa đ&oacute;n th&uacute; cưng, ch&uacute;ng t&ocirc;i lu&ocirc;n c&oacute; b&aacute;c sĩ th&uacute; y đi c&ugrave;ng để đảm bảo sức khỏe th&uacute; cưng trong suốt qu&aacute; tr&igrave;nh vận chuyển từ nh&agrave; qu&yacute; kh&aacute;ch đến PetCare v&agrave; ngược lại. &nbsp;Phương tiện vận chuyển của PetCare được chuy&ecirc;n biệt h&oacute;a nhằm tạo điều kiện kh&ocirc;ng chỉ vận chuyển m&agrave; nếu cần c&ograve;n c&oacute; thể chăm s&oacute;c trực tiếp vật nu&ocirc;i. T&agrave;i xế PetCare được huấn luyện để hỗ trợ qu&yacute; kh&aacute;ch trong việc đưa vật nu&ocirc;i l&ecirc;n xe, cầm giữ v&agrave; tạo sự thoải m&aacute;i cho vật nu&ocirc;i trong qu&aacute; tr&igrave;nh di chuyển.</p>
<hr style="box-sizing: border-box; border: none; clear: both; height: 0px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;" />
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-1338 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/06/petcare_01-30-copy.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/06/petcare_01-30-copy.jpg 700w, http://petcare.vn/wp-content/uploads/2016/06/petcare_01-30-copy-300x169.jpg 300w" alt="petcare_20" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-1341 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/06/petcare_01-3-copy.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/06/petcare_01-3-copy.jpg 700w, http://petcare.vn/wp-content/uploads/2016/06/petcare_01-3-copy-300x200.jpg 300w" alt="petcare_21" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">PetCare kh&ocirc;ng thu lợi nhuận trong dịch vụ vận chuyển, ph&iacute; di chuyển l&agrave; 18.000 vnd/km t&iacute;nh từ l&uacute;c kh&aacute;ch l&ecirc;n xe, qu&atilde;ng đường sẽ t&iacute;nh theo số km của Google Maps (c&oacute; thể cộng th&ecirc;m v&eacute; qua trạm thu ph&iacute; t&ugrave;y theo lộ tr&igrave;nh).</strong></p>', 1, 1, N'Vận chuyển - Khám bệnh tại nhà')
INSERT [dbo].[DichVu] ([IdDichVu], [MoTaDichVu], [NoiDung], [IdCoSoThuY], [TinhTrang], [TenDichVu]) VALUES (8, N'Các phương pháp chẩn đoán hình ảnh hoặc làm xét nghiệm: Siêu âm, X-Quang, Xét nghiệm máu, virus, nước tiểu, da, kháng sinh đồ...', N'<header style="box-sizing: border-box; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">
<h1 style="box-sizing: border-box; margin: 0px; padding: 0px 0px 18px; direction: ltr; outline: none; font-size: 40px; color: #333333;">X&eacute;t nghiệm &ndash; Chẩn đo&aacute;n h&igrave;nh ảnh</h1>
</header>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;">Tại PetCare, c&aacute;c thiết bị y tế hiện đại được đầu tư nhằm phục vụ c&ocirc;ng t&aacute;c chăm s&oacute;c vật nu&ocirc;i. Khi cần thiết, c&aacute;c b&aacute;c sĩ sẽ tiến h&agrave;nh c&aacute;c phương ph&aacute;p chẩn đo&aacute;n h&igrave;nh ảnh hoặc l&agrave;m x&eacute;t nghiệm để đưa ra hướng điều trị ph&ugrave; hợp với th&uacute; cưng của bạn.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<h2 style="box-sizing: border-box; margin: 0px; padding: 0px 0px 14px; direction: ltr; outline: none; font-family: Arial, Helvetica, sans-serif; font-size: 16px; color: #666666;"><strong style="box-sizing: border-box;">Ch&acirc;̉n đoán hình ảnh</strong></h2>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;"><strong style="box-sizing: border-box;">&bull; &nbsp; Si&ecirc;u &acirc;m</strong>: Đ&acirc;y l&agrave; phương ph&aacute;p phổ biến d&ugrave;ng để đ&aacute;nh gi&aacute; t&igrave;nh trạng sức khỏe vật nu&ocirc;i v&agrave; chẩn đo&aacute;n bệnh trong c&aacute;c trường hợp mang thai, khối u, c&aacute;c bệnh ở v&ugrave;ng bụng v&agrave; nhiều vấn đề kh&aacute;c.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;"><strong style="box-sizing: border-box;">&bull; &nbsp; Chụp X-quang</strong>: m&aacute;y X-quang thường được d&ugrave;ng để ph&aacute;t hiện c&aacute;c vấn đề về xương khớp, khối u, c&aacute;c vật thể lạ trong cơ thể như sỏi thận hoặc dị vật đường ruột v&agrave; chẩn đo&aacute;n nhiều bệnh kh&aacute;c.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;"><img class="size-full wp-image-5241 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/06/sieuam1-1.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/06/sieuam1-1.jpg 700w, http://petcare.vn/wp-content/uploads/2016/06/sieuam1-1-300x206.jpg 300w" alt="sieuam1" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;<br style="box-sizing: border-box;" />&nbsp;<br style="box-sizing: border-box;" /><img class="size-full wp-image-5259 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/06/phimxray.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/06/phimxray.jpg 700w, http://petcare.vn/wp-content/uploads/2016/06/phimxray-300x169.jpg 300w" alt="phimxray" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<h2 style="box-sizing: border-box; margin: 0px; padding: 0px 0px 14px; direction: ltr; outline: none; font-family: Arial, Helvetica, sans-serif; font-size: 16px; color: #666666;"><strong style="box-sizing: border-box;">C&aacute;c dịch vụ x&eacute;t nghiệm</strong></h2>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&bull; &nbsp; &nbsp;Xét nghi&ecirc;̣m máu.<br style="box-sizing: border-box;" />&bull; &nbsp; &nbsp;X&eacute;t nghiệm virus.<br style="box-sizing: border-box;" /><span style="box-sizing: border-box;">&bull; &nbsp; &nbsp;X&eacute;t nghiệm kh&aacute;ng thể dại<br style="box-sizing: border-box;" /></span>&bull; &nbsp; &nbsp;Xét nghi&ecirc;̣m nước ti&ecirc;̉u.<br style="box-sizing: border-box;" />&bull; &nbsp; &nbsp;Xét nghi&ecirc;̣m da.<br style="box-sizing: border-box;" />&bull; &nbsp; &nbsp;Xét nghi&ecirc;̣m ph&acirc;n.<br style="box-sizing: border-box;" />&bull; &nbsp; &nbsp;Kháng sinh đ&ocirc;̀.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;">Ngo&agrave;i ra PetCare c&ograve;n li&ecirc;n kết với c&aacute;c ph&ograve;ng x&eacute;t nghiệm tại nước ngo&agrave;i trong trường hợp th&uacute; cưng của bạn cần th&ecirc;m x&eacute;t nghiệm chuy&ecirc;n khoa kh&aacute;c.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-3498 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/06/xetnghiem.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/06/xetnghiem.jpg 700w, http://petcare.vn/wp-content/uploads/2016/06/xetnghiem-300x200.jpg 300w, http://petcare.vn/wp-content/uploads/2016/06/xetnghiem-272x182.jpg 272w" alt="xetnghiem" /></p>', 1, 1, N'Xét nghiệm - Chẩn đoán hình ảnh')
INSERT [dbo].[DichVu] ([IdDichVu], [MoTaDichVu], [NoiDung], [IdCoSoThuY], [TinhTrang], [TenDichVu]) VALUES (9, N'Viện thẩm mỹ ở PetCare cung cấp dịch vụ chăm sóc da lông vật nuôi theo yêu cầu của quý khách như tắm khô, tắm ướt, chải xù, cắt lông tạo kiểu và cắt móng.', N'<header style="box-sizing: border-box; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">
<h1 style="box-sizing: border-box; margin: 0px; padding: 0px 0px 18px; direction: ltr; outline: none; font-size: 40px; color: #333333;">Thẩm mỹ</h1>
</header>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Viện thẩm mỹ ở PetCare cung cấp dịch vụ trọn g&oacute;i trong chăm s&oacute;c da l&ocirc;ng vật nu&ocirc;i. Dịch vụ bao gồm:</strong></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Chăm s&oacute;c cơ bản:</strong>&nbsp;tắm chải, cắt m&oacute;ng, rửa tai, rửa mắt.<br style="box-sizing: border-box;" /><strong style="box-sizing: border-box;">Chăm s&oacute;c to&agrave;n th&acirc;n:</strong>&nbsp;tắm chải, cắt l&ocirc;ng, cắt m&oacute;ng, rửa tai, rửa mắt.<br style="box-sizing: border-box;" /><strong style="box-sizing: border-box;">Chăm s&oacute;c theo y&ecirc;u cầu:</strong>&nbsp; tắm chải, cắt l&ocirc;ng theo y&ecirc;u cầu, cắt m&oacute;ng, rửa tai, rửa mắt.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Ngo&agrave;i ra ch&uacute;ng t&ocirc;i cung cấp c&aacute;c dịch vụ thẩm mỹ ri&ecirc;ng lẻ theo y&ecirc;u cầu của kh&aacute;ch:</strong></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">Chăm s&oacute;c cắt l&ocirc;ng một phần.<br style="box-sizing: border-box;" />Chăm s&oacute;c cắt l&ocirc;ng to&agrave;n th&acirc;n.<br style="box-sizing: border-box;" />Chăm s&oacute;c cắt l&ocirc;ng theo y&ecirc;u cầu.<br style="box-sizing: border-box;" />Chăm s&oacute;c cắt m&oacute;ng.<br style="box-sizing: border-box;" />Chăm s&oacute;c chải l&ocirc;ng.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">Chăm s&oacute;c tắm chải l&ocirc;ng d&agrave;i.<br style="box-sizing: border-box;" />Chăm s&oacute;c tắm chải l&ocirc;ng ngắn.<br style="box-sizing: border-box;" />Chăm s&oacute;c tắm kh&ocirc; l&ocirc;ng d&agrave;i.<br style="box-sizing: border-box;" />Chăm s&oacute;c tắm kh&ocirc; l&ocirc;ng ngắn.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">Vệ sinh mắt v&agrave; tai.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Tuỳ v&agrave;o nhu cầu, qu&yacute; kh&aacute;ch c&oacute; thể chọn một trong c&aacute;c dịch vụ ri&ecirc;ng biệt tr&ecirc;n cho vật cưng hoặc dịch vụ trọn g&oacute;i với gi&aacute; ưu đ&atilde;i.<br style="box-sizing: border-box;" /></strong></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="alignnone size-full wp-image-5216" style="box-sizing: border-box; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/06/vesinhtai-1.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/06/vesinhtai-1.jpg 700w, http://petcare.vn/wp-content/uploads/2016/06/vesinhtai-1-300x169.jpg 300w" alt="vesinhtai" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-1263 alignnone" style="box-sizing: border-box; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/06/petcare_01-28-copy.jpg" sizes="(max-width: 698px) 100vw, 698px" srcset="http://petcare.vn/wp-content/uploads/2016/06/petcare_01-28-copy.jpg 698w, http://petcare.vn/wp-content/uploads/2016/06/petcare_01-28-copy-300x169.jpg 300w" alt="petcare_01 " /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-1265 alignnone" style="box-sizing: border-box; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/06/petcare_01-6-copy.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/06/petcare_01-6-copy.jpg 700w, http://petcare.vn/wp-content/uploads/2016/06/petcare_01-6-copy-300x200.jpg 300w" alt="petcare_02" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;"><a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70;" href="http://petcare.vn/lien-he/">Li&ecirc;n hệ</a>&nbsp;với ch&uacute;ng t&ocirc;i để đặt hẹn hoặc đến một trong c&aacute;c chi nh&aacute;nh của Petcare để được tư vấn th&ecirc;m về chi ph&iacute; v&agrave; dịch vụ ph&ugrave; hợp với bạn nhỏ của m&igrave;nh.</strong></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Lưu &yacute;: Gi&aacute; dịch vụ sẽ kh&aacute;c nhau t&ugrave;y theo c&acirc;n nặng v&agrave; giống, đặc biệt với c&aacute;c giống như Samoyed, Husky, Alaskan Malamute, Chow Chow,&hellip;</strong></p>', 1, 1, N'Thẩm mỹ')
SET IDENTITY_INSERT [dbo].[DichVu] OFF
SET IDENTITY_INSERT [dbo].[Error] ON 

INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1, N'Không tìm kiếm được tài khoản với UserName: 123456 và Pass: 123', N'   at TakeCareOfThePet.Web.Api.TaiKhoanController.Login(HttpRequestMessage request, LoginModel Login) in e:\CS447\Backend\BackEndAppLanHaiNCKH\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Api\TaiKhoanController.cs:line 92', CAST(N'2018-06-12' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2, N'Không tìm kiếm được tài khoản với UserName: 123456 và Pass: 123', N'   at TakeCareOfThePet.Web.Api.TaiKhoanController.Login(HttpRequestMessage request, LoginModel Login) in e:\CS447\Backend\BackEndAppLanHaiNCKH\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Api\TaiKhoanController.cs:line 92', CAST(N'2018-06-12' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (3, N'Không tìm kiếm được tài khoản với UserName: cosoyte và Pass: 0406', N'   at TakeCareOfThePet.Web.Api.TaiKhoanController.Login(HttpRequestMessage request, LoginModel Login) in e:\CS447\Backend\BackEndAppLanHaiNCKH\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Api\TaiKhoanController.cs:line 92', CAST(N'2018-06-12' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (4, N'Không tìm kiếm được tài khoản với UserName: cosoyte và Pass: 0406', N'   at TakeCareOfThePet.Web.Api.TaiKhoanController.Login(HttpRequestMessage request, LoginModel Login) in e:\CS447\Backend\BackEndAppLanHaiNCKH\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Api\TaiKhoanController.cs:line 92', CAST(N'2018-06-12' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5, N'Không tìm kiếm được tài khoản với UserName: 123123 và Pass: 123123123', N'   at TakeCareOfThePet.Web.Api.TaiKhoanController.Login(HttpRequestMessage request, LoginModel Login) in e:\CS447\Backend\BackEndAppLanHaiNCKH\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Api\TaiKhoanController.cs:line 92', CAST(N'2018-06-12' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6, N'Không tìm kiếm được cơ sở thú y với id 9', N'   at TakeCareOfThePet.Web.Api.CoSoThuYController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id) in e:\CS447\Backend\BackEndAppLanHaiNCKH\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Api\CoSoThuYController.cs:line 143', CAST(N'2018-06-12' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1005, N'Không tồn tại hình ảnh sản phẩm nào', N'   at TakeCareOfThePet.Web.Api.HinhAnhSanPhamController.GetAll(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1006, N'Không tồn tại hình ảnh sản phẩm nào', N'   at TakeCareOfThePet.Web.Api.HinhAnhSanPhamController.GetAll(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1007, N'Không tồn tại hình ảnh sản phẩm nào', N'   at TakeCareOfThePet.Web.Api.HinhAnhSanPhamController.GetAll(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1008, N'Không tìm kiếm được tài khoản với UserName: sample string 1 và Pass: sample string 2', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel Login)', CAST(N'2018-06-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1009, N'Không tồn tại hình ảnh sản phẩm nào', N'   at TakeCareOfThePet.Web.Controllers.HinhAnhSanPhamController.GetAll(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-18' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1010, N'Không tìm kiếm được sản phẩm với id 15', N'   at TakeCareOfThePet.Web.Controllers.SanPhamController.GetById(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\Webservice\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\SanPhamController.cs:line 151', CAST(N'2018-06-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1011, N'Không tồn tại bài viết sắp xếp nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAllSortDate(HttpRequestMessage request)', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1012, N'Không tồn tại giống thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.GiongThuCungController.SearchKey(HttpRequestMessage request, String searchKey)', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1013, N'Không tồn tại giống thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.GiongThuCungController.SearchKey(HttpRequestMessage request, String searchKey)', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1014, N'Không tồn tại bài viết sắp xếp nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAllSortDate(HttpRequestMessage request)', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1015, N'Không tồn tại bài viết sắp xếp nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAllSortDate(HttpRequestMessage request)', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1016, N'Không tồn tại bài viết sắp xếp nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAllSortDate(HttpRequestMessage request)', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1017, N'Không tồn tại bài viết sắp xếp nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAllSortDate(HttpRequestMessage request)', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1018, N'Không tồn tại bài viết sắp xếp nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAllSortDate(HttpRequestMessage request)', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1019, N'Không tồn tại bài viết nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAll(HttpRequestMessage request)', CAST(N'2018-06-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1020, N'Không tìm kiếm được người dùng với id 2', N'   at TakeCareOfThePet.Web.Controllers.NguoiDungController.GetById(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-22' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1021, N'Không tìm kiếm được người dùng với id 12', N'   at TakeCareOfThePet.Web.Controllers.NguoiDungController.GetById(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-22' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1022, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login) in e:\Nghiên Cứu Khoa Học 2\ServiceChuan\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\TaiKhoanController.cs:line 141', CAST(N'2018-06-23' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1023, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login) in e:\Nghiên Cứu Khoa Học 2\ServiceChuan\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\TaiKhoanController.cs:line 141', CAST(N'2018-06-23' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1024, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-06-22' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1025, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-06-22' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1026, N'Username and pass fail', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.DoiMatKhau(HttpRequestMessage request, DoiMatKhauModel model)', CAST(N'2018-06-22' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1027, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-06-22' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1028, N'Không tìm kiếm được cơ sở thú y với id 4', N'   at TakeCareOfThePet.Web.Controllers.CoSoThuYController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-23' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1029, N'Không tìm kiếm được cơ sở thú y với id 4', N'   at TakeCareOfThePet.Web.Controllers.CoSoThuYController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-23' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1030, N'Không tìm kiếm được cơ sở thú y với id 4', N'   at TakeCareOfThePet.Web.Controllers.CoSoThuYController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-23' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1031, N'Không tồn tại hang trong hóa đơn với id 2', N'   at TakeCareOfThePet.Web.Controllers.HoaDonController.GetAllChiTietHoaDonByIdHoaDon(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceChuan\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoaDonController.cs:line 73', CAST(N'2018-06-23' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1032, N'Không tồn tại hang trong hóa đơn với id 2', N'   at TakeCareOfThePet.Web.Controllers.HoaDonController.GetAllChiTietHoaDonByIdHoaDon(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-23' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1033, N'Không tồn tại hang trong hóa đơn với id 9', N'   at TakeCareOfThePet.Web.Controllers.HoaDonController.GetAllChiTietHoaDonByIdHoaDon(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceChuan\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoaDonController.cs:line 75', CAST(N'2018-06-23' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1034, N'Không tồn tại hang trong hóa đơn với id 9', N'   at TakeCareOfThePet.Web.Controllers.HoaDonController.GetAllChiTietHoaDonByIdHoaDon(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceChuan\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoaDonController.cs:line 75', CAST(N'2018-06-23' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1035, N'Không tồn tại hình ảnh sản phẩm nào', N'   at TakeCareOfThePet.Web.Controllers.HinhAnhSanPhamController.GetAll(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-23' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1036, N'Không tồn tại hình ảnh sản phẩm nào', N'   at TakeCareOfThePet.Web.Controllers.HinhAnhSanPhamController.GetAll(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-23' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1037, N'Không tìm kiếm được thông tin thú cưng với id 3', N'   at TakeCareOfThePet.Web.Controllers.ThuCungController.GetAllByIdNguoiDung(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-24' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1038, N'Không tìm kiếm được thông tin sản phẩm với id shop 6', N'   at TakeCareOfThePet.Web.Controllers.SanPhamController.GetAllByIdShop(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-26' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1039, N'Không tìm kiếm được thông tin sản phẩm với id shop 6', N'   at TakeCareOfThePet.Web.Controllers.SanPhamController.GetAllByIdShop(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-26' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1040, N'Không tồn tại loại sản phẩm nào', N'   at TakeCareOfThePet.Web.Controllers.LoaiSanPhamController.GetAllByIdShop(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-26' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1041, N'Không tìm kiếm được thông tin sản phẩm với id shop 6', N'   at TakeCareOfThePet.Web.Controllers.SanPhamController.GetAllByIdShop(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-26' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1042, N'Không tồn tại loại sản phẩm nào', N'   at TakeCareOfThePet.Web.Controllers.LoaiSanPhamController.GetAllByIdShop(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-26' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1043, N'Không tìm kiếm được thông tin sản phẩm với id shop 6', N'   at TakeCareOfThePet.Web.Controllers.SanPhamController.GetAllByIdShop(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-26' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1044, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-06-26' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1045, N'Không tìm kiếm được thông tin thú cưng với id 4', N'   at TakeCareOfThePet.Web.Controllers.ThuCungController.GetAllByIdNguoiDung(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-27' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1046, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-27' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1047, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-27' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1048, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-27' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1049, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-27' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1050, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-27' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1051, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-27' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1052, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-27' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1053, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1054, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1055, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1056, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1057, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1058, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1059, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1060, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1061, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1062, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1063, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1064, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1065, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1066, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id)', CAST(N'2018-06-30' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1067, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-02' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1068, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-02' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2067, N'Không tồn tại danh sách bài viết của chuyên mục nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAllByIdChuyenMuc(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-02' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2068, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2069, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2070, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2071, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2072, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2073, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2074, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2075, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2076, N'Không tồn tại bài viết với id 23', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAll(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2077, N'Không tồn tại bài viết với id 22', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAll(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2078, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2079, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2080, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2081, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2082, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2083, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2084, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2085, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2086, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-06' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2087, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-07' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2088, N'Không tồn tại sản phẩm nào bán trong ngày', N'   at TakeCareOfThePet.Web.Controllers.ThongKeBaoCaoController.Lay_Ra_5_San_Pham_Max_Trong_Ngay(HttpRequestMessage request, Int32 idShop)', CAST(N'2018-07-08' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2089, N'Không tồn tại sản phẩm nào bán trong ngày', N'   at TakeCareOfThePet.Web.Controllers.ThongKeBaoCaoController.Lay_Ra_5_San_Pham_Max_Trong_Ngay(HttpRequestMessage request, Int32 idShop)', CAST(N'2018-07-08' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2090, N'Không tồn tại sản phẩm nào bán trong ngày', N'   at TakeCareOfThePet.Web.Controllers.ThongKeBaoCaoController.Lay_Ra_5_San_Pham_Max_Trong_Ngay(HttpRequestMessage request, Int32 idShop)', CAST(N'2018-07-08' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2091, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-09' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2092, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-09' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2093, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-09' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2094, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-09' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2095, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-09' AS Date))
GO
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2096, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-09' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2097, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-10' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2098, N'Không tồn tại giống thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.GiongThuCungController.SearchKey(HttpRequestMessage request, String searchKey)', CAST(N'2018-07-10' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2099, N'Không tồn tại giống thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.GiongThuCungController.SearchKey(HttpRequestMessage request, String searchKey)', CAST(N'2018-07-10' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2100, N'Không tồn tại giống thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.GiongThuCungController.SearchKey(HttpRequestMessage request, String searchKey)', CAST(N'2018-07-10' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2101, N'Không tồn tại danh sách bài viết của chuyên mục nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAllByIdChuyenMuc(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-10' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2102, N'Không tồn tại danh sách bài viết của chuyên mục nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAllByIdChuyenMuc(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-10' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2103, N'Không tồn tại danh sách bài viết của chuyên mục nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAllByIdChuyenMuc(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-10' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2104, N'Không tồn tại danh sách bài viết của chuyên mục nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAllByIdChuyenMuc(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-10' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2105, N'Không tồn tại danh sách bài viết của chuyên mục nào', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAllByIdChuyenMuc(HttpRequestMessage request, Int32 id)', CAST(N'2018-07-10' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2106, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2107, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2108, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2109, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2110, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2111, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2112, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2113, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2114, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2115, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2116, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2117, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2118, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2119, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2120, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2121, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2122, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2123, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2124, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2125, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login)', CAST(N'2018-07-11' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2126, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuY(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 98', CAST(N'2018-07-14' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2127, N'Không tìm kiếm được dich vu với id 2', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetById(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 70', CAST(N'2018-07-14' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2128, N'Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.SucKhoeThuCungController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\SucKhoeThuCungController.cs:line 96', CAST(N'2018-07-15' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2129, N'Không tìm kiếm được Lich Su Kham với id 14', N'   at TakeCareOfThePet.Web.Controllers.LichSuKhamController.GetById(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\LichSuKhamController.cs:line 40', CAST(N'2018-07-15' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2130, N'Không tìm kiếm được gioi thieu với id 4', N'   at TakeCareOfThePet.Web.Controllers.GioiThieuController.GetById(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\GioiThieuController.cs:line 67', CAST(N'2018-07-16' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2131, N'Không tìm kiếm được gioi thieu với id 4', N'   at TakeCareOfThePet.Web.Controllers.GioiThieuController.GetById(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\GioiThieuController.cs:line 67', CAST(N'2018-07-16' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2132, N'Không tìm kiếm được gioi thieu với id 4', N'   at TakeCareOfThePet.Web.Controllers.GioiThieuController.GetById(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\GioiThieuController.cs:line 67', CAST(N'2018-07-16' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2133, N'Không tìm kiếm được cơ sở thú y với id 5', N'   at TakeCareOfThePet.Web.Controllers.CoSoThuYController.GetById(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\CoSoThuYController.cs:line 152', CAST(N'2018-07-16' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2134, N'Không tồn tại hoat dong nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.HoatDongController.GetAllWithIdCoSoThuY(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoatDongController.cs:line 126', CAST(N'2018-07-16' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2135, N'Không tìm kiếm được Phieu Hen Kham với id 3', N'   at TakeCareOfThePet.Web.Controllers.PhieuHenKhamController.GetById(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\PhieuHenKhamController.cs:line 39', CAST(N'2018-07-16' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2136, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\ShopController.cs:line 118', CAST(N'2018-07-16' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2137, N'Không tìm kiếm được shop với id 15', N'   at TakeCareOfThePet.Web.Controllers.ShopController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\ShopController.cs:line 118', CAST(N'2018-07-16' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2138, N'Không tồn tại hình ảnh sản phẩm nào', N'   at TakeCareOfThePet.Web.Controllers.HinhAnhSanPhamController.GetAll(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HinhAnhSanPhamController.cs:line 49', CAST(N'2018-07-16' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2139, N'Không tồn tại hình ảnh sản phẩm nào', N'   at TakeCareOfThePet.Web.Controllers.HinhAnhSanPhamController.GetAll(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HinhAnhSanPhamController.cs:line 49', CAST(N'2018-07-16' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (3139, N'Không tồn tại hóa đơn nào bán trong thang', N'   at TakeCareOfThePet.Web.Controllers.ThongKeBaoCaoController.Hoa_Don_Theo_Thang(HttpRequestMessage request, Int32 idShop, ThongKeHoaDon thongKeHoaDon) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\ThongKeBaoCaoController.cs:line 125', CAST(N'2018-07-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (3140, N'Không tồn tại hóa đơn với id 1012', N'   at TakeCareOfThePet.Web.Controllers.HoaDonController.GetAll(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoaDonController.cs:line 58', CAST(N'2018-07-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (3141, N'Không tồn tại hang trong hóa đơn với id 1012', N'   at TakeCareOfThePet.Web.Controllers.HoaDonController.GetAllChiTietHoaDonByIdHoaDon(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoaDonController.cs:line 86', CAST(N'2018-07-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (4139, N'Không tồn tại tình trạng thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.TinhTrangController.GetAllByIdThuCung(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\TinhTrangController.cs:line 46', CAST(N'2018-07-18' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (4140, N'Không tồn tại cân nặng thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.CanNangController.GetAllCanNangWithIdThuCung(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\CanNangController.cs:line 75', CAST(N'2018-07-18' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5139, N'Không tồn tại Lich Su Kham nào voi id thu cung', N'   at TakeCareOfThePet.Web.Controllers.LichSuKhamController.GetAllWithIdCoSoThuY(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\LichSuKhamController.cs:line 97', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5140, N'Không tìm kiếm được cơ sở thú y với id 15', N'   at TakeCareOfThePet.Web.Controllers.CoSoThuYController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\CoSoThuYController.cs:line 178', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5141, N'Không tìm kiếm được cơ sở thú y với id 15', N'   at TakeCareOfThePet.Web.Controllers.CoSoThuYController.GetByIdTaiKhoan(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\CoSoThuYController.cs:line 178', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5142, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5143, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5144, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5145, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5146, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5147, N'Không tồn tại hoat dong nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.HoatDongController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoatDongController.cs:line 146', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5148, N'Không tồn tại hoat dong nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.HoatDongController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoatDongController.cs:line 146', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5149, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5150, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5151, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5152, N'Không tồn tại hoat dong nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.HoatDongController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoatDongController.cs:line 146', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5153, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5154, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5155, N'Không tồn tại hoat dong nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.HoatDongController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoatDongController.cs:line 146', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5156, N'Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.SucKhoeThuCungController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\SucKhoeThuCungController.cs:line 143', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5157, N'Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.SucKhoeThuCungController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\SucKhoeThuCungController.cs:line 143', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5158, N'Không tồn tại hoat dong nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.HoatDongController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoatDongController.cs:line 146', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5159, N'Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.SucKhoeThuCungController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\SucKhoeThuCungController.cs:line 143', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5160, N'Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.SucKhoeThuCungController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\SucKhoeThuCungController.cs:line 143', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5161, N'Không tồn tại hoat dong nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.HoatDongController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoatDongController.cs:line 146', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5162, N'Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.SucKhoeThuCungController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\SucKhoeThuCungController.cs:line 143', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5163, N'Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.SucKhoeThuCungController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\SucKhoeThuCungController.cs:line 143', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5164, N'Không tồn tại hoat dong nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.HoatDongController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoatDongController.cs:line 146', CAST(N'2018-07-19' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6147, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6148, N'Không tồn tại hoat dong nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.HoatDongController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoatDongController.cs:line 146', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6149, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6150, N'Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.SucKhoeThuCungController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\SucKhoeThuCungController.cs:line 143', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6151, N'Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.SucKhoeThuCungController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\SucKhoeThuCungController.cs:line 143', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6152, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6153, N'Không tồn tại hoat dong nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.HoatDongController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoatDongController.cs:line 146', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6154, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6155, N'Không tồn tại hoat dong nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.HoatDongController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoatDongController.cs:line 146', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6156, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6157, N'Không tồn tại dich vu nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.DichVuController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\DichVuController.cs:line 96', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6158, N'Không tồn tại Suc Khoe Thu Cung nào voi id co so thu y', N'   at TakeCareOfThePet.Web.Controllers.SucKhoeThuCungController.GetAllWithIdCoSoThuYForTrue(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\SucKhoeThuCungController.cs:line 143', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6159, N'Không tồn tại bài viết với id 7', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAll(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BaiVietController.cs:line 245', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6160, N'Không tồn tại bài viết với id 23', N'   at TakeCareOfThePet.Web.Controllers.BaiVietController.GetAll(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BaiVietController.cs:line 245', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6161, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6162, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6163, N'Không tồn tại hình ảnh sản phẩm nào', N'   at TakeCareOfThePet.Web.Controllers.HinhAnhSanPhamController.GetAll(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HinhAnhSanPhamController.cs:line 49', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6164, N'Không tồn tại Lich Su Kham nào voi id thu cung', N'   at TakeCareOfThePet.Web.Controllers.LichSuKhamController.GetAllWithIdCoSoThuY(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\LichSuKhamController.cs:line 97', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6165, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6166, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6167, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6168, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6169, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6170, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-20' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6171, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-20' AS Date))
GO
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6172, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6173, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6174, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6175, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6176, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-07-21' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6177, N'Không tồn tại Lich Su Kham nào voi id thu cung', N'   at TakeCareOfThePet.Web.Controllers.LichSuKhamController.GetAllWithIdCoSoThuY(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\LichSuKhamController.cs:line 97', CAST(N'2018-07-22' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (7172, N'Không tồn tại Lich Su Kham nào voi id thu cung', N'   at TakeCareOfThePet.Web.Controllers.LichSuKhamController.GetAllWithIdCoSoThuY(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\LichSuKhamController.cs:line 97', CAST(N'2018-07-28' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (7173, N'Không tồn tại tình trạng thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.TinhTrangController.GetAllByIdThuCung(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\TinhTrangController.cs:line 46', CAST(N'2018-07-28' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (7174, N'Không tồn tại cân nặng thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.CanNangController.GetAllCanNangWithIdThuCung(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\CanNangController.cs:line 75', CAST(N'2018-07-28' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8172, N'Không tìm kiếm được thông tin thú cưng với id 13', N'   at TakeCareOfThePet.Web.Controllers.ThuCungController.GetAllByIdNguoiDung(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\ThuCungController.cs:line 123', CAST(N'2018-08-14' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8173, N'Không tồn tại cân nặng thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.CanNangController.GetAllCanNangWithIdThuCung(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\CanNangController.cs:line 75', CAST(N'2018-08-14' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8174, N'Không tồn tại tình trạng thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.TinhTrangController.GetAllByIdThuCung(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\TinhTrangController.cs:line 46', CAST(N'2018-08-14' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8175, N'Không tồn tại sản phẩm nào bán trong ngày', N'   at TakeCareOfThePet.Web.Controllers.ThongKeBaoCaoController.Lay_Ra_5_San_Pham_Max_Trong_Ngay(HttpRequestMessage request, Int32 idShop) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\ThongKeBaoCaoController.cs:line 46', CAST(N'2018-08-14' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8176, N'Không tồn tại sản phẩm nào bán trong thang', N'   at TakeCareOfThePet.Web.Controllers.ThongKeBaoCaoController.Lay_Ra_10_San_Pham_Max_Trong_Thang(HttpRequestMessage request, Int32 idShop, ThongKeSanPham10SPMax thongKeSanPham10SpMax) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\ThongKeBaoCaoController.cs:line 72', CAST(N'2018-08-14' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8177, N'Không tồn tại sản phẩm nào bán trong thang', N'   at TakeCareOfThePet.Web.Controllers.ThongKeBaoCaoController.Lay_Ra_10_San_Pham_Max_Trong_Thang(HttpRequestMessage request, Int32 idShop, ThongKeSanPham10SPMax thongKeSanPham10SpMax) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\ThongKeBaoCaoController.cs:line 72', CAST(N'2018-08-14' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8178, N'Không tồn tại sản phẩm nào bán trong thang', N'   at TakeCareOfThePet.Web.Controllers.ThongKeBaoCaoController.Lay_Ra_10_San_Pham_Max_Trong_Thang(HttpRequestMessage request, Int32 idShop, ThongKeSanPham10SPMax thongKeSanPham10SpMax) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\ThongKeBaoCaoController.cs:line 72', CAST(N'2018-08-14' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8179, N'Không tồn tại Lich Su Kham nào voi id thu cung', N'   at TakeCareOfThePet.Web.Controllers.LichSuKhamController.GetAllWithIdCoSoThuY(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\LichSuKhamController.cs:line 97', CAST(N'2018-08-14' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8180, N'Không tồn tại tình trạng thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.TinhTrangController.GetAllByIdThuCung(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\TinhTrangController.cs:line 46', CAST(N'2018-08-14' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8181, N'Không tồn tại cân nặng thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.CanNangController.GetAllCanNangWithIdThuCung(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\CanNangController.cs:line 75', CAST(N'2018-08-14' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8182, N'Đăng nhập thất bại', N'   at TakeCareOfThePet.Web.Controllers.TaiKhoanController.Login(HttpRequestMessage request, LoginModel login) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\TaiKhoanController.cs:line 219', CAST(N'2018-08-15' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8183, N'Không tồn tại hóa đơn với id 2015', N'   at TakeCareOfThePet.Web.Controllers.HoaDonController.GetAll(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoaDonController.cs:line 58', CAST(N'2018-08-15' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8184, N'Không tồn tại hang trong hóa đơn với id 2015', N'   at TakeCareOfThePet.Web.Controllers.HoaDonController.GetAllChiTietHoaDonByIdHoaDon(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\HoaDonController.cs:line 86', CAST(N'2018-08-15' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8185, N'Không tồn tại Lich Su Kham nào voi id thu cung', N'   at TakeCareOfThePet.Web.Controllers.LichSuKhamController.GetAllWithIdCoSoThuY(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\LichSuKhamController.cs:line 97', CAST(N'2018-08-16' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8186, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-08-16' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8187, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-08-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8188, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-08-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8189, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-08-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8190, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-08-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8191, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-08-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8192, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-08-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8193, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-08-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8194, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-08-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8195, N'Không tồn tại bình luận bai viet nào', N'   at TakeCareOfThePet.Web.Controllers.BinhLuanController.GetAllBinhLuanWithIdBaiViet(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\BinhLuanController.cs:line 50', CAST(N'2018-08-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8196, N'Không tồn tại shop nào', N'   at TakeCareOfThePet.Web.Controllers.ShopController.ChuaPheDuyet(HttpRequestMessage request) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\ShopController.cs:line 76', CAST(N'2018-08-17' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (9186, N'Không tồn tại shop nào', N'   at TakeCareOfThePet.Web.Controllers.ShopController.ChuaPheDuyet(HttpRequestMessage request) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\ShopController.cs:line 76', CAST(N'2018-08-25' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (9187, N'Không tồn tại cân nặng thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.CanNangController.GetAllCanNangWithIdThuCung(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\CanNangController.cs:line 75', CAST(N'2018-08-25' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (9188, N'Không tồn tại Lich Su Kham nào voi id thu cung', N'   at TakeCareOfThePet.Web.Controllers.LichSuKhamController.GetAllWithIdCoSoThuY(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\LichSuKhamController.cs:line 97', CAST(N'2018-08-25' AS Date))
INSERT [dbo].[Error] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (9189, N'Không tồn tại tình trạng thú cưng nào', N'   at TakeCareOfThePet.Web.Controllers.TinhTrangController.GetAllByIdThuCung(HttpRequestMessage request, Int32 id) in e:\Nghiên Cứu Khoa Học 2\ServiceNangCao\ServiceAppTakeCareOfThePetLanHai\TakeCareOfThePet.Web\Controllers\TinhTrangController.cs:line 46', CAST(N'2018-08-25' AS Date))
SET IDENTITY_INSERT [dbo].[Error] OFF
SET IDENTITY_INSERT [dbo].[GioiThieu] ON 

INSERT [dbo].[GioiThieu] ([IdGioiThieu], [NoiDung], [IdCoSoThuY]) VALUES (1, N'<header style="box-sizing: border-box; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">
<h1 style="box-sizing: border-box; margin: 0px; padding: 0px 0px 18px; direction: ltr; outline: none; font-size: 40px; color: #333333;">Lịch sử ph&aacute;t triển</h1>
</header>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">Cho đến trước v&agrave; trong năm 1996 cả nước chỉ tồn tại duy nhất h&igrave;nh thức dịch vụ th&uacute; y cung cấp bởi c&aacute;c Trạm v&agrave; Chi Cục Th&uacute; Y thuộc c&aacute;c tỉnh th&agrave;nh, quận huyện thuộc nh&agrave; nước quản l&yacute;. Ph&ograve;ng mạch th&uacute; y tư nh&acirc;n nhận giấy chứng nhận h&agrave;nh nghề số 001 tại 146 X&oacute;m Đất, Quận 11 l&agrave; tiền th&acirc;n của Bệnh Viện Th&uacute; Y PetCare hiện giờ.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;"><span style="box-sizing: border-box;">Th&aacute;ng 6/2005, ThS. BS. Huỳnh Thị Thanh Ngọc th&agrave;nh lập c&ocirc;ng ty TNHH MTV Dịch vụ Th&uacute; Y An Việt, ch&iacute;nh thức x&acirc;y dựng n&ecirc;n Bệnh viện Th&uacute; Y PetCare. Đến nay, PetCare c&oacute; 4 chi nh&aacute;nh trong nội th&agrave;nh TP.HCM v&agrave; TP. Vũng T&agrave;u với tổng cộng 29 nh&acirc;n vi&ecirc;n, trong đ&oacute; c&oacute; 17 nh&acirc;n vi&ecirc;n phụ tr&aacute;ch chuy&ecirc;n m&ocirc;n v&agrave; 12 nh&acirc;n vi&ecirc;n văn ph&ograve;ng.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-3507 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/05/ngayhoigiadinh.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/05/ngayhoigiadinh.jpg 700w, http://petcare.vn/wp-content/uploads/2016/05/ngayhoigiadinh-300x169.jpg 300w" alt="ngayhoigiadinh" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box;"><br style="box-sizing: border-box;" />Tại PetCare, đội ngũ b&aacute;c sĩ của ch&uacute;ng t&ocirc;i được tham gia c&aacute;c kh&oacute;a đ&agrave;o tạo của Chi Hội Th&uacute; Y Th&uacute; Nhỏ Thế Giới &nbsp;để n&acirc;ng cao năng lực v&agrave; l&agrave;m việc tại bệnh viện với cơ sở vật chất hiện đại nhằm duy tr&igrave; ti&ecirc;u chuẩn cao trong c&ocirc;ng t&aacute;c chăm s&oacute;c sức khỏe vật nu&ocirc;i.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;">C&aacute;c dịch vụ PetCare cung cấp bao gồm:</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;">&bull; &nbsp; &nbsp;Kh&aacute;m v&agrave; điều trị<br style="box-sizing: border-box;" />&bull; &nbsp; &nbsp;X&eacute;t nghiệm &ndash; Chẩn đo&aacute;n h&igrave;nh ảnh<br style="box-sizing: border-box;" />&bull; &nbsp; &nbsp;Phẫu thuật<br style="box-sizing: border-box;" />&bull; &nbsp; &nbsp;Ph&ograve;ng chống k&iacute; sinh tr&ugrave;ng &ndash; Ti&ecirc;m ph&ograve;ng<br style="box-sizing: border-box;" />&bull; &nbsp; &nbsp;Dịch vụ thẩm mỹ<br style="box-sizing: border-box;" />&bull; &nbsp; &nbsp;Vận chuyển th&uacute; cưng &ndash; Kh&aacute;m chữa bệnh tại nh&agrave;<br style="box-sizing: border-box;" />&bull; &nbsp; &nbsp;Dịch vụ xuất nhập cảnh ch&oacute; m&egrave;o</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><em style="box-sizing: border-box;"><strong style="box-sizing: border-box;">H&atilde;y để ch&uacute;ng t&ocirc;i chăm s&oacute;c th&uacute; cưng của bạn.</strong></em></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-4408 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/05/pc1_001.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/05/pc1_001.jpg 700w, http://petcare.vn/wp-content/uploads/2016/05/pc1_001-300x185.jpg 300w" alt="pc1_001" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-1358 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/05/13349059_1192098464147113_1275920832_n-copy.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/05/13349059_1192098464147113_1275920832_n-copy.jpg 700w, http://petcare.vn/wp-content/uploads/2016/05/13349059_1192098464147113_1275920832_n-copy-300x168.jpg 300w" alt="petcare_26" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-3559 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/05/pc2_1.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/05/pc2_1.jpg 700w, http://petcare.vn/wp-content/uploads/2016/05/pc2_1-300x169.jpg 300w" alt="pc2_1" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-6483 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/07/nhanvien.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/07/nhanvien.jpg 700w, http://petcare.vn/wp-content/uploads/2016/07/nhanvien-300x169.jpg 300w" alt="" /></p>', 1)
SET IDENTITY_INSERT [dbo].[GioiThieu] OFF
SET IDENTITY_INSERT [dbo].[GiongThuCung] ON 

INSERT [dbo].[GiongThuCung] ([IdGiongThuCung], [TenGiongThuCung], [GioiThieu], [HinhAnh], [DacDiem], [TinhCach], [CachChamSoc], [LuuYSucKhoe], [LichSu], [TrangThai]) VALUES (1, N'Giống chó Becgie Đức (GSD)', N'<p><span style="color: #333333; font-family: arial; font-size: 15px; text-align: justify;">Giống ch&oacute; Becgie Đức (GSD) l&agrave; giống ch&oacute; c&oacute; k&iacute;ch thước lớn thuộc nh&oacute;m ch&oacute; chăn gia s&uacute;c. L&agrave; một giống rất th&ocirc;ng minh v&agrave; linh hoạt, n&oacute; được ph&aacute;t triển ở Đức với mục đ&iacute;ch ban đầu l&agrave; bảo vệ v&agrave; chăn dắt đ&agrave;n gia s&uacute;c. N&oacute; cũng l&agrave; giống ch&oacute; rất năng động v&agrave; l&agrave; sự lựa chọn tuyệt vời cho mục đ&iacute;ch bảo vệ</span></p>', N'giong-cho-183345763.jpg', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;">Đặc điểm cơ thể giống ch&oacute; Becgie Đức</h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Giống ch&oacute; Becgie Đức c&oacute; hai lớp l&ocirc;ng d&agrave;y bao phủ giống như hai chiếc &aacute;o kho&aacute;c. Lớp &aacute;o ngo&agrave;i d&agrave;y hơn lớp trong v&agrave; hơi lượn s&oacute;ng hoặc thẳng t&ugrave;y thuộc từng con. Bộ l&ocirc;ng của GSD thường c&oacute; m&agrave;u n&acirc;u pha đen hoặc m&agrave;u đỏ pha đen, c&oacute; độ d&agrave;i vừa phải v&agrave; rụng quannh năm. Ngo&agrave;i ra, c&ograve;n c&oacute; một số biến dị m&agrave;u sắc kh&aacute;c m&agrave; ch&uacute;ng ta thường &iacute;t gặp đ&oacute; l&agrave; đen tuyền, m&agrave;u trắng hay m&agrave;u xanh.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Cơ thể của ch&oacute; Becgie Đức kh&aacute; cao &ndash; trung b&igrave;nh khoảng từ 55,88 cm &ndash; 66.04 cm &ndash; tương ứng với chiều d&agrave;i của n&oacute;. Điều đ&oacute; mang lại cho GSD sức mạnh vượt trội hơn so với nhiều giống kh&aacute;c cũng như sự nhanh nhẹn, linh hoạt v&agrave; c&oacute; những sải bước thanh lịch.v</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;">T&iacute;nh c&aacute;ch đặc trưng của giống ch&oacute; Becgie Đức (GSD)</h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">GSD lu&ocirc;n c&oacute; &ldquo;&yacute; thức&rdquo; bảo vệ rất tốt v&agrave; rất ph&ugrave; hợp cho c&ocirc;ng việc kiểu như tr&ocirc;ng giữ nh&agrave; cửa v&igrave; n&oacute; lu&ocirc;n duy tr&igrave; một th&aacute;i độ nghi ngờ v&agrave; c&aacute;ch biệt với người lạ. Trong những l&uacute;c cần thiết, n&oacute; tỏ ra rất quyết đo&aacute;n v&agrave; c&oacute; uy lực đối với những ch&uacute; ch&oacute; kh&aacute;c tuy nhi&ecirc;n b&igrave;nh thường th&igrave; ch&uacute;ng lại rất th&acirc;n thiện với những vật nu&ocirc;i kh&aacute;c trong nh&agrave;. GSD l&agrave; một giống ch&oacute; v&ocirc; c&ugrave;ng linh hoạt, n&oacute; thể hiện rất th&ocirc;ng minh v&agrave; nghi&ecirc;m t&uacute;c trong c&aacute;c hoạt động t&igrave;nh b&aacute;o.</p>', N'<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><strong>Chăm s&oacute;c</strong></p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">GSD c&oacute; thể sống ngo&agrave;i trời trong điều kiện thời tiết lạnh hay kh&iacute; hậu &ocirc;n đới, tuy nhi&ecirc;n n&oacute; cũng rất th&iacute;ch sống trong nh&agrave;.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">C&aacute;c buổi huấn luyện cũng như luyện tập thường xuy&ecirc;n l&agrave; việc l&agrave;m rất cần thiết để giữ cho t&acirc;m tr&iacute; v&agrave; cơ thể của GSD lu&ocirc;n trọng trạng th&aacute;i tốt nhất.&gt;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">L&ocirc;ng của ch&oacute; Becgie Đức rụng quanh năm n&ecirc;n ch&uacute;ng ta n&ecirc;n chải l&ocirc;ng thường xuy&ecirc;n ch&oacute; n&oacute;, tốt nhất l&agrave; khoảng 1-2 lần/ tuần nhằm k&iacute;ch th&iacute;ch sự mọc l&ocirc;ng cũng như giảm thiểu sự t&iacute;ch tụ l&ocirc;ng trong nh&agrave;.</p>', N'<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><strong>Sức khỏe.</strong></p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Ch&oacute; Becgie Đức c&oacute; tuổi thọ trung b&igrave;nh từ 10 đến 12 năm. Tuy nhi&ecirc;n n&oacute; thường mắc một số bệnh nghi&ecirc;m trọng như loạn sản khớp khuỷu tay (chi trước) hay loạn sản khớp xương h&ocirc;ng, cũng như c&aacute;c vấn đề nhỏ như bệnh cơ tim, tho&aacute;i h&oacute;a tủy sống, dị ứng da, xoăn dạ d&agrave;y, đục thủy tinh thể, r&ograve; hậu m&ocirc;n.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Ngo&agrave;i ra, GSD c&ograve;n rất dễ nhiễm c&aacute;c loại nấm độc g&acirc;y tử vong.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Bởi v&igrave; giống ch&oacute; Becgie Đức rất nhạy với c&aacute;c điều kiện ngoại cảnh n&ecirc;n cũng như những giống ch&oacute; kh&aacute;c, ch&uacute;ng cần được c&aacute;c b&aacute;c sỹ th&uacute; y kiểm tra sức khỏe thường xuy&ecirc;n. Khi đ&oacute;, ch&uacute;ng sẽ được kiểm tra đầy đủ từ khớp h&ocirc;ng, khuỷu tay cho đến x&eacute;t nghiệm m&aacute;u, mắt v&agrave; c&aacute;c x&eacute;t nghiệm kh&aacute;c.</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;">Lịch sử v&agrave; bối cảnh ra đời giống ch&oacute; Becgie Đức (GSD)</h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Trong nhiều năm trở lại đ&acirc;y, GSD đ&atilde; gi&uacute;p &iacute;ch cho con người trong rất nhiều lĩnh vực kh&aacute;c nhau như: nghiệp vụ cảnh s&aacute;t, bảo vệ, hướng dẫn, ph&aacute;t hiện ma t&uacute;y, t&igrave;m kiếm cứu hộ, v&agrave; đặc biệt l&agrave; chăn dắt đ&agrave;n gia s&uacute;c.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Thuyền trưởng Max von Stephanitz, nh&agrave; lai tạo ch&iacute;nh thức đầu ti&ecirc;n của GSD đ&atilde; d&ugrave;ng nhiều con ch&oacute; chăn gia s&uacute;c kh&aacute;c nhau của người Đức lai tạo với nhau để cho ra sản phẩm l&agrave; giống ch&oacute; Becgie với nhiều đặc điểm nổi bật được giới thiệu sau n&agrave;y. &Ocirc;ng cũng đặc biệt nhấn mạnh rằng c&oacute; nhiều loại ch&oacute; chăn cừu kh&aacute;c nhau nhưng &ocirc;ng th&iacute;ch nhất l&agrave; những loại c&oacute; diện mạo giống như ch&oacute; s&oacute;i với phần cơ thể ph&iacute;a tr&ecirc;n khỏe mạnh, đ&ocirc;i tai nhọn đồng nghĩa với một t&acirc;m tr&iacute; sắc b&eacute;n v&agrave; sẵn s&agrave;ng l&agrave;m việc. Năm 1889, &ocirc;ng mua một con ch&oacute; chăn cừu rất hợp với l&yacute; tưởng của m&igrave;nh rồi sau đ&oacute; &ocirc;ng đổi t&ecirc;n cho con ch&oacute; từ Hektor Linkrshein th&agrave;nh Horand von Garfrath v&agrave; đăng k&yacute; cho n&oacute; như một con ch&oacute; đầu ti&ecirc;n của giống ch&oacute; b&eacute;c gi&ecirc; Đức. C&ugrave;ng năm đ&oacute;, hiệp hội ch&oacute; GSD được th&agrave;nh lập bởi Stephanitz v&agrave; Artur Meyer nhằm cải tiến c&aacute;c ti&ecirc;u chuẩn cho giống GSD.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Đ&atilde; c&oacute; nhiều tranh luận li&ecirc;n quan đến việc c&oacute; bao nhi&ecirc;u phần &ldquo;s&oacute;i&rdquo; trong m&aacute;u của giống ch&oacute; b&eacute;c gi&ecirc; Đức n&agrave;y. Người ta n&oacute;i rằng Horan l&agrave; một phần của con s&oacute;i v&agrave; rằng Stephanitz đ&atilde; d&ugrave;ng ch&oacute; s&oacute;i trong khi lai tạo. Trong cuốn s&aacute;ch phối giống của Stephanitz c&oacute; viết rằng: đ&atilde; c&oacute; 4 con ch&oacute; s&oacute;i được sử dụng để lai tạo tại c&aacute;c thời điểm kh&aacute;c nhau trong qu&aacute; tr&igrave;nh ph&aacute;t triển của giống ch&oacute; Becgie Đức. Tuy nhi&ecirc;n, theo một số người th&igrave; v&agrave;o thời điểm đ&oacute; nhiều nh&agrave; lai tạo thường sử dụng thuật ngữ &ldquo;con s&oacute;i&rdquo; để kh&aacute;i qu&aacute;t, m&ocirc; tả một m&ocirc; h&igrave;nh m&agrave; hiện nay được gọi l&agrave; &ldquo;sable&rdquo;. C&aacute;c &yacute; kiến kh&aacute;c lại cho rằng, nếu Stephanitz đ&atilde; sử dụng gen s&oacute;i tinh khiết th&igrave; &ocirc;ng rất c&oacute; thể đ&atilde; sử dụng nguồn gen ch&oacute; s&oacute;i từ c&aacute;c sở th&uacute; l&agrave;m vật liệu lai tạo. V&agrave;o năm 1923 khi Stephanitz đang viết cuốn s&aacute;ch của m&igrave;nh, trong c&aacute;c từ cũng như c&aacute;c bức tranh trong cuốn s&aacute;ch, &ocirc;ng nhấn mạnh việc kh&ocirc;ng sử dụng những con s&oacute;i cho việc lai tạo giống.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Từ đầu đến cuối của qu&aacute; tr&igrave;nh lai tạo, Stephanitz lu&ocirc;n tập trung v&agrave;o sức mạnh, tr&iacute; th&ocirc;ng minh v&agrave; khả năng l&agrave;m việc tốt với mọi người của GSD, v&agrave; &ocirc;ng đ&atilde; rất th&agrave;nh c&ocirc;ng khi ng&agrave;y c&agrave;ng c&oacute; nhiều con ch&oacute; b&eacute;c gi&ecirc; Đức hội tụ đầy đủ c&aacute;c ưu điểm như tr&ecirc;n. Trong thế chiến thứ I, nhiều quốc gia đ&atilde; lựa chọn giống ch&oacute; n&agrave;y để l&agrave;m nhiệm vụ như một l&iacute;nh canh. Đồng thời, c&aacute;c CLB ch&oacute; giống của Mỹ (AKC) cũng đ&atilde; chọn lọc, nh&acirc;n giống v&agrave; thay đổi t&ecirc;n cho GSD từ &ldquo;German Sheepdog&rdquo; th&agrave;nh &ldquo;Shepherd Dog&rdquo;. Trong khi đ&oacute;, nước Anh lại thay đổi t&ecirc;n cho giống ch&oacute; n&agrave;y th&agrave;nh Alsatian Wolfdog sau khi đ&atilde; nỗ lực lai tạo v&agrave; t&aacute;ch d&ograve;ng ri&ecirc;ng cho những con ch&oacute; n&agrave;y từ giống GSD gốc ở Đức</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Đến năm 1931, c&aacute;c AKC lại quay trở lại với t&ecirc;n gốc của giống ch&oacute; n&agrave;y l&agrave; GSD. Kể từ đ&oacute;, GSD bắt đầu nổi tiếng thậm ch&iacute; c&ograve;n l&ecirc;n cả m&agrave;n bạc. Đồng thời, giống ch&oacute; Becgie Đức cũng đ&atilde; trở th&agrave;nh &ldquo;trụ cột&rdquo; trong c&aacute;c gia đ&igrave;nh người Mỹ - duy tr&igrave; vị tr&iacute; l&agrave; một trong 10 giống ch&oacute; phổ biến nhất ở Mỹ, thậm ch&iacute; đứng ở vị tr&iacute; số 1 tại nhiều th&agrave;nh phố của Mỹ.</p>', 1)
INSERT [dbo].[GiongThuCung] ([IdGiongThuCung], [TenGiongThuCung], [GioiThieu], [HinhAnh], [DacDiem], [TinhCach], [CachChamSoc], [LuuYSucKhoe], [LichSu], [TrangThai]) VALUES (2, N'Dalmantian - Giống chó đốm nổi tiếng', N'<p style="text-align: center;"><span style="color: #333333; font-family: arial; font-size: 15px; text-align: justify;">Dalmantian hay c&ograve;n gọi l&agrave;&nbsp;</span><strong style="color: #333333; font-family: arial; font-size: 15px; text-align: justify;">ch&oacute; đốm</strong><span style="color: #333333; font-family: arial; font-size: 15px; text-align: justify;">&nbsp;l&agrave; một giống ch&oacute; nổi tiếng, nhất l&agrave; bộ l&ocirc;ng m&agrave;u đốm đen trắng đặc biệt của n&oacute;. Trong lịch sử, n&oacute; được biết đến như một ch&uacute; ch&oacute; vận chuyển, đ&acirc;y l&agrave; một ch&uacute; ch&oacute; v&ocirc; c&ugrave;ng hiếu động , khỏe mạnh v&agrave; nhanh nhẹn. C&oacute; thể n&oacute;i, n&oacute; l&agrave; một trong những giống ch&oacute; chạy nhanh hiếm c&oacute;, c&oacute; l&uacute;c n&oacute; c&ograve;n chạy đua với ngựa. Bởi thế m&agrave; Dalmantian (</span><strong style="color: #333333; font-family: arial; font-size: 15px; text-align: justify;">ch&oacute; đốm</strong><span style="color: #333333; font-family: arial; font-size: 15px; text-align: justify;">) rất th&iacute;ch hợp cho những người y&ecirc;u ch&oacute; v&agrave; c&oacute; nhiều thời gian d&agrave;nh cho ch&uacute;ng.</span></p>', N'Dalmatian-184020408.jpg', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong>Đặc điểm ngoại h&igrave;nh của giống ch&oacute; đốm (Dalmantian)</strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Dalmantian (Ch&oacute; đốm) l&agrave; một lo&agrave;i rất th&ocirc;ng minh v&agrave; c&oacute; t&iacute;nh cảnh gi&aacute;c rất cao c&ugrave;ng với một bộ l&ocirc;ng ngắn v&agrave; b&oacute;ng mượt; Bộ l&ocirc;ng đốm đặc biệt của n&oacute; cũng l&agrave; một đặc điểm v&ocirc; c&ugrave;ng nổi tiếng. Tuy nhi&ecirc;n, những ch&uacute; ch&oacute; đốm c&oacute; c&aacute;c mảng m&agrave;u l&ocirc;ng đồng nhất (kh&ocirc;ng đốm đều) th&igrave; kh&ocirc;ng được đ&aacute;nh gi&aacute; cao so với những ch&uacute; c&oacute; bộ l&ocirc;ng như trong ti&ecirc;u chuẩn giống chung của Dalmantian. Dalmantian cũng sở hữu một d&aacute;ng dấp thể thao với bộ xương chắc khỏe, cơ thể c&acirc;n đối mang lại cho n&oacute; một sức chịu đựng dẻo dai v&agrave; một sức khỏe ổn định. Một Dalmantian thường c&oacute; bộ l&ocirc;ng với nền l&agrave; m&agrave;u trắng v&agrave; c&aacute;c đốm nhỏ l&agrave; m&agrave;u đen hoặc n&acirc;u.</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong><span style="font-size: 12pt;"><span style="color: #000000;">T&iacute;nh c&aacute;ch của giống ch&oacute; đốm</span></span></strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Sự h&aacute;o hức v&agrave; vui tươi của người bạn đồng h&agrave;nh n&agrave;y n&ecirc;n được hạn chế trong một khu vực an to&agrave;n v&agrave; tốt hơn hết l&agrave; n&ecirc;n trong tầm kiểm so&aacute;t của con người v&igrave; n&oacute; thường rất hay đi lang thang, thậm ch&iacute; n&oacute; c&oacute; thể chạy xa h&agrave;ng c&acirc;y số rồi mới dừng lại v&igrave; mệt mỏi. Mặc d&ugrave; ch&oacute; đốm kh&aacute; d&egrave; dặt với người lạ v&agrave; dữ dằn với những ch&uacute; ch&oacute; lạ nhưng n&oacute; lại thường tỏ ra rất th&acirc;n thiện với những con ngựa v&agrave; một số vật nu&ocirc;i kh&aacute;c. Dalmantian cũng c&oacute; thể rất nghịch ngợm v&agrave; s&ocirc;i nổi với trẻ nhỏ</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong>Chăm s&oacute;c những ch&oacute; ch&oacute; đốm</strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Chỉ đi dạo bộ với d&acirc;y x&iacute;ch trong cổ kh&ocirc;ng đủ để đ&aacute;p ứng cho việc r&egrave;n luyện th&acirc;n thể của Dalmantian (Ch&oacute; đốm). Thay v&agrave;o đ&oacute;, phải l&agrave; chạy bộ hoặc l&agrave; những tr&ograve; chơi thể chất vất vả mới c&oacute; thể gi&uacute;p n&oacute; giữ được sự mạnh mẽ v&agrave; dẻo dai vốn c&oacute;. N&oacute; l&agrave; một người bạn chạy bộ v&ocirc; c&ugrave;ng tuyệt vời.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Kh&aacute;c với những ch&uacute; ch&oacute; kh&aacute;c, ch&uacute;ng ta thường kh&ocirc;ng mất qu&aacute; nhiều thời gian để chăm s&oacute;c cho bộ l&ocirc;ng của Dalmantian. Để gi&uacute;p cho ch&uacute; Dalmantian của bạn lu&ocirc;n vui vẻ, thoải m&aacute;i, bạn chỉ cần cung cấp cho ch&uacute;ng một chiếc giường &ecirc;m &aacute;i, chỗ ở sạch sẽ, v&agrave; đương nhi&ecirc;n l&agrave; kh&ocirc;ng thể thiếu được t&igrave;nh y&ecirc;u cũng như sự đồng h&agrave;nh của bạn c&ugrave;ng với n&oacute;. Ch&oacute; đốm c&oacute; thể sống trong nh&agrave; hay ngo&agrave;i trời nhưng chỉ ở v&ugrave;ng kh&iacute; hậu ấm &aacute;p hoặc &ocirc;n đới.</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong>Sức khỏe của những ch&uacute; ch&oacute; đốm</strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Dalmantian c&oacute; tuổi thọ trung b&igrave;nh từ 12-14 năm. N&oacute; c&oacute; thể mắc một số vấn đề về sức khỏe ở tuổi trưởng th&agrave;nh như: suy tuyến gi&aacute;p, dị ứng, loạn sản cơ v&ograve;ng mắt, co giật. Hay một số bệnh nghi&ecirc;m trọng như: điếc, nhiễm tr&ugrave;ng đường tiểu, loạn sản xương h&ocirc;ng, sỏi tiết niệu.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Để x&aacute;c định ch&iacute;nh x&aacute;c vấn đề của một ch&uacute;&nbsp;<strong>ch&oacute; đốm</strong>, một b&aacute;c sỹ th&uacute; y cần kiểm tra kỹ tuyến gi&aacute;p, mắt, xương h&ocirc;ng.</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong><span style="color: #000000; font-size: 12pt;">Lịch sử của giống ch&oacute; đốm</span></strong><span style="color: #000000; font-size: 11pt;"><br /></span></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;Mặc d&ugrave; nguồn gốc của &ldquo;chiếc &aacute;o kho&aacute;c độc đ&aacute;o&rdquo; của Dalmantian đến nay vẫn c&ograve;n l&agrave; một b&iacute; ẩn nhưng n&oacute; vẫn được biết đến l&agrave; một trong những giống ch&oacute; c&oacute; bộ l&ocirc;ng đẹp mắt nhất. Những bức tranh vẽ về Dalmantian đ&atilde; được t&igrave;m thấy trong nhiều thế kỷ qua. Trong đ&oacute; c&oacute; một bức b&iacute;ch họa từ năm 1360 hiện vẫn được cất giữ tại lễ đường Spanish l&agrave; một phần của nh&agrave; thờ Santa Maria Novella ở Florence, Italy.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Ch&uacute; ch&oacute; trong bức b&iacute;ch họa kia được cho l&agrave; tổ ti&ecirc;n của Dalmantian v&agrave; rất c&oacute; thể, n&oacute; ch&iacute;nh l&agrave; ch&uacute; ch&oacute; chỉ điểm của giống&nbsp;<strong>ch&oacute; đốm</strong>&nbsp;ng&agrave;y nay. Trong khi đ&oacute;, n&oacute; kh&ocirc;ng c&oacute; nguồn gốc ở Dalmantia &ndash; một khu vực ph&iacute;a nam tại Croatia &ndash; cũng l&agrave; một địa danh c&oacute; t&ecirc;n giống với t&ecirc;n của giống ch&oacute; n&agrave;y. Ngay cả chức năng ban đầu của n&oacute; l&agrave; g&igrave; cũng &iacute;t ai biết đến nhưng giống ch&oacute; n&agrave;y c&oacute; thể c&oacute; nhiều hơn 1 vai tr&ograve;. Trong suốt những năm qua, n&oacute; giữ vai tr&ograve; như một người chăn cừu, một người l&iacute;nh trong chiến tranh, một ch&uacute; ch&oacute; chỉ điểm, một ch&uacute; ch&oacute; săn, một ch&uacute; ch&oacute; k&eacute;o xe, một ch&uacute; ch&oacute; theo d&otilde;i v&agrave; một diễn vi&ecirc;n xiếc.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Tại nước Anh v&agrave;o thời nữ ho&agrave;ng Victoria, c&aacute;c Dalmatian c&ugrave;ng một l&uacute;c đảm tr&aacute;ch hai nhiệm vụ l&agrave; biểu diễn v&agrave; hộ vệ &ndash; hộ vệ cho những cỗ xe ngựa k&eacute;o. Những ch&uacute; ch&oacute; chạy lon ton ở ph&iacute;a trước, b&ecirc;n cạnh hoặc dưới c&aacute;c trục b&aacute;nh xe của c&aacute;c huấn luyện vi&ecirc;n. Đến nay, đ&atilde; c&oacute; bằng chứng cho rằng vai tr&ograve; huấn luyện của Dalmantian l&agrave; một yếu tố di truyền. Sự ra đời của &ocirc; t&ocirc; đ&atilde; l&agrave;m mờ đi vai tr&ograve; của Dalmantian trong x&atilde; hội v&agrave; sau đ&oacute; n&oacute; tiếp tục l&agrave;m việc như một b&ugrave;a hộ mệnh cho l&iacute;nh cứu hỏa. Ch&uacute; ch&oacute; giống đầu ti&ecirc;n được đăng k&yacute; với hiệp hội ch&oacute; giống Mỹ l&agrave; v&agrave;o năm 1988, sau đ&oacute; CLB Dalmantian của Mỹ được th&agrave;nh lập năm 1905.</p>', 1)
INSERT [dbo].[GiongThuCung] ([IdGiongThuCung], [TenGiongThuCung], [GioiThieu], [HinhAnh], [DacDiem], [TinhCach], [CachChamSoc], [LuuYSucKhoe], [LichSu], [TrangThai]) VALUES (18, N'Alaskan Klee Kai - Phiên bản thu nhỏ của Husky', N'<p style="text-align: center;"><span style="color: #333333; font-family: arial; font-size: 14.6667px; text-align: justify;">Alaskan Klee Kai được ph&aacute;t triển thời gian kh&aacute; gần đ&acirc;y bởi một người phụ nữ ở Alaska &ndash; người đ&atilde; rất ấn tượng với 1 ch&uacute; ch&oacute; giống y như một ch&uacute; Husky thu nhỏ. Sau một thời gian lai tạo v&agrave; th&uacute;c đẩy sự ph&aacute;t triển của d&ograve;ng ch&oacute; nhỏ n&agrave;y, c&ocirc; đ&atilde; đạt được 1 số th&agrave;nh c&ocirc;ng nhất định khi Alaskan Klee Kai ng&agrave;y c&agrave;ng trở n&ecirc;n nổi tiếng. Tuy nhi&ecirc;n, n&oacute; vẫn thuộc một giống ch&oacute; hiếm gặp.</span></p>', N'Alaskan-kl184341300.jpg', N'<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><span style="font-size: 11pt;">Thường được gọi l&agrave; một Husky thu nhỏ, Alaskan Klee Kai l&agrave; một giống ch&oacute; c&oacute; k&iacute;ch thước trung b&igrave;nh với những đặc điểm về ngoại h&igrave;nh rất giống</span></p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><span style="font-size: 11pt;">Siberian Husky. Điểm hấp dẫn nhất của giống Klee Kai ch&iacute;nh l&agrave; khu&ocirc;n mặt (tương tự như c&aacute;c dấu hiệu nh&igrave;n thấy tr&ecirc;n khu&ocirc;n mặt Husky). Alaskan Klee Kai l&agrave; 1 giống th&uacute; cảnh nhỏ c&oacute; trọng lượng 2-10 kg v&agrave; cao khoảng 33-43 cm.</span></p>', N'<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><strong><span style="font-size: 12pt;">T&iacute;nh c&aacute;ch.</span></strong></p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><span style="font-size: 11pt;">Alaskan Klee Kai l&agrave; một giống ch&oacute; nhỏ rất t&igrave;nh cảm. Ch&uacute;ng cũng l&agrave; một vật nu&ocirc;i đ&aacute;ng y&ecirc;u v&agrave; trung th&agrave;nh trong gia đ&igrave;nh. Alaskan klee kai kh&aacute; thận trọng với người lạ v&agrave; trẻ nhỏ, v&igrave; vậy tốt nhất h&atilde;y cho n&oacute; l&agrave;m quen với cuộc sống c&ugrave;ng con người từ khi n&oacute; c&ograve;n b&eacute;. C&aacute;c Klee Kai c&ograve;n l&agrave; những ch&uacute; ch&oacute; canh g&aacute;c rất tốt v&igrave; ch&uacute;ng lu&ocirc;n lu&ocirc;n rất cảnh gi&aacute;c.</span></p>', N'<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><strong><span style="font-size: 12pt;">Chăm s&oacute;c</span></strong></p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><span style="font-size: 11pt;">Alaskan Klee Kai l&agrave; một giống ch&oacute; ưu hoạt động n&ecirc;n ch&uacute;ng đ&ograve;i hỏi phải c&oacute; một chế độ tập luyện th&iacute;ch hợp hằng ng&agrave;y v&agrave; tốt nhất l&agrave; bạn n&ecirc;n chuẩn bị cho n&oacute; một mảnh s&acirc;n rộng với h&agrave;ng r&agrave;o chắc chắn xung quanh.</span></p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><span style="font-size: 11pt;">Ngo&agrave;i tập thể dục ra th&igrave; bộ l&ocirc;ng 2 lớp của n&oacute; cũng ti&ecirc;u tốn của bạn một khoảng thời gian nhất định cho việc chải chuốt, cắt tỉa gọn g&agrave;ng.</span></p>', N'<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><strong><span style="font-size: 12pt;">Sức khỏe</span></strong></p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><span style="font-size: 11pt;">Tuổi thọ trung b&igrave;nh của giống ch&oacute; n&agrave;y l&agrave; khoảng 10 đến 13 năm. Mặc d&ugrave; Alaskan Klee Kai n&oacute;i chung l&agrave; kh&ocirc;ng gặp nhiều vấn đề sức khỏe li&ecirc;n quan đến&nbsp;di truyền nhưng n&oacute; lại thường mắc một số bệnh như đục thủy tinh thể, bệnh gan, sai khớp xương b&aacute;nh ch&egrave;, c&aacute;c vấn đề về tim v&agrave; bệnh li&ecirc;n quan đến tuyến gi&aacute;p.</span></p>', N'<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><span style="font-size: 12pt;"><strong>Lịch sử v&agrave; bối cảnh</strong></span></p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;"><span style="font-size: 11pt;">L&agrave; một giống ch&oacute; mới ph&aacute;t triển gần đ&acirc;y, Alaskan Klee Kai được ghi ch&eacute;p rất chi tiết về nguồn gốc của n&oacute;. Trong những năm 1970, một người phụ nữ t&ecirc;n l&agrave; Linda Alaskan Spurlin trong một lần đến Oklahoma đ&atilde; t&igrave;nh cờ bắt gặp một ch&uacute; ch&oacute; nhỏ tr&ocirc;ng kh&ocirc;ng kh&aacute;c g&igrave; một ch&uacute; Husky Siberian. Sau đ&oacute;, v&igrave; y&ecirc;u th&iacute;ch m&agrave; b&agrave; nảy ra &yacute; định ph&aacute;t triển những ch&uacute; ch&oacute; nhỏ n&agrave;y th&agrave;nh một giống ri&ecirc;ng biệt d&agrave;nh cho những người muốn c&oacute; một ch&uacute; Husky nhưng lại kh&ocirc;ng đủ điều kiện để cho ch&uacute;ng ph&aacute;t triển. Rồi b&agrave; trở về Alaskan v&agrave; thực hiện &yacute; định của m&igrave;nh.</span></p>', 1)
INSERT [dbo].[GiongThuCung] ([IdGiongThuCung], [TenGiongThuCung], [GioiThieu], [HinhAnh], [DacDiem], [TinhCach], [CachChamSoc], [LuuYSucKhoe], [LichSu], [TrangThai]) VALUES (19, N'Giống chó Phú Quốc - giống chó đẹp của thế giới', N'<p style="text-align: center;"><span style="color: #333333; font-family: arial; font-size: 15px; text-align: justify;">Ch&oacute; Ph&uacute; Quốc l&agrave; một loại ch&oacute; ri&ecirc;ng của đảo Ph&uacute; Quốc, Việt Nam. N&oacute; l&agrave; giống ch&oacute; rất th&ocirc;ng minh, trung th&agrave;nh v&agrave; l&agrave; niềm tự h&agrave;o của người d&acirc;n đảo Ph&uacute; Quốc n&oacute;i ri&ecirc;ng v&agrave; của người d&acirc;n Việt Nam n&oacute;i chung. Giống ch&oacute; Ph&uacute; Quốc c&oacute; đặc điểm ph&acirc;n biệt với c&aacute;c loại ch&oacute; kh&aacute;c l&agrave; c&aacute;c xo&aacute;y l&ocirc;ng ở tr&ecirc;n sống lưng. N&oacute; l&agrave; một trong ba d&ograve;ng ch&oacute; c&oacute; xo&aacute;y l&ocirc;ng tr&ecirc;n lưng tr&ecirc;n thế giới. Hai loại ch&oacute; l&ocirc;ng xo&aacute;y ở lưng c&ograve;n lại l&agrave; ch&oacute; l&ocirc;ng xo&aacute;y Rhodesia v&agrave; ch&oacute; l&ocirc;ng xo&aacute;y Th&aacute;i.</span></p>', N'giong-cho-184904287.jpg', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong>Đặc&nbsp;điểm cơ thể của guống ch&oacute; Ph&uacute; Quốc</strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">L&agrave; giống ch&oacute; nổi tiếng tinh kh&ocirc;n với điểm đặc trưng dễ ph&acirc;n biệt: tr&ecirc;n lưng c&oacute; những v&ograve;ng xo&aacute;y chạy thẳng một đường, bắt đầu từ vai đến xương khu. L&uacute;c chạy theo con mồi hoặc gặp đối thủ th&igrave; những v&ograve;ng xo&aacute;y n&agrave;y sẽ dựng đứng l&ecirc;n tr&ocirc;ng rất dũng m&atilde;nh. Ch&oacute; chạy nhanh như s&oacute;c, bơi lội giỏi như r&aacute;i c&aacute;, trung th&agrave;nh, tinh kh&ocirc;n, c&oacute; thể nghe v&agrave; hiểu được lệnh của chủ.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Ch&oacute; Ph&uacute; Quốc biết đ&agrave;o hang để đẻ v&agrave; c&oacute; biệt t&agrave;i săn th&uacute;, bơi dưới nước giỏi như r&aacute;i c&aacute; nhờ ch&acirc;n c&oacute; m&agrave;ng như ch&acirc;n vịt v&agrave; bộ l&ocirc;ng mượt s&aacute;t (1-2 cm) rất ngắn n&ecirc;n khi ướt ch&oacute; Ph&uacute; Quốc chỉ cần lắc m&igrave;nh v&agrave;i lượt nước sẽ bắn đi do đ&oacute; sẽ mau kh&ocirc;. Hiện ch&oacute; xo&aacute;y Ph&uacute; Quốc đ&atilde; được thuần dưỡng như vật nu&ocirc;i. Nhưng người d&acirc;n tr&ecirc;n đảo Ph&uacute; Quốc vẫn th&iacute;ch những ch&oacute; xo&aacute;y được sinh ra trong hang, v&igrave; họ tin như vậy mới đ&uacute;ng loại ch&oacute; xo&aacute;y Ph&uacute; Quốc.</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;">T&iacute;nh c&aacute;ch đặc trưng<strong>&nbsp;của guống ch&oacute; Ph&uacute; Quốc</strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Ch&uacute;ng c&oacute; nhiều biệt t&agrave;i so với c&aacute;c lo&agrave;i ch&oacute; kh&aacute;c. Qu&acirc;n đội nh&agrave; Nguyễn đ&atilde; d&ugrave;ng ch&oacute; Ph&uacute; Quốc l&agrave;m qu&acirc;n khuyển v&igrave; ch&oacute; Ph&uacute; Quốc khi x&aacute;c định được l&atilde;nh địa th&igrave; l&agrave;m chủ ho&agrave;n to&agrave;n l&atilde;nh địa của m&igrave;nh. Kh&ocirc;ng c&oacute; bất cứ một người lạ, vật lạ n&agrave;o rơi v&agrave;o phạm vi l&atilde;nh địa của ch&uacute;ng m&agrave; ch&uacute;ng kh&ocirc;ng ph&aacute;t hiện.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Ch&oacute; Ph&uacute; Quốc dễ l&agrave;m quen với người. Khi gặp bất kể người th&acirc;n hay sơ, ch&uacute;ng đều vẫy đu&ocirc;i mừng rối r&iacute;t. Người lạ thường c&oacute; thể sờ m&oacute; con ch&oacute; m&agrave; kh&ocirc;ng bị cắn. Đ&acirc;y l&agrave; nhược điểm của những ch&oacute; xo&aacute;y trong việc giữ nh&agrave;.</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong>C&aacute;ch chăm s&oacute;c của giống ch&oacute; Ph&uacute; Quốc</strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Ch&oacute; Ph&uacute; Quốc l&agrave; lo&agrave;i ch&oacute; c&oacute; &ldquo;h&agrave;m lượng&rdquo; hoang d&atilde; kh&aacute; cao, cả trong cơ thể lẫn trong t&iacute;nh c&aacute;ch. Bởi vậy m&agrave; n&oacute; thường dế mắc bệnh khi thay đổi m&ocirc;i trường sống, tuy nhi&ecirc;n khi mắc bệnh n&oacute; thường c&oacute; khả năng tự khỏi m&agrave; kh&ocirc;ng cần bất kỳ can thiệp n&agrave;o của con người nếu n&oacute; được sống trong m&ocirc;i trường th&iacute;ch hợp</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong>Sức khỏe của giống ch&oacute; Ph&uacute; Quốc</strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Ch&oacute; Ph&uacute; Quốc thường bị bệnh đường ruột, nhất l&agrave; khi thay đổi m&ocirc;i trường sống. v&igrave; thế khi đưa về đất liền tỷ lệ chết cũng kh&aacute; cao nếu như ch&uacute;ng ta kh&ocirc;ng biết c&aacute;ch chăm s&oacute;c cũng như kh&ocirc;ng thể mang lại một kh&ocirc;ng gian sống ph&ugrave; hợp với n&oacute;.</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong>Lịch sử của giống ch&oacute; Ph&uacute; Quốc</strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">trong d&acirc;n gian Việt Nam, ch&oacute; Ph&uacute; Quốc được coi l&agrave; "vương khuyển" v&igrave; trong lịch sử đ&atilde; từng c&oacute; 4 con ch&oacute; Ph&uacute; Quốc được vua Gia Long sắc phong một c&aacute;ch trang trọng, kh&ocirc;ng k&eacute;m những c&ocirc;ng thần khai quốc của nh&agrave; Nguyễn.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Bốn con ch&oacute; Ph&uacute; Quốc (2 đực, 2 c&aacute;i) được vua Gia Long nu&ocirc;i v&agrave; đ&atilde; theo &ocirc;ng suốt những năm b&ocirc;n tẩu. Trong s&aacute;ch "Nguyễn Ph&uacute;c tộc đế phả tường giải đồ", cuốn s&aacute;ch gia truyền ghi ch&eacute;p v&agrave; l&yacute; giải tất cả những chuyện li&ecirc;n quan đến ho&agrave;ng tộc, đ&atilde; ghi r&otilde; về 4 con ch&oacute; n&agrave;y, kh&ocirc;ng những về chiến c&ocirc;ng m&agrave; c&ograve;n m&ocirc; tả kỹ c&agrave;ng về đặc t&iacute;nh của ch&oacute; Ph&uacute; Quốc. C&aacute;c ch&uacute; ch&oacute; Ph&uacute; Quốc n&agrave;y đ&atilde; cứu nguy cho vua Gia Long 2 lần tho&aacute;t chết trước khi l&ecirc;n ng&ocirc;i. Ch&uacute;ng giải v&acirc;y cho &ocirc;ng tho&aacute;t khỏi sự truy đuổi của qu&acirc;n T&acirc;y Sơn v&agrave; bảo vệ cho &ocirc;ng tho&aacute;t nạn.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<div class="moduletable" style="color: #333333; font-family: arial; font-size: 15px;">
<div class="custom">&nbsp;</div>
</div>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Sau khi l&ecirc;n ng&ocirc;i, vua Gia Long khi b&igrave;nh c&ocirc;ng phong thưởng cho tướng sĩ, đ&atilde; kh&ocirc;ng qu&ecirc;n sắc phong cho 4 con ch&oacute; Ph&uacute; Quốc danh hiệu: "Cứu khổn ph&ograve; nguy T&aacute; quốc hu&acirc;n thần Thần khuyển đại tướng qu&acirc;n". Đến khi 4 con ch&oacute; qua đời, &ocirc;ng đ&atilde; cho an t&aacute;ng v&agrave; lập miếu thờ trọng thể. Ng&agrave;y 14 th&aacute;ng 12 năm 2008, Hiệp hội ch&oacute; giống quốc gia Việt Nam (VKC) đ&atilde; ch&iacute;nh thức đăng k&yacute; giống ch&oacute; Ph&uacute; Quốc với Hiệp hội ch&oacute; giống quốc tế để được thế giới c&ocirc;ng nhận.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Ng&agrave;y 5 th&aacute;ng 07 năm 2011, lần đầu ti&ecirc;n ch&oacute; Ph&uacute; Quốc đ&atilde; được đưa sang Paris để tham dự FCI World dog show 2011 - cuộc thi ch&oacute; đẹp thế giới năm 2011. Tại đ&acirc;y, ch&oacute; Ph&uacute; Quốc đ&atilde; đoạt giải CACS (chứng chỉ ch&oacute; đẹp cấp thế giới, c&oacute; thể gọi l&agrave; "V&ocirc; địch thế giới ch&oacute; Ph&uacute; Quốc năm 2011").</p>', 1)
INSERT [dbo].[GiongThuCung] ([IdGiongThuCung], [TenGiongThuCung], [GioiThieu], [HinhAnh], [DacDiem], [TinhCach], [CachChamSoc], [LuuYSucKhoe], [LichSu], [TrangThai]) VALUES (20, N'Pug - Giống chó có ngoại hình đặc biệt nhất trên thế giới', N'<p style="text-align: center;"><span style="color: #333333; font-family: arial; font-size: 15px; text-align: justify;">Với biệt danh l&agrave; &ldquo;Dutch mastiff&rdquo;, Pug l&agrave; một giống ch&oacute; nhỏ c&oacute; khu&ocirc;n mặt nhăn nheo, đ&ocirc;i ch&acirc;n ngắn v&agrave; ngực rộng. Ngo&agrave;i việc l&agrave; giống ch&oacute; c&oacute; ngoại h&igrave;nh đặc biệt nhất trong nhiều giống tr&ecirc;n thế giới, c&aacute;c ch&uacute;&nbsp;</span></p>', N'images-(4)182655064.jpg', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong>Đặc điểm của giống ch&oacute; Pug</strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Những biểu hiện như sự chăm ch&uacute; hay sự mềm mại của Pug ch&iacute;nh l&agrave; đặc điểm ph&acirc;n biệt của n&oacute; với c&aacute;c giống ch&oacute; kh&aacute;c. N&oacute; sở hữu một bộ l&ocirc;ng kh&aacute; đẹp mắt, ngắn, mịn m&agrave;ng v&agrave; thường c&oacute; m&agrave;u n&acirc;u v&agrave;ng hoặc m&agrave;u đen. Với th&acirc;n h&igrave;nh nhỏ gọn, vu&ocirc;ng c&acirc;n đối, Pug sở hữu một d&aacute;ng đi rất vui vẻ, mạnh mẽ; khi đi, ch&acirc;n sau của n&oacute; lắc nhẹ tạo th&agrave;nh một d&aacute;ng đi lắc lư tr&ocirc;ng rất đ&aacute;ng y&ecirc;u. Những mảng l&ocirc;ng đen tr&ecirc;n sống mũi, tai, m&aacute; v&agrave; c&aacute;c nếp nhăn s&acirc;u, lớn tr&ecirc;n tr&aacute;n l&agrave; những ti&ecirc;u chuẩn giống gốc của Pug.</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong>T&iacute;nh c&aacute;ch của giống ch&oacute; Pug</strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Pug l&agrave; một người bạn đồng h&agrave;nh vui tươi, h&agrave;i hước, tự tin v&agrave; th&acirc;n thiện nhưng cũng kh&ocirc;ng k&eacute;m phần lộng lẫy. B&igrave;nh thường, Pug kh&aacute; th&acirc;n thiện v&agrave; lu&ocirc;n l&agrave;m bạn h&agrave;i l&ograve;ng tuy nhi&ecirc;n c&oacute; những l&uacute;c n&oacute; cũng kh&aacute; bướng bỉnh v&agrave; ki&ecirc;n quyết. Pug cũng được biết đến như một ch&uacute; c&uacute;n cưng để vui đ&ugrave;a v&agrave; l&agrave; niềm tự h&agrave;o của những người chủ.</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong>Chăm s&oacute;c giống ch&oacute; Pug</strong></h2>
<p style="margin: 0px 0px 2px 3px; font-size: 15px; font-weight: 400;">Bạn kh&ocirc;ng cần phải tốn qu&aacute; nhiều c&ocirc;ng sức với bộ l&ocirc;ng của Pug, chỉ cần chải l&ocirc;ng thường xuy&ecirc;n để loại bỏ lớp l&ocirc;ng chết cho n&oacute; l&agrave; được. Nhưng ngược lại, bạn cần thường xuy&ecirc;n l&agrave;m sạch v&agrave; sấy kh&ocirc; cho bộ da của Pug nhằm ngăn ngừa nhiễm tr&ugrave;ng da đặc biệt l&agrave; c&aacute;c nếp nhăn tr&ecirc;n khu&ocirc;n mặt của n&oacute;.</p>
<p style="margin: 0px 0px 2px 3px; font-size: 15px; font-weight: 400;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; font-size: 15px; font-weight: 400;">Đối với nhu cầu về việc tập thể dục, bạn c&oacute; thể dẫn Pug đi dạo bộ với d&acirc;y x&iacute;ch vừa phải hay cho ch&uacute;ng chơi một tr&ograve; chơi cần vận động nhiều trong tầm kiểm so&aacute;t của m&igrave;nh l&agrave; được. Pug rất nhạy cảm với độ ẩm v&agrave; nhiệt độ n&ecirc;n tốt nhất bạn n&ecirc;n giữ Pug trong nh&agrave;. Một điểm cần lưu &yacute; kh&aacute;c nữa l&agrave; Pug rất dễ ng&aacute;y v&agrave; thở kh&ograve; kh&egrave; v&igrave; chiếc m&otilde;m nhỏ v&agrave; phẳng của n&oacute;.</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong>Sức khỏe của giống ch&oacute; Pug</strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Pug c&oacute; tuổi thọ trung b&igrave;nh từ 12-15 năm v&agrave; rất dễ mắc một số bệnh nghi&ecirc;m trọng như vi&ecirc;m n&atilde;o, loạn sản khớp xương h&ocirc;ng hay c&aacute;c bệnh nhẹ hơn như: v&ograve;m miệng k&eacute;o d&agrave;i, sai khớp xương b&aacute;nh ch&egrave;, hẹp lỗ mũi, quặm, kh&ocirc; mắt, bệnh hemivertebra (Một khiếm khuyết bẩm sinh của cột sống trong đ&oacute; một b&ecirc;n của một đốt sống kh&ocirc;ng ph&aacute;t triển ho&agrave;n to&agrave;n), b&eacute;o ph&igrave;, bệnh tr&ecirc;n da, tho&aacute;i h&oacute;a d&acirc;y thần kinh, co giật, dị ứng.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">C&aacute;c nếp nhăn tr&ecirc;n khu&ocirc;n mặt của Pug phải lu&ocirc;n lu&ocirc;n được giữ sạch nhằm ngăn ngừa t&igrave;nh trạng vi&ecirc;m da nếp gấp &ndash; một dạng vi&ecirc;m da. Ngo&agrave;i ra, đa phần c&aacute;c ch&uacute; Pug cũng kh&aacute; nhạy cảm với nhiệt độ v&agrave; việc g&acirc;y m&ecirc;.</p>', N'<h2 style="margin: 5px 0px 5px 8px; font-family: arial; line-height: 24px; color: #333333; font-size: 18px; text-align: justify;"><strong>Lịch sử giống ch&oacute; Pug</strong></h2>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Multum in Parvo, c&oacute; nghĩa l&agrave; &ldquo;a lot in a little&rdquo; tiếng Việt c&oacute; nghĩa l&agrave; &ldquo;Điều to lớn chứa đựng b&ecirc;n trong c&aacute;i nhỏ b&eacute;&rdquo; &ndash; đ&acirc;y cũng ch&iacute;nh l&agrave; c&acirc;u ch&acirc;m ng&ocirc;n ph&ugrave; hợp nhất với Pug hay n&oacute; như một tả ngắn gọn nhưng đầy đủ v&agrave; ch&iacute;nh x&aacute;c về giống ch&oacute; n&agrave;y. Pug cũng đ&atilde; được gọi bằng rất nhiều t&ecirc;n gọi kh&aacute;c nhau trong nhiều năm qua như Mopshond ở H&agrave; Lan; Pug ở Trung Quốc, H&agrave; Lan, Anh v&agrave; Mops ở Đức. T&ecirc;n gọi &ldquo;Pug&rdquo; được cho l&agrave; bắt nguồn từ chữ Pugnus trong tiếng la tinh, dịch ra c&oacute; nghĩa l&agrave; &ldquo;nắm tay&rdquo; hay &ldquo;giống khỉ b&eacute;&rdquo; (l&agrave; giống khỉ pug nhỏ kh&aacute; giống những ch&uacute; ch&oacute;).</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Mặc d&ugrave; tổ ti&ecirc;n ch&iacute;nh x&aacute;c của Pug kh&ocirc;ng được biết đến nhưng nhiều người đều cho rằng Pug l&agrave; một trong những giống ch&oacute; nhỏ đầu ti&ecirc;n xuất hiện ở ch&acirc;u &Aacute;. Trung Quốc l&agrave; nơi Pug được biết đến đầu ti&ecirc;n, nhất l&agrave; khi ch&uacute;ng được c&aacute;c tu viện phật gi&aacute;o T&acirc;y Tạng coi như một con vật cưng. Người Trung Quốc coi những nếp nhăn tr&ecirc;n khu&ocirc;n mặt của Pug l&agrave; một điều v&ocirc; c&ugrave;ng đặc biệt v&agrave; họ gọi n&oacute; l&agrave; &ldquo;dấu ấn ho&agrave;ng tử&rdquo; v&igrave; những nếp nhăn như một n&eacute;t tương đồng giữa Pug v&agrave; khu&ocirc;n mặt của ho&agrave;ng tử Trung Quốc.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">N&oacute; được mang v&agrave;o H&agrave; Lan bởi c&aacute;c c&ocirc;ng ty thương mại giữa Đ&ocirc;ng Ấn &ndash; H&agrave; Lan. V&agrave;o thời gian đ&oacute;, một ch&uacute; Pug đ&atilde; được William I (l&agrave; ho&agrave;ng th&acirc;n xứ Orange v&agrave;o giữa thế kỷ 16) nhận nu&ocirc;i v&agrave; xem như một con vật cưng. C&aacute;c ch&uacute; Pug cũng đ&atilde; được phong cho những vị tr&iacute; kh&aacute;c nhau trong xứ sở Orange. Rồi n&oacute; ch&iacute;nh thức được lưu lại c&ugrave;ng cuộc đời William I khi n&oacute; cảnh b&aacute;o trước cho nh&agrave; Vua về một cuộc tấn c&ocirc;ng của người t&acirc;y ban nha năm 1572. N&oacute; vẫn được cưng chiều cho đến m&atilde;i sau khi William II hạ được Torbay để được l&ecirc;n ng&ocirc;i vua của nước Anh. Khi Vua William II chết, đo&agrave;n đưa tang của &ocirc;ng bao gồm cả những ch&uacute; Pug &ndash; n&oacute; trở th&agrave;nh biểu tượng thời trang cho c&aacute;c thế hệ.</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Khoảng gần những năm 1790, những ch&uacute; Pug sang Ph&aacute;p (theo một c&aacute;ch n&agrave;o đ&oacute; m&agrave; người ta cũng kh&ocirc;ng x&aacute;c minh được). N&oacute; bắt đầu được để &yacute; đến khi một trong số ch&uacute;ng trở th&agrave;nh vật cưng của ho&agrave;ng hậu Josephine, vợ của vua Napoleon. Cũng ch&iacute;nh Fortune, ch&uacute; Pug của b&agrave; l&agrave; sứ giả truyền tin cho b&agrave; khi b&agrave; bị giam giữ tại nh&agrave; t&ugrave; Les Carmes (Josephine đ&atilde; dấu những bức thư dưới cổ &aacute;o của Fortune).</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">&nbsp;</p>
<p style="margin: 0px 0px 2px 3px; text-align: justify; color: #333333; font-family: arial; font-size: 15px;">Ở Anh, Pug trở n&ecirc;n phổ biến trong thời đại của nữ ho&agrave;ng Victoria. Những ch&uacute; Pug diện chiếc tai được cắt tỉa kỳ c&ocirc;ng l&agrave;m tăng th&ecirc;m hiệu ứng cho sự nhăn nheo của khu&ocirc;n mặt. V&agrave;o năm 1885, Pug được hiệp hội ch&oacute; giống Mỹ c&ocirc;ng nhận v&agrave; kể từ đ&oacute;, n&oacute; kh&ocirc;ng chỉ l&agrave; một ch&uacute; ch&oacute; phổ biến m&agrave; c&ograve;n l&agrave; một ch&uacute; ch&oacute; giữ nh&agrave; tuyệt vời.</p>', 1)
SET IDENTITY_INSERT [dbo].[GiongThuCung] OFF
SET IDENTITY_INSERT [dbo].[HinhAnhSanPham] ON 

INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1, N'12002265_1182715355.png', 5)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (2, N'400_7c2912182715178.jpg', 5)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (3, N'460_d360c2182715325.png', 5)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (4, N'12042887_9182715915.jpg', 5)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (5, N'12742352_9182716052.jpg', 5)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (6, N'15253496_3182716239.jpg', 5)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1008, N'15253496_3182649695.jpg', 2)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1009, N'15268040_3182649697.jpg', 2)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1010, N'dogsmile185448119.jpg', 3)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1011, N'images185448354.jpg', 3)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1015, N'images182226673.jpg', 1004)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1016, N'tải-xuống182226704.jpg', 1004)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1017, N'tải-xuống-182227095.jpg', 1004)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1020, N'images-(3)184629702.jpg', 1)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1021, N'images184629718.jpg', 1)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1022, N'tải-xuống-180237651.jpg', 1005)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1023, N'tải-xuống180237651.jpg', 1005)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1024, N'images180350260.jpg', 1006)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1025, N'dogsmile180350495.jpg', 1006)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1026, N'dogsmile185140867.jpg', 1007)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1027, N'images185140945.jpg', 1007)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1028, N'images-(1)185141117.jpg', 1007)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1029, N'images-(2)185141117.jpg', 1007)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1030, N'images-(4)185141180.jpg', 1007)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1031, N'tải-xuống-185141195.jpg', 1007)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1032, N'images-(3)185141352.jpg', 1007)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1033, N'tải-xuống-185141383.jpg', 1007)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1034, N'tải-xuống185141383.jpg', 1007)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1035, N'download-(185634160.jpg', 1008)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1036, N'download185634160.jpg', 1008)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1037, N'download-(185746488.jpg', 1009)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1038, N'download-(185846394.jpg', 1010)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (1039, N'download185846394.jpg', 1010)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (2042, N'Alaskan-kl185844886.jpg', 4)
INSERT [dbo].[HinhAnhSanPham] ([IdHinhAnh], [LinkHinhAnh], [IdSanPham]) VALUES (2043, N'Dalmatian-185844882.jpg', 4)
SET IDENTITY_INSERT [dbo].[HinhAnhSanPham] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([IdHoaDon], [IdNguoiDung], [TongGia], [NgayLapHoaDon], [TrangThai], [IdShop]) VALUES (5, 4, 423369, CAST(N'2018-07-16' AS Date), 1, 1)
INSERT [dbo].[HoaDon] ([IdHoaDon], [IdNguoiDung], [TongGia], [NgayLapHoaDon], [TrangThai], [IdShop]) VALUES (6, 4, 123369, CAST(N'2018-07-16' AS Date), 1, 1)
INSERT [dbo].[HoaDon] ([IdHoaDon], [IdNguoiDung], [TongGia], [NgayLapHoaDon], [TrangThai], [IdShop]) VALUES (8, 4, 123369, CAST(N'2018-07-16' AS Date), 0, 1)
INSERT [dbo].[HoaDon] ([IdHoaDon], [IdNguoiDung], [TongGia], [NgayLapHoaDon], [TrangThai], [IdShop]) VALUES (11, 4, 123123, CAST(N'2018-07-16' AS Date), 1, 1)
INSERT [dbo].[HoaDon] ([IdHoaDon], [IdNguoiDung], [TongGia], [NgayLapHoaDon], [TrangThai], [IdShop]) VALUES (12, 4, 123123, CAST(N'2018-07-16' AS Date), 0, 1)
INSERT [dbo].[HoaDon] ([IdHoaDon], [IdNguoiDung], [TongGia], [NgayLapHoaDon], [TrangThai], [IdShop]) VALUES (2013, 4, 100246, CAST(N'2018-08-15' AS Date), 1, 1)
INSERT [dbo].[HoaDon] ([IdHoaDon], [IdNguoiDung], [TongGia], [NgayLapHoaDon], [TrangThai], [IdShop]) VALUES (2014, 4, 200000, CAST(N'2018-08-15' AS Date), 1, 1)
INSERT [dbo].[HoaDon] ([IdHoaDon], [IdNguoiDung], [TongGia], [NgayLapHoaDon], [TrangThai], [IdShop]) VALUES (2016, 4, 123, CAST(N'2018-08-15' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[HoatDong] ON 

INSERT [dbo].[HoatDong] ([IdHoatDong], [TenHoatDong], [NgayThang], [MoTa], [NoiDung], [IdCoSoThuY], [TinhTrang], [ImageShow]) VALUES (2, N'Bệnh Viện Thú Y PetCare tiếp tục đầu tư máy móc chẩn đoán hình ảnh', CAST(N'1997-01-01' AS Date), N'Kể từ khi thành lập năm 2005, Bệnh Viện Thú Y PetCare đã đầu tư máy móc thiết bị nhằm phục vụ công tác điều…', N'Chẩn đoán hình ảnh
•   Siêu âm: Đây là phương pháp phổ biến dùng để đánh giá tình trạng sức khỏe vật nuôi và chẩn đoán bệnh trong các trường hợp mang thai, khối u, các bệnh ở vùng bụng và nhiều vấn đề khác.

•   Chụp X-quang: máy X-quang thường được dùng để phát hiện các vấn đề về xương khớp, khối u, các vật thể lạ trong cơ thể như sỏi thận hoặc dị vật đường ruột và chẩn đoán nhiều bệnh khác.

 

sieuam1

  
  
phimxray

 

Các dịch vụ xét nghiệm
•    Xét nghiệm máu. 
•    Xét nghiệm virus. 
•    Xét nghiệm kháng thể dại 
•    Xét nghiệm nước tiểu. 
•    Xét nghiệm da. 
•    Xét nghiệm phân. 
•    Kháng sinh đồ.

Ngoài ra PetCare còn liên kết với các phòng xét nghiệm tại nước ngoài trong trường hợp thú cưng của bạn cần thêm xét nghiệm chuyên khoa khác.

 

xetnghiem', 1, 1, N'Alaskan-kl183402514.jpg')
INSERT [dbo].[HoatDong] ([IdHoatDong], [TenHoatDong], [NgayThang], [MoTa], [NoiDung], [IdCoSoThuY], [TinhTrang], [ImageShow]) VALUES (3, N'Bệnh Viện Thú Y PetCare tiếp tục đầu tư máy móc chẩn đoán hình ảnh', CAST(N'1997-01-01' AS Date), N'Kể từ khi thành lập năm 2005, Bệnh Viện Thú Y PetCare đã đầu tư máy móc thiết bị nhằm phục vụ công tác điều…', N'Chẩn đoán hình ảnh
•   Siêu âm: Đây là phương pháp phổ biến dùng để đánh giá tình trạng sức khỏe vật nuôi và chẩn đoán bệnh trong các trường hợp mang thai, khối u, các bệnh ở vùng bụng và nhiều vấn đề khác.

•   Chụp X-quang: máy X-quang thường được dùng để phát hiện các vấn đề về xương khớp, khối u, các vật thể lạ trong cơ thể như sỏi thận hoặc dị vật đường ruột và chẩn đoán nhiều bệnh khác.

 

sieuam1

  
  
phimxray

 

Các dịch vụ xét nghiệm
•    Xét nghiệm máu. 
•    Xét nghiệm virus. 
•    Xét nghiệm kháng thể dại 
•    Xét nghiệm nước tiểu. 
•    Xét nghiệm da. 
•    Xét nghiệm phân. 
•    Kháng sinh đồ.

Ngoài ra PetCare còn liên kết với các phòng xét nghiệm tại nước ngoài trong trường hợp thú cưng của bạn cần thêm xét nghiệm chuyên khoa khác.

 

xetnghiem', 1, 1, N'Alaskan-kl183402514.jpg')
INSERT [dbo].[HoatDong] ([IdHoatDong], [TenHoatDong], [NgayThang], [MoTa], [NoiDung], [IdCoSoThuY], [TinhTrang], [ImageShow]) VALUES (4, N'Bệnh Viện Thú Y PetCare tiếp tục đầu tư máy móc chẩn đoán hình ảnh', CAST(N'1997-01-01' AS Date), N'Kể từ khi thành lập năm 2005, Bệnh Viện Thú Y PetCare đã đầu tư máy móc thiết bị nhằm phục vụ công tác điều…', N'Chẩn đoán hình ảnh
•   Siêu âm: Đây là phương pháp phổ biến dùng để đánh giá tình trạng sức khỏe vật nuôi và chẩn đoán bệnh trong các trường hợp mang thai, khối u, các bệnh ở vùng bụng và nhiều vấn đề khác.

•   Chụp X-quang: máy X-quang thường được dùng để phát hiện các vấn đề về xương khớp, khối u, các vật thể lạ trong cơ thể như sỏi thận hoặc dị vật đường ruột và chẩn đoán nhiều bệnh khác.

 

sieuam1

  
  
phimxray

 

Các dịch vụ xét nghiệm
•    Xét nghiệm máu. 
•    Xét nghiệm virus. 
•    Xét nghiệm kháng thể dại 
•    Xét nghiệm nước tiểu. 
•    Xét nghiệm da. 
•    Xét nghiệm phân. 
•    Kháng sinh đồ.

Ngoài ra PetCare còn liên kết với các phòng xét nghiệm tại nước ngoài trong trường hợp thú cưng của bạn cần thêm xét nghiệm chuyên khoa khác.

 

xetnghiem', 1, 1, N'Alaskan-kl183402514.jpg')
INSERT [dbo].[HoatDong] ([IdHoatDong], [TenHoatDong], [NgayThang], [MoTa], [NoiDung], [IdCoSoThuY], [TinhTrang], [ImageShow]) VALUES (6, N'Bệnh Viện Thú Y PetCare tiếp tục đầu tư máy móc chẩn đoán hình ảnh', CAST(N'1997-01-01' AS Date), N'Kể từ khi thành lập năm 2005, Bệnh Viện Thú Y PetCare đã đầu tư máy móc thiết bị nhằm phục vụ công tác điều…', N'Chẩn đoán hình ảnh
•   Siêu âm: Đây là phương pháp phổ biến dùng để đánh giá tình trạng sức khỏe vật nuôi và chẩn đoán bệnh trong các trường hợp mang thai, khối u, các bệnh ở vùng bụng và nhiều vấn đề khác.

•   Chụp X-quang: máy X-quang thường được dùng để phát hiện các vấn đề về xương khớp, khối u, các vật thể lạ trong cơ thể như sỏi thận hoặc dị vật đường ruột và chẩn đoán nhiều bệnh khác.

 

sieuam1

  
  
phimxray

 

Các dịch vụ xét nghiệm
•    Xét nghiệm máu. 
•    Xét nghiệm virus. 
•    Xét nghiệm kháng thể dại 
•    Xét nghiệm nước tiểu. 
•    Xét nghiệm da. 
•    Xét nghiệm phân. 
•    Kháng sinh đồ.

Ngoài ra PetCare còn liên kết với các phòng xét nghiệm tại nước ngoài trong trường hợp thú cưng của bạn cần thêm xét nghiệm chuyên khoa khác.

 

xetnghiem', 1, 1, N'Alaskan-kl183402514.jpg')
INSERT [dbo].[HoatDong] ([IdHoatDong], [TenHoatDong], [NgayThang], [MoTa], [NoiDung], [IdCoSoThuY], [TinhTrang], [ImageShow]) VALUES (9, N'Lịch làm việc lễ 2/9/2017', CAST(N'2018-08-16' AS Date), N'Nhằm hỗ trợ Quý khách trong việc chăm sóc thú cưng, Bệnh Viện Thú Y PetCare vẫn nhận khám chữa bệnh xuyên suốt các ngày…', N'<header style="box-sizing: border-box; margin: 0px 0px 20px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">
<h1 style="box-sizing: border-box; margin: 0px; padding: 0px 0px 18px; direction: ltr; outline: none; font-size: 40px; color: #333333;">Lịch l&agrave;m việc lễ 2/9/2017</h1>
<div class="header_meta" style="box-sizing: border-box; margin: 0px; padding: 0px; direction: ltr; outline: none; opacity: 0.7 !important;">Đăng bởi&nbsp;<span class="author vcard meta_author" style="box-sizing: border-box; border-left: none; padding: 0px 8px 0px 0px;"><a class="url fn n" style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #666666; transition: all 0.3s ease-out 0s;" title="View all posts by Petcare" href="http://petcare.vn/author/petcare/" rel="author">Petcare</a></span>&nbsp;<span class="meta-date" style="box-sizing: border-box; border-left: 1px solid #e1e1e1; padding: 0px 8px;"><time class="entry-date" style="box-sizing: border-box;" datetime="2017-08-30T00:35:22+00:00">30/08/2017</time></span>&nbsp;<span class="meta_categories" style="box-sizing: border-box; border-left: 1px solid #e1e1e1; padding: 0px 8px;"><a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #666666; transition: all 0.3s ease-out 0s;" title="View all posts in Tin tức" href="http://petcare.vn/blog/tin-tuc/">Tin tức</a></span></div>
</header>
<p><img class="attachment-post-thumbnail size-post-thumbnail wp-post-image" style="box-sizing: border-box; margin-top: 10px; margin-bottom: 25px; height: auto; max-width: 100%; vertical-align: top; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;" src="http://petcare.vn/wp-content/uploads/2017/08/LAM-VIEC-LE.jpg" sizes="(max-width: 890px) 100vw, 890px" srcset="http://petcare.vn/wp-content/uploads/2017/08/LAM-VIEC-LE.jpg 890w, http://petcare.vn/wp-content/uploads/2017/08/LAM-VIEC-LE-300x169.jpg 300w, http://petcare.vn/wp-content/uploads/2017/08/LAM-VIEC-LE-768x431.jpg 768w" alt="" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">Nhằm hỗ trợ Qu&yacute; kh&aacute;ch trong việc chăm s&oacute;c th&uacute; cưng, Bệnh Viện Th&uacute; Y PetCare vẫn nhận kh&aacute;m chữa bệnh xuy&ecirc;n suốt c&aacute;c ng&agrave;y lễ. Ch&uacute;ng t&ocirc;i tr&acirc;n trọng th&ocirc;ng b&aacute;o tới Qu&yacute; kh&aacute;ch về lịch l&agrave;m việc dịp lễ 2/9/2017 như sau:</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Thời gian:</strong>&nbsp;Từ ng&agrave;y 02 &ndash; 04/09/2017.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Giờ l&agrave;m việc:</strong><br style="box-sizing: border-box;" />Buổi s&aacute;ng 8h &ndash; 12h tại 4 chi nh&aacute;nh của PetCare. Sau 12h trưa Bệnh Viện đ&oacute;ng cửa nghỉ lễ.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Trực cấp cứu 24/7:</strong><br style="box-sizing: border-box;" />Tại PetCare 1 &ndash; 124A đường Xu&acirc;n Thủy, Thảo Điền, quận 2, tp.HCM.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">Từ ng&agrave;y 5/9/2017 trở đi c&aacute;c chi nh&aacute;nh của PetCare hoạt động lại b&igrave;nh thường.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">Mọi thắc mắc xin vui l&ograve;ng li&ecirc;n hệ:</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Điện thoại:</strong>&nbsp;<a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70; transition: all 0.3s ease-out 0s;" href="tel:+842837442505">(028) 3744 2505</a>&nbsp;&ndash;&nbsp;<a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70; transition: all 0.3s ease-out 0s;" href="tel:+84918271246">0918 271 246</a></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Email:</strong>&nbsp;<a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70; transition: all 0.3s ease-out 0s;" href="mailto:info@petcare.vn">info@petcare.vn</a></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Website:</strong>&nbsp;<a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70; transition: all 0.3s ease-out 0s;" href="http://petcare.vn/">www.petcare.vn</a></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Facebook:</strong>&nbsp;<a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70; transition: all 0.3s ease-out 0s;" href="https://www.facebook.com/PetcareVietnam/">Bệnh viện Th&uacute; y Petcare &ndash; Petcare Vietnam</a></p>', 1, 1, N'image4-600182002492.jpg')
INSERT [dbo].[HoatDong] ([IdHoatDong], [TenHoatDong], [NgayThang], [MoTa], [NoiDung], [IdCoSoThuY], [TinhTrang], [ImageShow]) VALUES (10, N'LỊCH LÀM VIỆC TẾT 2017', CAST(N'2018-08-16' AS Date), N'Nhằm hỗ trợ Quý khách trong việc chăm sóc thú cưng, Bệnh Viện Thú Y PetCare vẫn nhận khám chữa bệnh xuyên suốt các ngày…', N'<header style="box-sizing: border-box; margin: 0px 0px 20px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">
<h1 style="box-sizing: border-box; margin: 0px; padding: 0px 0px 18px; direction: ltr; outline: none; font-size: 40px; color: #333333;">LỊCH L&Agrave;M VIỆC TẾT 2017</h1>
<div class="header_meta" style="box-sizing: border-box; margin: 0px; padding: 0px; direction: ltr; outline: none; opacity: 0.7 !important;">Đăng bởi&nbsp;<span class="author vcard meta_author" style="box-sizing: border-box; border-left: none; padding: 0px 8px 0px 0px;"><a class="url fn n" style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #666666; transition: all 0.3s ease-out 0s;" title="View all posts by Petcare" href="http://petcare.vn/author/petcare/" rel="author">Petcare</a></span>&nbsp;<span class="meta-date" style="box-sizing: border-box; border-left: 1px solid #e1e1e1; padding: 0px 8px;"><time class="entry-date" style="box-sizing: border-box;" datetime="2016-12-30T16:26:31+00:00">30/12/2016</time></span>&nbsp;<span class="meta_categories" style="box-sizing: border-box; border-left: 1px solid #e1e1e1; padding: 0px 8px;"><a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #666666; transition: all 0.3s ease-out 0s;" title="View all posts in Tin tức" href="http://petcare.vn/blog/tin-tuc/">Tin tức</a></span></div>
</header>
<p><img class="attachment-post-thumbnail size-post-thumbnail wp-post-image" style="box-sizing: border-box; margin-top: 10px; margin-bottom: 25px; height: auto; max-width: 100%; vertical-align: top; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;" src="http://petcare.vn/wp-content/uploads/2016/12/pc1.jpg" sizes="(max-width: 1280px) 100vw, 1280px" srcset="http://petcare.vn/wp-content/uploads/2016/12/pc1.jpg 1280w, http://petcare.vn/wp-content/uploads/2016/12/pc1-300x169.jpg 300w, http://petcare.vn/wp-content/uploads/2016/12/pc1-768x432.jpg 768w, http://petcare.vn/wp-content/uploads/2016/12/pc1-1024x576.jpg 1024w" alt="" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box;">Nhằm hỗ trợ Qu&yacute; kh&aacute;ch trong việc chăm s&oacute;c th&uacute; cưng, Bệnh Viện Th&uacute; Y PetCare vẫn nhận kh&aacute;m chữa bệnh xuy&ecirc;n suốt c&aacute;c ng&agrave;y Tết tại chi nh&aacute;nh PetCare 1. Ch&uacute;ng t&ocirc;i tr&acirc;n trọng th&ocirc;ng b&aacute;o tới Qu&yacute; kh&aacute;ch về lịch l&agrave;m việc dịp Tết &Acirc;m lịch 2017 như sau:</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Thời gian:&nbsp;</strong><span style="box-sizing: border-box;">Từ 29 &ndash; m&ugrave;ng 5 Tết &Acirc;m lịch &nbsp;(26/01 &ndash; 01/02/2017).</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Giờ l&agrave;m việc:</strong><span style="box-sizing: border-box;">&nbsp;buổi s&aacute;ng 8h &ndash; 12h từ thứ 2 đến chủ nhật.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Trực cấp cứu:</strong><span style="box-sizing: border-box;">&nbsp;24/7.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Địa điểm:</strong><span style="box-sizing: border-box;">&nbsp;PetCare 1 &ndash; 124A đường Xu&acirc;n Thủy, Thảo Điền, quận 2, tp.HCM.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box;">Từ m&ugrave;ng 6 Tết trở đi (02/02/2017) c&aacute;c chi nh&aacute;nh của PetCare hoạt động lại b&igrave;nh thường.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Mọi thắc mắc xin vui l&ograve;ng li&ecirc;n hệ:</strong></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Điện thoại:</strong>&nbsp;<a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70; transition: all 0.3s ease-out 0s;" href="tel:+84837442505">(08) 3744 2505</a></span><span style="box-sizing: border-box;">&nbsp;&nbsp;&ndash; &nbsp;<a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70; transition: all 0.3s ease-out 0s;" href="tel:+84918271246">0918 271 246</a></span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Email:</strong>&nbsp;<a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70; transition: all 0.3s ease-out 0s;" href="mailto:info@petcare.vn">info@petcare.vn</a></span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Website:</strong>&nbsp;<a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70; transition: all 0.3s ease-out 0s;" href="http://www.petcare.vn/">www.petcare.vn</a></span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Facebook:</strong><a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70; transition: all 0.3s ease-out 0s;" href="https://vi-vn.facebook.com/PetcareVietnam/">&nbsp;Bệnh viện Th&uacute; y Petcare &ndash; Petcare Vietnam</a></span></p>', 1, 1, N'pc1-600x25182259020.jpg')
INSERT [dbo].[HoatDong] ([IdHoatDong], [TenHoatDong], [NgayThang], [MoTa], [NoiDung], [IdCoSoThuY], [TinhTrang], [ImageShow]) VALUES (11, N'đầu tư máy móc chẩn đoán hình ảnh', NULL, N'Nhằm hỗ trợ chủ nuôi trong việc chăm sóc thú cưng dịp Tết 2017, Bệnh Viện Thú Y PetCare  nhận chăm sóc thú cưng qua đêm…', N'<header style="box-sizing: border-box; margin: 0px 0px 20px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">
<div class="header_meta" style="box-sizing: border-box; margin: 0px; padding: 0px; direction: ltr; outline: none; opacity: 0.7 !important;"><img class="attachment-post-thumbnail size-post-thumbnail wp-post-image" style="box-sizing: border-box; margin-top: 10px; margin-bottom: 25px; height: auto; max-width: 100%; vertical-align: top; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;" src="http://petcare.vn/wp-content/uploads/2016/12/image4.jpg" sizes="(max-width: 960px) 100vw, 960px" srcset="http://petcare.vn/wp-content/uploads/2016/12/image4.jpg 960w, http://petcare.vn/wp-content/uploads/2016/12/image4-300x169.jpg 300w, http://petcare.vn/wp-content/uploads/2016/12/image4-768x432.jpg 768w" alt="" /></div>
</header>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;">Kể từ khi th&agrave;nh lập năm 2005, Bệnh Viện Th&uacute; Y PetCare đ&atilde; đầu tư m&aacute;y m&oacute;c thiết bị nhằm phục vụ c&ocirc;ng t&aacute;c điều trị. Trong đ&oacute; m&aacute;y si&ecirc;u &acirc;m được trang bị cho to&agrave;n bộ 4 chi nh&aacute;nh v&agrave; m&aacute;y chụp X-quang được đặt tại PetCare 1 (Thảo Điền, Q.2). Đến năm 2016, PetCare 1 được trang bị th&ecirc;m m&aacute;y đọc phim kĩ thuật số thay cho phương ph&aacute;p rửa phim truyền thống để n&acirc;ng cao chất lượng h&igrave;nh ảnh v&agrave; giảm thời gian chờ đợi cho chủ nu&ocirc;i.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;">Th&aacute;ng 11/2016, nhằm n&acirc;ng cao chất lượng bệnh viện v&agrave; tạo điều kiện thuận lợi cho chủ nu&ocirc;i trong việc đưa th&uacute; cưng đi chụp X-quang, Bệnh Viện tiếp tục đầu tư 2 m&aacute;y chụp X-quang v&agrave; 2 m&aacute;y đọc phim kĩ thuật số tại PetCare 2 (Ph&uacute; Mỹ Hưng, Q.7) v&agrave; PetCare 4 (Ba Cu, Vũng T&agrave;u). Như vậy kể từ khi th&agrave;nh lập đến nay, Bệnh Viện Th&uacute; Y PetCare đ&atilde; trang bị đầy đủ c&aacute;c m&aacute;y m&oacute;c thiết bị cần thiết cho c&aacute;c chi nh&aacute;nh, đ&aacute;p ứng nhu cầu kh&aacute;m chữa bệnh cho th&uacute; cưng của kh&aacute;ch h&agrave;ng cũng như y&ecirc;u cầu cấp thiết trong việc ph&aacute;t triển v&agrave; n&acirc;ng tầm lĩnh vực th&uacute; y th&uacute; nhỏ của đất nước.</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: center;">&nbsp;</p>
<div class="wc-shortcodes-row wc-shortcodes-item wc-shortcodes-clearfix" style="box-sizing: border-box; margin: 1.5em 0px; padding: 0px; direction: ltr; outline: none; zoom: 1; width: 840px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">
<div class="wc-shortcodes-column wc-shortcodes-content wc-shortcodes-one-half wc-shortcodes-column-first " style="box-sizing: border-box; padding: 0px; direction: ltr; outline: none; width: 403.184px; position: relative; float: left; clear: left; margin: 0px 0px 0px 0px !important;">
<p style="box-sizing: border-box; line-height: 24px; margin-top: 0px !important; text-align: center;"><img class="alignnone size-full wp-image-5976" style="box-sizing: border-box; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/12/image3-1.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/12/image3-1.jpg 700w, http://petcare.vn/wp-content/uploads/2016/12/image3-1-300x225.jpg 300w" alt="image3" /></p>
<p style="box-sizing: border-box; line-height: 24px; margin-bottom: 0px !important;">&nbsp;</p>
</div>
<div class="wc-shortcodes-column wc-shortcodes-content wc-shortcodes-one-half wc-shortcodes-column-last " style="box-sizing: border-box; margin: 0px 0px 0px 33.5938px; padding: 0px; direction: ltr; outline: none; width: 403.184px; position: relative; float: left;">
<p style="box-sizing: border-box; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important;"><img class="size-full wp-image-5980 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/12/image6.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/12/image6.jpg 700w, http://petcare.vn/wp-content/uploads/2016/12/image6-300x225.jpg 300w" alt="image6" /></p>
</div>
</div>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-5982 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/12/image8.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/12/image8.jpg 700w, http://petcare.vn/wp-content/uploads/2016/12/image8-300x225.jpg 300w" alt="image8" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: center;"><em style="box-sizing: border-box;">C&aacute;c b&aacute;c sĩ đang tiến h&agrave;nh chẩn đo&aacute;n tại PetCare 4</em></p>', 1, 1, N'lich-lam-v182356780.jpg')
INSERT [dbo].[HoatDong] ([IdHoatDong], [TenHoatDong], [NgayThang], [MoTa], [NoiDung], [IdCoSoThuY], [TinhTrang], [ImageShow]) VALUES (12, N'Dịch vụ lưu chuồng Tết 2017', CAST(N'2018-08-16' AS Date), N'Nhằm hỗ trợ chủ nuôi trong việc chăm sóc thú cưng dịp Tết 2017, Bệnh Viện Thú Y PetCare  nhận chăm sóc thú cưng qua đêm…', N'<header style="box-sizing: border-box; margin: 0px 0px 20px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">
<h1 style="box-sizing: border-box; margin: 0px; padding: 0px 0px 18px; direction: ltr; outline: none; font-size: 40px; color: #333333;">Dịch vụ lưu chuồng Tết 2017</h1>
<div class="header_meta" style="box-sizing: border-box; margin: 0px; padding: 0px; direction: ltr; outline: none; opacity: 0.7 !important;">Đăng bởi&nbsp;<span class="author vcard meta_author" style="box-sizing: border-box; border-left: none; padding: 0px 8px 0px 0px;"><a class="url fn n" style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #666666; transition: all 0.3s ease-out 0s;" title="View all posts by Petcare" href="http://petcare.vn/author/petcare/" rel="author">Petcare</a></span>&nbsp;<span class="meta-date" style="box-sizing: border-box; border-left: 1px solid #e1e1e1; padding: 0px 8px;"><time class="entry-date" style="box-sizing: border-box;" datetime="2016-11-21T21:23:21+00:00">21/11/2016</time></span>&nbsp;<span class="meta_categories" style="box-sizing: border-box; border-left: 1px solid #e1e1e1; padding: 0px 8px;"><a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #666666; transition: all 0.3s ease-out 0s;" title="View all posts in Tin tức" href="http://petcare.vn/blog/tin-tuc/">Tin tức</a></span></div>
</header>
<p><img class="attachment-post-thumbnail size-post-thumbnail wp-post-image" style="box-sizing: border-box; margin-top: 10px; margin-bottom: 25px; height: auto; max-width: 100%; vertical-align: top; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;" src="http://petcare.vn/wp-content/uploads/2016/11/luuchuong001.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/11/luuchuong001.jpg 700w, http://petcare.vn/wp-content/uploads/2016/11/luuchuong001-300x169.jpg 300w" alt="" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box; color: #000000;"><span style="box-sizing: border-box;">Nhằm hỗ trợ chủ nu&ocirc;i trong việc chăm s&oacute;c th&uacute; cưng dịp Tết 2017, Bệnh Viện&nbsp;</span><span style="box-sizing: border-box;">Th&uacute; Y PetCare&nbsp;</span><span style="box-sizing: border-box;">&nbsp;nhận chăm s&oacute;c th&uacute; cưng&nbsp;<strong style="box-sizing: border-box;">qua đ&ecirc;m</strong>&nbsp;với thời gian linh động theo y&ecirc;u cầu của qu&yacute; kh&aacute;ch.</span></span></p>
<h3 style="box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; font-weight: normal; color: #333333; font-size: 25px; margin: 0px; padding: 0px 0px 10px; direction: ltr; outline: none;"><span style="box-sizing: border-box; color: #000000;"><strong style="box-sizing: border-box;"><br style="box-sizing: border-box;" /></strong></span><strong style="box-sizing: border-box;"><br style="box-sizing: border-box;" /><span style="box-sizing: border-box; color: #000000;">ĐẶC BIỆT:&nbsp;</span></strong></h3>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><strong style="box-sizing: border-box;">Dịch vụ trọn g&oacute;i&nbsp;</strong>chăm s&oacute;c th&uacute; cưng&nbsp;trong<strong style="box-sizing: border-box;">&nbsp;8 ng&agrave;y lễ, từ 28 &ndash; mồng 6 Tết &acirc;m lịch&nbsp;</strong>(<strong style="box-sizing: border-box;">25/01/2017 &ndash; 02/02/2017</strong>).</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">Tặng 1 g&oacute;i&nbsp;<a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70; transition: all 0.3s ease-out 0s;" href="http://petcare.vn/dich-vu/tham-my/"><em style="box-sizing: border-box;">grooming</em></a>&nbsp;cơ bản&nbsp;<strong style="box-sizing: border-box;">miễn ph&iacute;</strong>&nbsp;khi lưu chuồng tại PetCare từ 7 ng&agrave;y trở l&ecirc;n</p>
<h3 style="box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; font-weight: normal; color: #333333; font-size: 25px; margin: 0px; padding: 0px 0px 10px; direction: ltr; outline: none;"><span style="box-sizing: border-box; color: #339966;"><strong style="box-sizing: border-box;">Giảm 10% ph&iacute; trọn g&oacute;i&nbsp;</strong></span><span style="box-sizing: border-box; color: #000000;">khi thanh to&aacute;n trước ng&agrave;y&nbsp;<strong style="box-sizing: border-box;"><span style="box-sizing: border-box; color: #339966;">7/01/2017</span></strong></span><strong style="box-sizing: border-box;"><span style="box-sizing: border-box; color: #339966;">.</span></strong></h3>
<h3 style="box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; font-weight: normal; color: #333333; font-size: 25px; margin: 0px; padding: 0px 0px 10px; direction: ltr; outline: none;"><strong style="box-sizing: border-box;"><span style="box-sizing: border-box; color: #339966;">Giảm 5% ph&iacute; trọn g&oacute;i</span>&nbsp;</strong><span style="box-sizing: border-box; color: #000000;">khi thanh to&aacute;n trước ng&agrave;y</span><span style="box-sizing: border-box; color: #339966;"><strong style="box-sizing: border-box;">&nbsp;14/01/2017.</strong></span></h3>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box;"><br style="box-sizing: border-box;" /><strong style="box-sizing: border-box;"><span style="box-sizing: border-box; color: #000000;">Petcare &aacute;p dụng quy tr&igrave;nh lưu giữ th&uacute; cưng khoa học, đảm bảo cho th&uacute; cưng nh&agrave; bạn sống trong m&ocirc;i trường an to&agrave;n v&agrave; sạch sẽ:</span></strong></span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;"><span style="box-sizing: border-box; color: #000000;"><span style="box-sizing: border-box;">&bull; &nbsp; Petcare c&oacute; một kh&ocirc;ng gian rộng với mục đ&iacute;ch phục vụ cho việc lưu giữ ch&oacute;, m&egrave;o. Khu vực lưu tr&uacute; c&oacute; s&acirc;n cỏ, gi&uacute;p c&aacute;c bạn nhỏ thoải m&aacute;i vận động mỗi ng&agrave;y 2 lần, đảm bảo sức khoẻ v&agrave; ổn định tinh thần cho c&aacute;c bạn nhỏ.</span></span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;"><span style="box-sizing: border-box; color: #000000;">&bull;&nbsp;&nbsp;&nbsp;C&oacute; hệ thống h&uacute;t m&ugrave;i c&ocirc;ng nghiệp, tr&aacute;nh &ocirc; nhiễm do ch&iacute;nh th&uacute; cưng thải ra.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;"><span style="box-sizing: border-box; color: #000000;">&bull;&nbsp;&nbsp;&nbsp;C&oacute; hệ thống điều h&ograve;a nhiệt khi cần thiết v&agrave;o những ng&agrave;y nắng n&oacute;ng theo chế độ y&ecirc;u cầu.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;"><span style="box-sizing: border-box; color: #000000;">&bull;&nbsp;&nbsp;&nbsp;Cung cấp thức ăn Royal Canin cho th&uacute; cưng v&agrave; cả thực phẩm chế biến theo nhu cầu.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;"><span style="box-sizing: border-box; color: #000000;">&bull;&nbsp;&nbsp;&nbsp;C&oacute; hệ thống camera theo d&otilde;i th&uacute; cưng gi&uacute;p c&aacute;c b&aacute;c sĩ kiểm so&aacute;t t&igrave;nh h&igrave;nh.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;"><span style="box-sizing: border-box; color: #000000;">&bull; &nbsp; C&oacute; B&aacute;c Sỹ Th&uacute; Y kiểm tra sức khoẻ h&agrave;ng ng&agrave;y.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: justify;"><span style="box-sizing: border-box; color: #000000;">&bull;&nbsp;&nbsp;&nbsp;Giờ nhận v&agrave; đ&oacute;n th&uacute; cưng linh động.</span></p>
<div class="wc-shortcodes-row wc-shortcodes-item wc-shortcodes-clearfix" style="box-sizing: border-box; margin: 1.5em 0px; padding: 0px; direction: ltr; outline: none; zoom: 1; width: 840px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">
<div class="wc-shortcodes-column wc-shortcodes-content wc-shortcodes-one-half wc-shortcodes-column-first " style="box-sizing: border-box; padding: 0px; direction: ltr; outline: none; width: 403.184px; position: relative; float: left; clear: left; margin: 0px 0px 0px 0px !important;">
<p style="box-sizing: border-box; line-height: 24px; margin-top: 0px !important; text-align: center;"><img class="alignnone size-full wp-image-5929" style="box-sizing: border-box; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/11/luuchuong3.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/11/luuchuong3.jpg 700w, http://petcare.vn/wp-content/uploads/2016/11/luuchuong3-300x237.jpg 300w" alt="luuchuong3" /></p>
<p style="box-sizing: border-box; line-height: 24px; margin-bottom: 0px !important; text-align: center;"><em style="box-sizing: border-box;">Daintree&nbsp;chơi với Mina trong ph&ograve;ng lưu chuồng</em></p>
</div>
<div class="wc-shortcodes-column wc-shortcodes-content wc-shortcodes-one-half wc-shortcodes-column-last " style="box-sizing: border-box; margin: 0px 0px 0px 33.5938px; padding: 0px; direction: ltr; outline: none; width: 403.184px; position: relative; float: left;">
<p style="box-sizing: border-box; line-height: 24px; margin-top: 0px !important; text-align: center;"><img class="alignnone size-full wp-image-5927" style="box-sizing: border-box; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/11/grooming.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/11/grooming.jpg 700w, http://petcare.vn/wp-content/uploads/2016/11/grooming-300x237.jpg 300w" alt="grooming" /></p>
<p style="box-sizing: border-box; line-height: 24px; margin-bottom: 0px !important; text-align: center;"><em style="box-sizing: border-box;">Ruby trong ph&ograve;ng m&aacute;y lạnh sau khi grooming</em></p>
</div>
</div>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><img class="size-full wp-image-5940 aligncenter" style="box-sizing: border-box; display: block; margin: 5px auto; height: auto; max-width: 100%; vertical-align: top;" src="http://petcare.vn/wp-content/uploads/2016/11/meo1-1.jpg" sizes="(max-width: 700px) 100vw, 700px" srcset="http://petcare.vn/wp-content/uploads/2016/11/meo1-1.jpg 700w, http://petcare.vn/wp-content/uploads/2016/11/meo1-1-300x205.jpg 300w" alt="meo1" /></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px; text-align: center;"><em style="box-sizing: border-box;">Mimi nằm thư gi&atilde;n trong chuồng</em></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;">&nbsp;</p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box; color: #339966;"><strong style="box-sizing: border-box;">Lưu &yacute;:</strong></span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box; color: #000000;">&bull; &nbsp;Ng&agrave;y lễ nhận th&uacute; cưng từ 8-12h.</span><br style="box-sizing: border-box;" /><span style="box-sizing: border-box; color: #000000;">&bull; &nbsp;Dịch vụ trọn g&oacute;i trả th&uacute; cưng từ 8-12h &amp; 14-18h &nbsp;mồng 6 Tết</span><br style="box-sizing: border-box;" /><span style="box-sizing: border-box; color: #000000;">&bull; &nbsp;Ưu ti&ecirc;n cho kh&aacute;ch đặt cọc giữ chỗ, v&igrave; số chỗ c&oacute; giới hạn.</span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><em style="box-sizing: border-box;"><span style="box-sizing: border-box; color: #000000;">H&atilde;y y&ecirc;n t&acirc;m khi đ&atilde; gửi th&uacute; cưng cho ch&uacute;ng t&ocirc;i, ch&uacute;ng t&ocirc;i sẽ n&acirc;ng niu th&uacute; cưng của bạn như ch&uacute;ng đang được ở ch&iacute;nh nh&agrave; m&igrave;nh.</span></em></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box; color: #339966;"><strong style="box-sizing: border-box;"><em style="box-sizing: border-box;">PetCare &ndash; Caring for your pets !</em></strong></span></p>
<p style="box-sizing: border-box; line-height: 24px; color: #666666; font-family: Arial, Helvetica, sans-serif; font-size: 15px;"><span style="box-sizing: border-box;">Qu&yacute; kh&aacute;ch vui l&ograve;ng&nbsp;</span><a style="box-sizing: border-box; text-decoration-line: none; line-height: inherit; color: #1daf70; transition: all 0.3s ease-out 0s;" href="http://petcare.vn/lien-he/"><strong style="box-sizing: border-box;"><em style="box-sizing: border-box;">li&ecirc;n hệ</em></strong></a><span style="box-sizing: border-box;">&nbsp;&nbsp;PetCare để được tư vấn v&agrave; đặt chỗ.</span></p>', 1, 1, N'luuchuong0182524876.jpg')
SET IDENTITY_INSERT [dbo].[HoatDong] OFF
SET IDENTITY_INSERT [dbo].[LichSuKham] ON 

INSERT [dbo].[LichSuKham] ([IdLichSuKham], [IdThuCung], [TinhTrangBenh], [NgayThang], [LoiNhan]) VALUES (1, 2, N'Hắc lào', CAST(N'2018-07-15' AS Date), N'đem đi bán đi')
INSERT [dbo].[LichSuKham] ([IdLichSuKham], [IdThuCung], [TinhTrangBenh], [NgayThang], [LoiNhan]) VALUES (2, 2, N'Hắc lào lang beng', CAST(N'2018-07-15' AS Date), N'đem đi bán đi')
INSERT [dbo].[LichSuKham] ([IdLichSuKham], [IdThuCung], [TinhTrangBenh], [NgayThang], [LoiNhan]) VALUES (3, 2, N'Hắc lào chó', CAST(N'2018-07-15' AS Date), N'đem đi bán đi')
INSERT [dbo].[LichSuKham] ([IdLichSuKham], [IdThuCung], [TinhTrangBenh], [NgayThang], [LoiNhan]) VALUES (4, 3, N'Hắc lào chó', CAST(N'2018-07-16' AS Date), N'đem đi bán đi')
INSERT [dbo].[LichSuKham] ([IdLichSuKham], [IdThuCung], [TinhTrangBenh], [NgayThang], [LoiNhan]) VALUES (5, 3, N'Hắc lào chó', CAST(N'2018-07-17' AS Date), N'đem đi bán đi')
INSERT [dbo].[LichSuKham] ([IdLichSuKham], [IdThuCung], [TinhTrangBenh], [NgayThang], [LoiNhan]) VALUES (6, 3, N'Hắc lào chó', CAST(N'2018-07-18' AS Date), N'đem đi bán đi')
INSERT [dbo].[LichSuKham] ([IdLichSuKham], [IdThuCung], [TinhTrangBenh], [NgayThang], [LoiNhan]) VALUES (7, 2, N'Hắc lào chó', CAST(N'2018-07-15' AS Date), N'đem đi bán đi')
INSERT [dbo].[LichSuKham] ([IdLichSuKham], [IdThuCung], [TinhTrangBenh], [NgayThang], [LoiNhan]) VALUES (8, 2, N'Hắc lào chó', CAST(N'2018-07-15' AS Date), N'đem đi bán đi')
INSERT [dbo].[LichSuKham] ([IdLichSuKham], [IdThuCung], [TinhTrangBenh], [NgayThang], [LoiNhan]) VALUES (9, 2, N'Hắc lào chó', CAST(N'2018-07-15' AS Date), N'đem đi bán đi')
SET IDENTITY_INSERT [dbo].[LichSuKham] OFF
SET IDENTITY_INSERT [dbo].[Like] ON 

INSERT [dbo].[Like] ([IdLike], [IdNguoiDung], [IdBaiViet], [TinhTrang]) VALUES (2, 4, 2, 1)
INSERT [dbo].[Like] ([IdLike], [IdNguoiDung], [IdBaiViet], [TinhTrang]) VALUES (3, 4, 3, 1)
INSERT [dbo].[Like] ([IdLike], [IdNguoiDung], [IdBaiViet], [TinhTrang]) VALUES (4, 4, 1022, 0)
INSERT [dbo].[Like] ([IdLike], [IdNguoiDung], [IdBaiViet], [TinhTrang]) VALUES (5, 4, 1023, 0)
INSERT [dbo].[Like] ([IdLike], [IdNguoiDung], [IdBaiViet], [TinhTrang]) VALUES (6, 4, 1, 0)
INSERT [dbo].[Like] ([IdLike], [IdNguoiDung], [IdBaiViet], [TinhTrang]) VALUES (7, 4, 1025, 1)
SET IDENTITY_INSERT [dbo].[Like] OFF
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([IdLoaiSanPham], [TenLoaiSanPham], [TrangThai], [IdShop]) VALUES (1, N'Chó con', 1, 1)
INSERT [dbo].[LoaiSanPham] ([IdLoaiSanPham], [TenLoaiSanPham], [TrangThai], [IdShop]) VALUES (2, N'Mèo', 1, 1)
INSERT [dbo].[LoaiSanPham] ([IdLoaiSanPham], [TenLoaiSanPham], [TrangThai], [IdShop]) VALUES (3, N'Nơ dành cho chó', 1, 5)
INSERT [dbo].[LoaiSanPham] ([IdLoaiSanPham], [TenLoaiSanPham], [TrangThai], [IdShop]) VALUES (4, N'Vòng cổ', 1, 1)
INSERT [dbo].[LoaiSanPham] ([IdLoaiSanPham], [TenLoaiSanPham], [TrangThai], [IdShop]) VALUES (5, N'Dây dắt chó và mèo', 1, 1)
INSERT [dbo].[LoaiSanPham] ([IdLoaiSanPham], [TenLoaiSanPham], [TrangThai], [IdShop]) VALUES (6, N'Núm vú cho chó ngậm', 1, 5)
INSERT [dbo].[LoaiSanPham] ([IdLoaiSanPham], [TenLoaiSanPham], [TrangThai], [IdShop]) VALUES (1004, N'Quần tắm dành cho chó', 1, 1)
INSERT [dbo].[LoaiSanPham] ([IdLoaiSanPham], [TenLoaiSanPham], [TrangThai], [IdShop]) VALUES (1005, N'ahihihi', 1, 6)
INSERT [dbo].[LoaiSanPham] ([IdLoaiSanPham], [TenLoaiSanPham], [TrangThai], [IdShop]) VALUES (1006, N'ahahaha', 1, 6)
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([IdNguoiDung], [TenNguoiDung], [DiaChi], [NgaySinh], [SDT], [Email], [TrangThai], [HinhAnh], [IdCoSoThuY], [IdTaiKhoan]) VALUES (4, N'Trần Hoàng Bửu', N'Quang nam', CAST(N'1997-02-13' AS Date), N'0869610406', N'tranhoangbuu66@gmail.com', 1, N'imageemyeu181257916.jpg', 1, 15)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [TenNguoiDung], [DiaChi], [NgaySinh], [SDT], [Email], [TrangThai], [HinhAnh], [IdCoSoThuY], [IdTaiKhoan]) VALUES (13, N'Trần văn tuấn', N'Quang nam', CAST(N'1997-02-13' AS Date), N'0869610444', N'tranhoangbuu44@gmail.com', 1, N'imageemyeu181257916.jpg', 1, 22)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
SET IDENTITY_INSERT [dbo].[PhieuHenKham] ON 

INSERT [dbo].[PhieuHenKham] ([IdLichHenKham], [IdNguoiDung], [IdCoSoThuY], [NgayHenKham], [GioHenKham], [LyDoHenKham], [IdDichVu], [TinhTrang]) VALUES (11, 4, 1, CAST(N'2018-07-11' AS Date), CAST(N'12:12:00' AS Time), N'123123123213213', 2, 1)
INSERT [dbo].[PhieuHenKham] ([IdLichHenKham], [IdNguoiDung], [IdCoSoThuY], [NgayHenKham], [GioHenKham], [LyDoHenKham], [IdDichVu], [TinhTrang]) VALUES (12, 4, 1, CAST(N'2018-07-11' AS Date), CAST(N'12:12:00' AS Time), N'123123123213213', 2, 0)
INSERT [dbo].[PhieuHenKham] ([IdLichHenKham], [IdNguoiDung], [IdCoSoThuY], [NgayHenKham], [GioHenKham], [LyDoHenKham], [IdDichVu], [TinhTrang]) VALUES (13, 4, 1, CAST(N'2018-07-11' AS Date), CAST(N'12:12:00' AS Time), N'123123123213213', 2, 0)
INSERT [dbo].[PhieuHenKham] ([IdLichHenKham], [IdNguoiDung], [IdCoSoThuY], [NgayHenKham], [GioHenKham], [LyDoHenKham], [IdDichVu], [TinhTrang]) VALUES (15, 4, 1, CAST(N'2019-06-06' AS Date), CAST(N'05:30:00' AS Time), N'Hen kham choi', 1, 0)
SET IDENTITY_INSERT [dbo].[PhieuHenKham] OFF
SET IDENTITY_INSERT [dbo].[Quyen] ON 

INSERT [dbo].[Quyen] ([IdQuyen], [TenQuyen], [TrangThai]) VALUES (1, N'Admin', 1)
INSERT [dbo].[Quyen] ([IdQuyen], [TenQuyen], [TrangThai]) VALUES (2, N'Cơ sở thú cưng', 1)
INSERT [dbo].[Quyen] ([IdQuyen], [TenQuyen], [TrangThai]) VALUES (3, N'Người dùng', 1)
INSERT [dbo].[Quyen] ([IdQuyen], [TenQuyen], [TrangThai]) VALUES (4, N'Shop', 1)
SET IDENTITY_INSERT [dbo].[Quyen] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([IdSanPham], [TenSanPham], [IdLoaiSanPham], [IdShop], [Gia], [DacDiem], [NgayNhap], [TrangThai], [SoLuong]) VALUES (1, N'Chó husky', 1, 1, 100000, N'<p style="text-align: center;"><strong>ch&oacute; n&agrave;y thuộc loại ngu v&agrave; ng&aacute;o</strong></p>', CAST(N'2018-06-23' AS Date), 1, 89)
INSERT [dbo].[SanPham] ([IdSanPham], [TenSanPham], [IdLoaiSanPham], [IdShop], [Gia], [DacDiem], [NgayNhap], [TrangThai], [SoLuong]) VALUES (2, N'Chó huskyhhhhhh', 1, 1, 100000, N'ngu', CAST(N'2018-06-14' AS Date), 1, 88)
INSERT [dbo].[SanPham] ([IdSanPham], [TenSanPham], [IdLoaiSanPham], [IdShop], [Gia], [DacDiem], [NgayNhap], [TrangThai], [SoLuong]) VALUES (3, N'Chó husky', 3, 5, 100000, N'<p>N&oacute; ngu lắm</p>', CAST(N'2018-06-17' AS Date), 1, 90)
INSERT [dbo].[SanPham] ([IdSanPham], [TenSanPham], [IdLoaiSanPham], [IdShop], [Gia], [DacDiem], [NgayNhap], [TrangThai], [SoLuong]) VALUES (4, N'Mèo tuyết', 2, 1, 123123, N'<p style="text-align: center;" data-mce-style="text-align: center;"><strong>Meo tuyết</strong></p>', CAST(N'2018-07-20' AS Date), 1, 11)
INSERT [dbo].[SanPham] ([IdSanPham], [TenSanPham], [IdLoaiSanPham], [IdShop], [Gia], [DacDiem], [NgayNhap], [TrangThai], [SoLuong]) VALUES (5, N'Chó tây tạng', 1, 1, 123, N'<p>123</p>', CAST(N'2018-06-24' AS Date), 1, 101)
INSERT [dbo].[SanPham] ([IdSanPham], [TenSanPham], [IdLoaiSanPham], [IdShop], [Gia], [DacDiem], [NgayNhap], [TrangThai], [SoLuong]) VALUES (1004, N'sản phẩm vừa được sửa', 1, 1, 123, N'<p>123</p>', CAST(N'2018-06-22' AS Date), 1, 12)
INSERT [dbo].[SanPham] ([IdSanPham], [TenSanPham], [IdLoaiSanPham], [IdShop], [Gia], [DacDiem], [NgayNhap], [TrangThai], [SoLuong]) VALUES (1005, N'Vòng Tay', 3, 5, 199, N'<p style="text-align: center;"><strong>V&ograve;ng tay hiệu con c&aacute; ngựa</strong></p>', CAST(N'2018-06-25' AS Date), 1, 500)
INSERT [dbo].[SanPham] ([IdSanPham], [TenSanPham], [IdLoaiSanPham], [IdShop], [Gia], [DacDiem], [NgayNhap], [TrangThai], [SoLuong]) VALUES (1006, N'Vòng chân', 6, 5, 20, N'<p>V&ograve;ng ch&acirc;n hiệu durex</p>', CAST(N'2018-06-25' AS Date), 1, 500)
INSERT [dbo].[SanPham] ([IdSanPham], [TenSanPham], [IdLoaiSanPham], [IdShop], [Gia], [DacDiem], [NgayNhap], [TrangThai], [SoLuong]) VALUES (1007, N'ahoho', 1005, 6, 12, N'<p>ahoho</p>', CAST(N'2018-06-26' AS Date), 1, 490)
INSERT [dbo].[SanPham] ([IdSanPham], [TenSanPham], [IdLoaiSanPham], [IdShop], [Gia], [DacDiem], [NgayNhap], [TrangThai], [SoLuong]) VALUES (1008, N'nơ cho chó', 4, 1, 500, N'<p style="text-align: center;"><strong>nơ n&agrave;y c&oacute; định vị</strong></p>', CAST(N'2018-06-28' AS Date), 1, 502)
INSERT [dbo].[SanPham] ([IdSanPham], [TenSanPham], [IdLoaiSanPham], [IdShop], [Gia], [DacDiem], [NgayNhap], [TrangThai], [SoLuong]) VALUES (1009, N'túi sách dành cho chó', 1, 1, 200000, N'<p style="text-align: center;"><strong><em>t&uacute;i n&agrave;y đẹp lắm</em></strong></p>', CAST(N'2018-06-28' AS Date), 1, 501)
INSERT [dbo].[SanPham] ([IdSanPham], [TenSanPham], [IdLoaiSanPham], [IdShop], [Gia], [DacDiem], [NgayNhap], [TrangThai], [SoLuong]) VALUES (1010, N'Vòng cổ', 3, 5, 300000, N'<p>d&agrave;nh cho ch&oacute;</p>', CAST(N'2018-06-28' AS Date), 1, 500)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([IdShop], [TenShop], [DiaChi], [SDT], [Email], [DongYChinhSach], [PheDuyet], [TrangThai], [DoTinCay], [IdTaiKhoan]) VALUES (1, N'Typy', N'Dao Duy anh quan thanh khe da nang', N'0869610406', N'daoduyanh@gmail.com', 1, 1, 1, 100, 8)
INSERT [dbo].[Shop] ([IdShop], [TenShop], [DiaChi], [SDT], [Email], [DongYChinhSach], [PheDuyet], [TrangThai], [DoTinCay], [IdTaiKhoan]) VALUES (5, N'sudu', N'Dao Duy anh', N'0869610406', N'daoduyanh@gmail.com', 1, 1, 1, 100, 9)
INSERT [dbo].[Shop] ([IdShop], [TenShop], [DiaChi], [SDT], [Email], [DongYChinhSach], [PheDuyet], [TrangThai], [DoTinCay], [IdTaiKhoan]) VALUES (6, N'Shop vật dụng thú cưng', N'Huế', N'0869610403', N'tranvanhoangbuu@gmail.com', 1, 1, 1, 100, 13)
SET IDENTITY_INSERT [dbo].[Shop] OFF
SET IDENTITY_INSERT [dbo].[SucKhoeThuCung] ON 

INSERT [dbo].[SucKhoeThuCung] ([IdSKTC], [TenSKTC], [NgayThang], [MoTa], [NoiDung], [IdCoSoThuY], [TinhTrang], [ImageShow]) VALUES (13, N'Nào mình cùng rửa tay – Rửa tay đúng cách', CAST(N'2018-07-15' AS Date), N'Tại PetCare, các thiết bị y tế hiện đại được đầu tư nhằm phục vụ công tác chăm sóc vật nuôi. Khi cần thiết, các bác sĩ sẽ tiến hành các phương pháp chẩn đoán hình ảnh hoặc làm xét nghiệm để đưa ra hướng điều trị phù hợp với thú cưng của bạn.', N'Chẩn đoán hình ảnh
•   Siêu âm: Đây là phương pháp phổ biến dùng để đánh giá tình trạng sức khỏe vật nuôi và chẩn đoán bệnh trong các trường hợp mang thai, khối u, các bệnh ở vùng bụng và nhiều vấn đề khác.

•   Chụp X-quang: máy X-quang thường được dùng để phát hiện các vấn đề về xương khớp, khối u, các vật thể lạ trong cơ thể như sỏi thận hoặc dị vật đường ruột và chẩn đoán nhiều bệnh khác.
Các dịch vụ xét nghiệm
•    Xét nghiệm máu. 
•    Xét nghiệm virus. 
•    Xét nghiệm kháng thể dại 
•    Xét nghiệm nước tiểu. 
•    Xét nghiệm da. 
•    Xét nghiệm phân. 
•    Kháng sinh đồ.

Ngoài ra PetCare còn liên kết với các phòng xét nghiệm tại nước ngoài trong trường hợp thú cưng của bạn cần thêm xét nghiệm chuyên khoa khác.', 1, 1, N'giong-cho-184231831.jpg')
INSERT [dbo].[SucKhoeThuCung] ([IdSKTC], [TenSKTC], [NgayThang], [MoTa], [NoiDung], [IdCoSoThuY], [TinhTrang], [ImageShow]) VALUES (14, N'Nào mình cùng rửa tay – Rửa tay đúng cách', CAST(N'2018-07-15' AS Date), N'Tại PetCare, các thiết bị y tế hiện đại được đầu tư nhằm phục vụ công tác chăm sóc vật nuôi. Khi cần thiết, các bác sĩ sẽ tiến hành các phương pháp chẩn đoán hình ảnh hoặc làm xét nghiệm để đưa ra hướng điều trị phù hợp với thú cưng của bạn.', N'Chẩn đoán hình ảnh
•   Siêu âm: Đây là phương pháp phổ biến dùng để đánh giá tình trạng sức khỏe vật nuôi và chẩn đoán bệnh trong các trường hợp mang thai, khối u, các bệnh ở vùng bụng và nhiều vấn đề khác.

•   Chụp X-quang: máy X-quang thường được dùng để phát hiện các vấn đề về xương khớp, khối u, các vật thể lạ trong cơ thể như sỏi thận hoặc dị vật đường ruột và chẩn đoán nhiều bệnh khác.
Các dịch vụ xét nghiệm
•    Xét nghiệm máu. 
•    Xét nghiệm virus. 
•    Xét nghiệm kháng thể dại 
•    Xét nghiệm nước tiểu. 
•    Xét nghiệm da. 
•    Xét nghiệm phân. 
•    Kháng sinh đồ.

Ngoài ra PetCare còn liên kết với các phòng xét nghiệm tại nước ngoài trong trường hợp thú cưng của bạn cần thêm xét nghiệm chuyên khoa khác.', 1, 1, N'giong-cho-184238834.jpg')
INSERT [dbo].[SucKhoeThuCung] ([IdSKTC], [TenSKTC], [NgayThang], [MoTa], [NoiDung], [IdCoSoThuY], [TinhTrang], [ImageShow]) VALUES (15, N'Nào mình cùng rửa tay – Rửa tay đúng cách', CAST(N'2018-07-15' AS Date), N'Tại PetCare, các thiết bị y tế hiện đại được đầu tư nhằm phục vụ công tác chăm sóc vật nuôi. Khi cần thiết, các bác sĩ sẽ tiến hành các phương pháp chẩn đoán hình ảnh hoặc làm xét nghiệm để đưa ra hướng điều trị phù hợp với thú cưng của bạn.', N'Chẩn đoán hình ảnh
•   Siêu âm: Đây là phương pháp phổ biến dùng để đánh giá tình trạng sức khỏe vật nuôi và chẩn đoán bệnh trong các trường hợp mang thai, khối u, các bệnh ở vùng bụng và nhiều vấn đề khác.

•   Chụp X-quang: máy X-quang thường được dùng để phát hiện các vấn đề về xương khớp, khối u, các vật thể lạ trong cơ thể như sỏi thận hoặc dị vật đường ruột và chẩn đoán nhiều bệnh khác.
Các dịch vụ xét nghiệm
•    Xét nghiệm máu. 
•    Xét nghiệm virus. 
•    Xét nghiệm kháng thể dại 
•    Xét nghiệm nước tiểu. 
•    Xét nghiệm da. 
•    Xét nghiệm phân. 
•    Kháng sinh đồ.

Ngoài ra PetCare còn liên kết với các phòng xét nghiệm tại nước ngoài trong trường hợp thú cưng của bạn cần thêm xét nghiệm chuyên khoa khác.', 1, 1, N'giong-cho-184246124.jpg')
INSERT [dbo].[SucKhoeThuCung] ([IdSKTC], [TenSKTC], [NgayThang], [MoTa], [NoiDung], [IdCoSoThuY], [TinhTrang], [ImageShow]) VALUES (20, N'Nào mình cùng rửa tay – Rửa tay đúng cách', CAST(N'2018-07-19' AS Date), N'Tại PetCare, các thiết bị y tế hiện đại được đầu tư nhằm phục vụ công tác chăm sóc vật nuôi. Khi cần thiết, các bác sĩ sẽ tiến hành các phương pháp chẩn đoán hình ảnh hoặc làm xét nghiệm để đưa ra hướng điều trị phù hợp với thú cưng của bạn.', N'Chẩn đoán hình ảnh
•   Siêu âm: Đây là phương pháp phổ biến dùng để đánh giá tình trạng sức khỏe vật nuôi và chẩn đoán bệnh trong các trường hợp mang thai, khối u, các bệnh ở vùng bụng và nhiều vấn đề khác.

•   Chụp X-quang: máy X-quang thường được dùng để phát hiện các vấn đề về xương khớp, khối u, các vật thể lạ trong cơ thể như sỏi thận hoặc dị vật đường ruột và chẩn đoán nhiều bệnh khác.
Các dịch vụ xét nghiệm
•    Xét nghiệm máu. 
•    Xét nghiệm virus. 
•    Xét nghiệm kháng thể dại 
•    Xét nghiệm nước tiểu. 
•    Xét nghiệm da. 
•    Xét nghiệm phân. 
•    Kháng sinh đồ.

Ngoài ra PetCare còn liên kết với các phòng xét nghiệm tại nước ngoài trong trường hợp thú cưng của bạn cần thêm xét nghiệm chuyên khoa khác.', 1, 1, N'giong-cho-182227689.jpg')
SET IDENTITY_INSERT [dbo].[SucKhoeThuCung] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([IdTaiKhoan], [UserName], [Pass], [IdQuyen], [TrangThai]) VALUES (1, N'admin', N'123', 1, 1)
INSERT [dbo].[TaiKhoan] ([IdTaiKhoan], [UserName], [Pass], [IdQuyen], [TrangThai]) VALUES (4, N'thuy', N'123', 2, 1)
INSERT [dbo].[TaiKhoan] ([IdTaiKhoan], [UserName], [Pass], [IdQuyen], [TrangThai]) VALUES (8, N'typy', N'123', 4, 1)
INSERT [dbo].[TaiKhoan] ([IdTaiKhoan], [UserName], [Pass], [IdQuyen], [TrangThai]) VALUES (9, N'sudu', N'123', 4, 1)
INSERT [dbo].[TaiKhoan] ([IdTaiKhoan], [UserName], [Pass], [IdQuyen], [TrangThai]) VALUES (13, N'shopvatdungthucung', N'0403', 4, 1)
INSERT [dbo].[TaiKhoan] ([IdTaiKhoan], [UserName], [Pass], [IdQuyen], [TrangThai]) VALUES (15, N'tranhoangbuu', N'123', 3, 1)
INSERT [dbo].[TaiKhoan] ([IdTaiKhoan], [UserName], [Pass], [IdQuyen], [TrangThai]) VALUES (22, N'tranvantuan', N'123', 3, 1)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
SET IDENTITY_INSERT [dbo].[ThuCung] ON 

INSERT [dbo].[ThuCung] ([IdThuCung], [TenThuongGoi], [NgayNuoi], [IdGiongThuCung], [IdNguoiDung], [TrangThai]) VALUES (2, N'Huskey1', CAST(N'2017-07-15' AS Date), 1, 4, 1)
INSERT [dbo].[ThuCung] ([IdThuCung], [TenThuongGoi], [NgayNuoi], [IdGiongThuCung], [IdNguoiDung], [TrangThai]) VALUES (3, N'Huskey2', CAST(N'2017-07-16' AS Date), 1, 4, 1)
INSERT [dbo].[ThuCung] ([IdThuCung], [TenThuongGoi], [NgayNuoi], [IdGiongThuCung], [IdNguoiDung], [TrangThai]) VALUES (4, N'Huskey3', CAST(N'2017-07-17' AS Date), 1, 4, 1)
INSERT [dbo].[ThuCung] ([IdThuCung], [TenThuongGoi], [NgayNuoi], [IdGiongThuCung], [IdNguoiDung], [TrangThai]) VALUES (5, N'Huskey4', CAST(N'2017-07-18' AS Date), 1, 4, 1)
INSERT [dbo].[ThuCung] ([IdThuCung], [TenThuongGoi], [NgayNuoi], [IdGiongThuCung], [IdNguoiDung], [TrangThai]) VALUES (6, N'Huskey5', CAST(N'2017-07-15' AS Date), 1, 4, 1)
INSERT [dbo].[ThuCung] ([IdThuCung], [TenThuongGoi], [NgayNuoi], [IdGiongThuCung], [IdNguoiDung], [TrangThai]) VALUES (7, N'Huskey6', CAST(N'2017-07-15' AS Date), 1, 4, 1)
SET IDENTITY_INSERT [dbo].[ThuCung] OFF
SET IDENTITY_INSERT [dbo].[TinhTrang] ON 

INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (1, N'tốt', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 2, NULL)
INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (2, N'ăn ít', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 2, NULL)
INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (3, N'tốt', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 2, NULL)
INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (4, N'tốt', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 2, NULL)
INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (5, N'tốt', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 2, NULL)
INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (6, N'tốt', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 2, NULL)
INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (7, N'tốt', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 3, NULL)
INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (8, N'tốt', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 4, NULL)
INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (9, N'tốt', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 3, NULL)
INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (10, N'tốt', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 4, NULL)
INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (11, N'tốt', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 3, NULL)
INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (12, N'tốt', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 4, NULL)
INSERT [dbo].[TinhTrang] ([IdTinhTrang], [TinhTrang], [NgayCapNhat], [HinhAnh], [TrangThai], [IdThuCung], [LinkVideo]) VALUES (13, N'tốt', CAST(N'1997-01-01' AS Date), N'imageemyeu181257916.jpg', 1, 3, NULL)
SET IDENTITY_INSERT [dbo].[TinhTrang] OFF
/****** Object:  Index [IX_CoSoThuY]    Script Date: 9/12/2018 2:08:58 PM ******/
ALTER TABLE [dbo].[CoSoThuY] ADD  CONSTRAINT [IX_CoSoThuY] UNIQUE NONCLUSTERED 
(
	[IdTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_NguoiDung]    Script Date: 9/12/2018 2:08:58 PM ******/
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [IX_NguoiDung] UNIQUE NONCLUSTERED 
(
	[IdTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shop]    Script Date: 9/12/2018 2:08:58 PM ******/
ALTER TABLE [dbo].[Shop] ADD  CONSTRAINT [IX_Shop] UNIQUE NONCLUSTERED 
(
	[IdTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BaiViet_dbo.ChuyenMuc_IdChuyenMuc] FOREIGN KEY([IdChuyenMuc])
REFERENCES [dbo].[ChuyenMuc] ([IdChuyenMuc])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [FK_dbo.BaiViet_dbo.ChuyenMuc_IdChuyenMuc]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BaiViet_dbo.NguoiDung_IdNguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [FK_dbo.BaiViet_dbo.NguoiDung_IdNguoiDung]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BinhLuan_dbo.BaiViet_IdBaiViet] FOREIGN KEY([IdBaiViet])
REFERENCES [dbo].[BaiViet] ([IdBaiViet])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_dbo.BinhLuan_dbo.BaiViet_IdBaiViet]
GO
ALTER TABLE [dbo].[CanNang]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CanNang_dbo.ThuCung_IdThuCung] FOREIGN KEY([IdThuCung])
REFERENCES [dbo].[ThuCung] ([IdThuCung])
GO
ALTER TABLE [dbo].[CanNang] CHECK CONSTRAINT [FK_dbo.CanNang_dbo.ThuCung_IdThuCung]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([IdHoaDon])
REFERENCES [dbo].[HoaDon] ([IdHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([IdSanPham])
REFERENCES [dbo].[SanPham] ([IdSanPham])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[CoSoThuY]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CoSoThuY_dbo.TaiKhoan_IdTaiKhoan] FOREIGN KEY([IdTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([IdTaiKhoan])
GO
ALTER TABLE [dbo].[CoSoThuY] CHECK CONSTRAINT [FK_dbo.CoSoThuY_dbo.TaiKhoan_IdTaiKhoan]
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK_DichVu_CoSoThuY] FOREIGN KEY([IdCoSoThuY])
REFERENCES [dbo].[CoSoThuY] ([IdCoSoThuY])
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK_DichVu_CoSoThuY]
GO
ALTER TABLE [dbo].[GioiThieu]  WITH CHECK ADD  CONSTRAINT [FK_GioiThieu_CoSoThuY] FOREIGN KEY([IdCoSoThuY])
REFERENCES [dbo].[CoSoThuY] ([IdCoSoThuY])
GO
ALTER TABLE [dbo].[GioiThieu] CHECK CONSTRAINT [FK_GioiThieu_CoSoThuY]
GO
ALTER TABLE [dbo].[HinhAnhSanPham]  WITH CHECK ADD  CONSTRAINT [FK_HinhAnhSanPham_SanPham] FOREIGN KEY([IdSanPham])
REFERENCES [dbo].[SanPham] ([IdSanPham])
GO
ALTER TABLE [dbo].[HinhAnhSanPham] CHECK CONSTRAINT [FK_HinhAnhSanPham_SanPham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NguoiDung]
GO
ALTER TABLE [dbo].[HoatDong]  WITH CHECK ADD  CONSTRAINT [FK_HoatDong_CoSoThuY] FOREIGN KEY([IdCoSoThuY])
REFERENCES [dbo].[CoSoThuY] ([IdCoSoThuY])
GO
ALTER TABLE [dbo].[HoatDong] CHECK CONSTRAINT [FK_HoatDong_CoSoThuY]
GO
ALTER TABLE [dbo].[LichSuKham]  WITH CHECK ADD  CONSTRAINT [FK_LichSuKham_ThuCung] FOREIGN KEY([IdThuCung])
REFERENCES [dbo].[ThuCung] ([IdThuCung])
GO
ALTER TABLE [dbo].[LichSuKham] CHECK CONSTRAINT [FK_LichSuKham_ThuCung]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_BaiViet] FOREIGN KEY([IdBaiViet])
REFERENCES [dbo].[BaiViet] ([IdBaiViet])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_BaiViet]
GO
ALTER TABLE [dbo].[Like]  WITH CHECK ADD  CONSTRAINT [FK_Like_NguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[Like] CHECK CONSTRAINT [FK_Like_NguoiDung]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NguoiDung_dbo.CoSoThuY_IdCoSoThuY] FOREIGN KEY([IdCoSoThuY])
REFERENCES [dbo].[CoSoThuY] ([IdCoSoThuY])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_dbo.NguoiDung_dbo.CoSoThuY_IdCoSoThuY]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_dbo.NguoiDung_dbo.TaiKhoan_IdTaiKhoan] FOREIGN KEY([IdTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([IdTaiKhoan])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_dbo.NguoiDung_dbo.TaiKhoan_IdTaiKhoan]
GO
ALTER TABLE [dbo].[PhieuHenKham]  WITH CHECK ADD  CONSTRAINT [FK_PhieuHenKham_CoSoThuY] FOREIGN KEY([IdCoSoThuY])
REFERENCES [dbo].[CoSoThuY] ([IdCoSoThuY])
GO
ALTER TABLE [dbo].[PhieuHenKham] CHECK CONSTRAINT [FK_PhieuHenKham_CoSoThuY]
GO
ALTER TABLE [dbo].[PhieuHenKham]  WITH CHECK ADD  CONSTRAINT [FK_PhieuHenKham_NguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[PhieuHenKham] CHECK CONSTRAINT [FK_PhieuHenKham_NguoiDung]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([IdLoaiSanPham])
REFERENCES [dbo].[LoaiSanPham] ([IdLoaiSanPham])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Shop] FOREIGN KEY([IdShop])
REFERENCES [dbo].[Shop] ([IdShop])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Shop]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_TaiKhoan] FOREIGN KEY([IdTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([IdTaiKhoan])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_TaiKhoan]
GO
ALTER TABLE [dbo].[SucKhoeThuCung]  WITH CHECK ADD  CONSTRAINT [FK_SucKhoeThuCung_CoSoThuY] FOREIGN KEY([IdCoSoThuY])
REFERENCES [dbo].[CoSoThuY] ([IdCoSoThuY])
GO
ALTER TABLE [dbo].[SucKhoeThuCung] CHECK CONSTRAINT [FK_SucKhoeThuCung_CoSoThuY]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TaiKhoan_dbo.Quyen_IdQuyen] FOREIGN KEY([IdQuyen])
REFERENCES [dbo].[Quyen] ([IdQuyen])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_dbo.TaiKhoan_dbo.Quyen_IdQuyen]
GO
ALTER TABLE [dbo].[ThuCung]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ThuCung_dbo.GiongThuCung_IdGiongThuCung] FOREIGN KEY([IdGiongThuCung])
REFERENCES [dbo].[GiongThuCung] ([IdGiongThuCung])
GO
ALTER TABLE [dbo].[ThuCung] CHECK CONSTRAINT [FK_dbo.ThuCung_dbo.GiongThuCung_IdGiongThuCung]
GO
ALTER TABLE [dbo].[ThuCung]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ThuCung_dbo.NguoiDung_IdNguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[ThuCung] CHECK CONSTRAINT [FK_dbo.ThuCung_dbo.NguoiDung_IdNguoiDung]
GO
ALTER TABLE [dbo].[TinhTrang]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TinhTrang_dbo.ThuCung_IdThuCung] FOREIGN KEY([IdThuCung])
REFERENCES [dbo].[ThuCung] ([IdThuCung])
GO
ALTER TABLE [dbo].[TinhTrang] CHECK CONSTRAINT [FK_dbo.TinhTrang_dbo.ThuCung_IdThuCung]
GO
/****** Object:  StoredProcedure [dbo].[Hoa_Don_Theo_Thang]    Script Date: 9/12/2018 2:08:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Hoa_Don_Theo_Thang] @Thang INT, @IdShop INT
AS
BEGIN
	SELECT a.* 
	FROM dbo.HoaDon AS a 
	WHERE MONTH(NgayLapHoaDon) = @Thang AND a.IdShop = @IdShop
END


GO
/****** Object:  StoredProcedure [dbo].[Hoa_Don_Trong_Khoang_Thang]    Script Date: 9/12/2018 2:08:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Hoa_Don_Trong_Khoang_Thang] @TuThang INT, @DenThang INT, @IdShop INT
AS
BEGIN
	SELECT * 
	FROM dbo.HoaDon AS a 
	WHERE MONTH(NgayLapHoaDon) >= @TuThang AND MONTH(NgayLapHoaDon) <= @DenThang AND a.IdShop = @IdShop
END


GO
/****** Object:  StoredProcedure [dbo].[Lay_Ra_10_San_Pham_Max_Trong_Thang]    Script Date: 9/12/2018 2:08:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Lay_Ra_10_San_Pham_Max_Trong_Thang] @Thang int, @IdShop INT
AS
BEGIN
	SELECT TOP 10 a.IdSanPham, a.TenSanPham, a.Gia, COUNT(c.SoLuong) AS soluongban
	FROM dbo.SanPham AS a, dbo.HoaDon AS b, dbo.ChiTietHoaDon AS c 
	WHERE a.IdSanPham = c.IdSanPham AND b.IdHoaDon = c.IdHoaDon AND MONTH(b.NgayLapHoaDon)  = @Thang AND b.IdShop = @IdShop
	GROUP BY a.IdSanPham, a.TenSanPham, a.Gia, c.SoLuong
	ORDER BY c.SoLuong  DESC
END
GO
/****** Object:  StoredProcedure [dbo].[Lay_Ra_5_San_Pham_Max_Trong_Ngay]    Script Date: 9/12/2018 2:08:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Lay_Ra_5_San_Pham_Max_Trong_Ngay] @Ngay DATE, @IdShop INT
AS
BEGIN
	SELECT TOP 5 a.IdSanPham, a.TenSanPham, a.Gia, COUNT(c.SoLuong) AS soluongban
	FROM dbo.SanPham AS a, dbo.HoaDon AS b, dbo.ChiTietHoaDon AS c 
	WHERE a.IdSanPham = c.IdSanPham AND b.IdHoaDon = c.IdHoaDon AND b.NgayLapHoaDon = @Ngay AND b.IdShop = @IdShop
	GROUP BY a.IdSanPham, a.TenSanPham, a.Gia, c.SoLuong
	ORDER BY c.SoLuong  DESC
END
GO

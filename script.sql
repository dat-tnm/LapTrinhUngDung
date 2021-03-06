USE [master]
GO
/****** Object:  Database [QLBHang]    Script Date: 12/4/2021 9:53:54 AM ******/
CREATE DATABASE [QLBHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLBHang.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLBHang_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLBHang] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBHang] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBHang] SET  MULTI_USER 
GO
ALTER DATABASE [QLBHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLBHang] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBHang', N'ON'
GO
USE [QLBHang]
GO
/****** Object:  Table [dbo].[AUDIT_ChiTietHoaDon]    Script Date: 12/4/2021 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AUDIT_ChiTietHoaDon](
	[SoHD] [char](10) NOT NULL,
	[MaSPDV] [char](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [decimal](18, 0) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[Ngay] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AUDIT_CongTy]    Script Date: 12/4/2021 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AUDIT_CongTy](
	[MaCT] [char](10) NOT NULL,
	[Ten] [nvarchar](250) NOT NULL,
	[DiaChi] [nvarchar](250) NULL,
	[SDT] [nchar](20) NULL,
	[Fax] [nchar](20) NULL,
	[MaSoThue] [nchar](20) NULL,
	[ThaoTac] [char](10) NULL,
	[Ngay] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AUDIT_HoaDon]    Script Date: 12/4/2021 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AUDIT_HoaDon](
	[SoHD] [char](10) NOT NULL,
	[MaKH] [char](10) NOT NULL,
	[MaNV] [char](10) NOT NULL,
	[MaCT] [char](10) NOT NULL,
	[TenHD] [nvarchar](250) NULL,
	[NgayTao] [date] NULL,
	[ThaoTac] [char](10) NULL,
	[Ngay] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AUDIT_KhachHang]    Script Date: 12/4/2021 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AUDIT_KhachHang](
	[MaKH] [char](10) NOT NULL,
	[HoTen] [nvarchar](250) NULL,
	[TenCongTy] [nvarchar](250) NULL,
	[MaSoThue] [nchar](20) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[ThaoTac] [char](10) NULL,
	[Ngay] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AUDIT_NhanVien]    Script Date: 12/4/2021 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AUDIT_NhanVien](
	[MaNV] [char](10) NOT NULL,
	[HoTen] [nvarchar](250) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[Ngay] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AUDIT_SanPhamDV]    Script Date: 12/4/2021 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AUDIT_SanPhamDV](
	[MaSPDV] [char](10) NOT NULL,
	[Ten] [nvarchar](250) NOT NULL,
	[DVT] [nvarchar](250) NOT NULL,
	[DonGia] [decimal](18, 0) NOT NULL,
	[ThaoTac] [char](10) NULL,
	[Ngay] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/4/2021 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[SoHD] [char](10) NOT NULL,
	[MaSPDV] [char](10) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[SoHD] ASC,
	[MaSPDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CongTy]    Script Date: 12/4/2021 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CongTy](
	[MaCT] [char](10) NOT NULL,
	[Ten] [nvarchar](250) NOT NULL,
	[DiaChi] [nvarchar](250) NULL,
	[SDT] [nchar](20) NULL,
	[Fax] [nchar](20) NULL,
	[MaSoThue] [nchar](20) NULL,
 CONSTRAINT [PK_CongTy] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/4/2021 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[SoHD] [char](10) NOT NULL,
	[MaKH] [char](10) NOT NULL,
	[MaNV] [char](10) NOT NULL,
	[MaCT] [char](10) NOT NULL,
	[TenHD] [nvarchar](250) NULL,
	[NgayTao] [date] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[SoHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/4/2021 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [char](10) NOT NULL,
	[HoTen] [nvarchar](250) NULL,
	[TenCongTy] [nvarchar](250) NULL,
	[MaSoThue] [nchar](20) NULL,
	[DiaChi] [nvarchar](250) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/4/2021 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [char](10) NOT NULL,
	[HoTen] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPhamDV]    Script Date: 12/4/2021 9:53:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPhamDV](
	[MaSPDV] [char](10) NOT NULL,
	[Ten] [nvarchar](250) NOT NULL,
	[DVT] [nvarchar](250) NOT NULL,
	[DonGia] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_SanPhamDV] PRIMARY KEY CLUSTERED 
(
	[MaSPDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD05      ', N'SP02      ', 7, CAST(180000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-02-28 22:21:08.430' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD05      ', N'SP01      ', 7, CAST(180000 AS Decimal(18, 0)), N'I         ', CAST(N'2021-02-28 22:22:22.940' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD05      ', N'SP01      ', 7, CAST(180000 AS Decimal(18, 0)), N'D         ', CAST(N'2021-02-28 22:22:52.867' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'SP01      ', 2, CAST(200000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-17 10:03:51.630' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'SP02      ', 2, CAST(70000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-17 10:03:51.633' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'DV01      ', 5, CAST(20000 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-17 10:03:51.637' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'DV01      ', 5, CAST(20000 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-17 10:17:11.537' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'DV01      ', 5, CAST(20000 AS Decimal(18, 0)), N'D         ', CAST(N'2021-03-17 10:37:59.410' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'DV01      ', 5, CAST(20000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-17 10:40:24.213' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'SP02      ', 2, CAST(70000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-17 10:40:24.213' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'DV01      ', 5, CAST(20000 AS Decimal(18, 0)), N'D         ', CAST(N'2021-03-17 10:40:24.213' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'SP01      ', 8, CAST(200000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-17 10:40:45.957' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'SP02      ', 2, CAST(70000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-17 10:40:45.960' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'SP01      ', 8, CAST(200000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-17 10:41:08.537' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'SP02      ', 2, CAST(70000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-17 10:41:08.537' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'oko       ', 2, CAST(12 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-17 10:41:08.540' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'DV01      ', 3, CAST(20000 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-18 21:49:29.447' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'DV01      ', 5, CAST(20000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-18 21:52:53.637' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'DV02      ', 2, CAST(30000 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-18 21:52:53.643' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'DV01      ', 7, CAST(20000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-18 21:53:16.457' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'DV01      ', 10, CAST(20000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-18 21:53:36.050' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'DV02      ', 2, CAST(30000 AS Decimal(18, 0)), N'D         ', CAST(N'2021-03-18 21:58:29.330' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'DV01      ', 10, CAST(20000 AS Decimal(18, 0)), N'D         ', CAST(N'2021-03-18 21:58:29.330' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'oko       ', 2, CAST(12 AS Decimal(18, 0)), N'D         ', CAST(N'2021-03-18 22:01:26.067' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'SP01      ', 8, CAST(200000 AS Decimal(18, 0)), N'D         ', CAST(N'2021-03-18 22:01:40.737' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'DV01      ', 8, CAST(20000 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-18 22:09:01.737' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'oko       ', 2, CAST(12 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-18 22:09:01.737' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'oko       ', 4, CAST(12 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-18 22:28:03.080' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'SP02      ', 2, CAST(70000 AS Decimal(18, 0)), N'D         ', CAST(N'2021-03-18 22:28:03.087' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'SP01      ', 6, CAST(200000 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-19 10:31:23.280' AS DateTime))
INSERT [dbo].[AUDIT_ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'DV03      ', 3, CAST(10000 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-19 10:31:23.280' AS DateTime))
INSERT [dbo].[AUDIT_CongTy] ([MaCT], [Ten], [DiaChi], [SDT], [Fax], [MaSoThue], [ThaoTac], [Ngay]) VALUES (N'CT06      ', N'abc', N'foasj', N'2421                ', N'2141241             ', N'124124              ', N'I         ', CAST(N'2021-03-01 09:32:06.723' AS DateTime))
INSERT [dbo].[AUDIT_CongTy] ([MaCT], [Ten], [DiaChi], [SDT], [Fax], [MaSoThue], [ThaoTac], [Ngay]) VALUES (N'oiko      ', N'ko', N'ko', N'ko                  ', N'oko                 ', N'o                   ', N'I         ', CAST(N'2021-03-08 09:45:18.260' AS DateTime))
INSERT [dbo].[AUDIT_CongTy] ([MaCT], [Ten], [DiaChi], [SDT], [Fax], [MaSoThue], [ThaoTac], [Ngay]) VALUES (N'oiko      ', N'ko', N'ko', N'ko                  ', N'oko                 ', N'o                   ', N'D         ', CAST(N'2021-03-08 10:01:58.560' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'HD06      ', N'KH05      ', N'NV05      ', N'CT05      ', N'Hóa odnod', CAST(N'2021-01-03' AS Date), N'I         ', CAST(N'2021-03-01 09:32:38.060' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-17' AS Date), N'I         ', CAST(N'2021-03-17 09:32:22.373' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-02-22' AS Date), N'U         ', CAST(N'2021-03-17 10:02:20.860' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-02-22' AS Date), N'U         ', CAST(N'2021-03-17 10:03:51.620' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-18' AS Date), N'I         ', CAST(N'2021-03-18 21:49:11.857' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-18' AS Date), N'U         ', CAST(N'2021-03-18 21:49:29.423' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-18' AS Date), N'U         ', CAST(N'2021-03-18 21:49:59.037' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-18' AS Date), N'U         ', CAST(N'2021-03-18 21:51:35.267' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-18' AS Date), N'U         ', CAST(N'2021-03-18 21:52:53.623' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-18' AS Date), N'U         ', CAST(N'2021-03-18 21:53:16.453' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-18' AS Date), N'U         ', CAST(N'2021-03-18 21:53:36.047' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-18' AS Date), N'U         ', CAST(N'2021-03-18 21:53:43.427' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-18' AS Date), N'D         ', CAST(N'2021-03-18 21:58:29.333' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-02-22' AS Date), N'U         ', CAST(N'2021-03-18 22:01:26.060' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-02-22' AS Date), N'U         ', CAST(N'2021-03-18 22:01:40.730' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-02-22' AS Date), N'U         ', CAST(N'2021-03-18 22:09:01.727' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-19' AS Date), N'I         ', CAST(N'2021-03-19 10:22:14.117' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-19' AS Date), N'U         ', CAST(N'2021-03-19 10:31:23.273' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-17' AS Date), N'U         ', CAST(N'2021-03-17 10:17:11.530' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-17' AS Date), N'U         ', CAST(N'2021-03-17 10:20:46.297' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-17' AS Date), N'U         ', CAST(N'2021-03-17 10:23:12.350' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-17' AS Date), N'U         ', CAST(N'2021-03-17 10:26:19.317' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-17' AS Date), N'U         ', CAST(N'2021-03-17 10:27:52.290' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-17' AS Date), N'U         ', CAST(N'2021-03-17 10:28:39.260' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-17' AS Date), N'U         ', CAST(N'2021-03-17 10:31:59.240' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-17' AS Date), N'U         ', CAST(N'2021-03-17 10:33:23.003' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-17' AS Date), N'U         ', CAST(N'2021-03-17 10:37:52.470' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-02-22' AS Date), N'U         ', CAST(N'2021-03-17 10:40:24.210' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-02-22' AS Date), N'U         ', CAST(N'2021-03-17 10:40:45.957' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-02-22' AS Date), N'U         ', CAST(N'2021-03-17 10:41:08.537' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-17' AS Date), N'D         ', CAST(N'2021-03-17 10:45:28.140' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'HD06      ', N'KH05      ', N'NV05      ', N'CT05      ', N'Hóa odnod', CAST(N'2021-01-03' AS Date), N'D         ', CAST(N'2021-03-17 10:49:30.670' AS DateTime))
INSERT [dbo].[AUDIT_HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao], [ThaoTac], [Ngay]) VALUES (N'HD01      ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-02-22' AS Date), N'U         ', CAST(N'2021-03-18 22:28:03.070' AS DateTime))
INSERT [dbo].[AUDIT_KhachHang] ([MaKH], [HoTen], [TenCongTy], [MaSoThue], [DiaChi], [ThaoTac], [Ngay]) VALUES (N'KH06      ', N'tanto', N'tôtn', N'006                 ', N'fasfas', N'I         ', CAST(N'2021-03-01 09:33:27.300' AS DateTime))
INSERT [dbo].[AUDIT_KhachHang] ([MaKH], [HoTen], [TenCongTy], [MaSoThue], [DiaChi], [ThaoTac], [Ngay]) VALUES (N'ok        ', N'ok', N'ok', N'ôko                 ', N'ko', N'I         ', CAST(N'2021-03-08 09:45:32.260' AS DateTime))
INSERT [dbo].[AUDIT_KhachHang] ([MaKH], [HoTen], [TenCongTy], [MaSoThue], [DiaChi], [ThaoTac], [Ngay]) VALUES (N'ok        ', N'230', N'ok', N'ôko                 ', N'ko', N'U         ', CAST(N'2021-03-08 10:07:17.757' AS DateTime))
INSERT [dbo].[AUDIT_KhachHang] ([MaKH], [HoTen], [TenCongTy], [MaSoThue], [DiaChi], [ThaoTac], [Ngay]) VALUES (N'ok        ', N'230', N'ok', N'ôko                 ', N'ko', N'D         ', CAST(N'2021-03-08 10:07:25.337' AS DateTime))
INSERT [dbo].[AUDIT_NhanVien] ([MaNV], [HoTen], [ThaoTac], [Ngay]) VALUES (N'haha      ', N'hihi', N'I         ', CAST(N'2021-03-07 17:09:35.380' AS DateTime))
INSERT [dbo].[AUDIT_NhanVien] ([MaNV], [HoTen], [ThaoTac], [Ngay]) VALUES (N'haha      ', N'hihi3', N'U         ', CAST(N'2021-03-07 17:10:20.100' AS DateTime))
INSERT [dbo].[AUDIT_NhanVien] ([MaNV], [HoTen], [ThaoTac], [Ngay]) VALUES (N'haha      ', N'hihi3', N'D         ', CAST(N'2021-03-07 17:10:24.350' AS DateTime))
INSERT [dbo].[AUDIT_NhanVien] ([MaNV], [HoTen], [ThaoTac], [Ngay]) VALUES (N'oko       ', N'ko', N'I         ', CAST(N'2021-03-08 09:45:58.103' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'SP03      ', N'03', N'1 kg', CAST(45000 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-05 10:34:16.123' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'SP03      ', N'03', N'1 kg', CAST(45000 AS Decimal(18, 0)), N'D         ', CAST(N'2021-03-05 11:05:11.933' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'SP02      ', N'Vé tàu', N'1 vé', CAST(60000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-05 11:30:52.957' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'SP03      ', N'ba', N'ba', CAST(6969 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-05 11:31:34.017' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'SP03      ', N'ba', N'ba', CAST(6969 AS Decimal(18, 0)), N'D         ', CAST(N'2021-03-05 11:31:42.320' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'sp03      ', N'33', N'3', CAST(3 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-07 17:01:38.373' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'sp03      ', N'33', N'3', CAST(3 AS Decimal(18, 0)), N'D         ', CAST(N'2021-03-07 17:02:00.147' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'SP02      ', N'Vé tàu', N'1 vé', CAST(69000 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-07 17:02:08.607' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'jj        ', N'jj', N'jj', CAST(2 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-12 08:32:45.973' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'jj        ', N'jj', N'jj', CAST(2 AS Decimal(18, 0)), N'D         ', CAST(N'2021-03-12 08:45:19.683' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'oko       ', N'koko', N'koko', CAST(12 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-12 08:48:43.150' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'ff        ', N'ff', N'ff', CAST(2 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-12 09:27:56.867' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'ff        ', N'ff', N'ff', CAST(277 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-12 09:28:03.863' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'ff        ', N'ff', N'ff', CAST(277 AS Decimal(18, 0)), N'D         ', CAST(N'2021-03-12 09:31:20.703' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'oko       ', N'koko', N'koko', CAST(1 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-08 09:46:16.507' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'sppd      ', N'sadsa', N'ád', CAST(2 AS Decimal(18, 0)), N'I         ', CAST(N'2021-03-08 10:13:03.423' AS DateTime))
INSERT [dbo].[AUDIT_SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia], [ThaoTac], [Ngay]) VALUES (N'sppd      ', N'sadsa', N'ád', CAST(2666666 AS Decimal(18, 0)), N'U         ', CAST(N'2021-03-08 10:13:10.557' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia]) VALUES (N'aaa       ', N'DV03      ', 3, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia]) VALUES (N'aaa       ', N'SP01      ', 6, CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia]) VALUES (N'HD01      ', N'DV01      ', 8, CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia]) VALUES (N'HD01      ', N'oko       ', 4, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia]) VALUES (N'HD02      ', N'DV01      ', 3, CAST(19000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia]) VALUES (N'HD03      ', N'DV02      ', 4, CAST(29000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia]) VALUES (N'HD04      ', N'DV03      ', 1, CAST(9000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietHoaDon] ([SoHD], [MaSPDV], [SoLuong], [DonGia]) VALUES (N'HD05      ', N'SP02      ', 7, CAST(180000 AS Decimal(18, 0)))
INSERT [dbo].[CongTy] ([MaCT], [Ten], [DiaChi], [SDT], [Fax], [MaSoThue]) VALUES (N'CT01      ', N'Grab Hà Nội', N'69 Bà Triệu, Hà Nội', N'111101              ', N'2103910             ', N'102930123           ')
INSERT [dbo].[CongTy] ([MaCT], [Ten], [DiaChi], [SDT], [Fax], [MaSoThue]) VALUES (N'CT02      ', N'Grab Hải Phòng', N'89 Đống Đa, Hải Phòng', N'01239               ', N'21049012            ', N'012490124           ')
INSERT [dbo].[CongTy] ([MaCT], [Ten], [DiaChi], [SDT], [Fax], [MaSoThue]) VALUES (N'CT03      ', N'Grab Đà Nẵng', N'72 Hùng Vương, Đà Nẵng', N'203910              ', N'12093012            ', N'102390123           ')
INSERT [dbo].[CongTy] ([MaCT], [Ten], [DiaChi], [SDT], [Fax], [MaSoThue]) VALUES (N'CT04      ', N'Grab Huế', N'2 Hồ Đắc Di', N'23012               ', N'21043910            ', N'12049102            ')
INSERT [dbo].[CongTy] ([MaCT], [Ten], [DiaChi], [SDT], [Fax], [MaSoThue]) VALUES (N'CT05      ', N'Grab HCM', N'249 Đoàn Thị Điểm, Tân Phú, Sài Gòn', N'120391              ', N'210930129           ', N'35930490            ')
INSERT [dbo].[CongTy] ([MaCT], [Ten], [DiaChi], [SDT], [Fax], [MaSoThue]) VALUES (N'CT06      ', N'abc', N'foasj', N'2421                ', N'2141241             ', N'124124              ')
INSERT [dbo].[HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao]) VALUES (N'aaa       ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-03-19' AS Date))
INSERT [dbo].[HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao]) VALUES (N'HD01      ', N'KH01      ', N'NV01      ', N'CT01      ', N'HD mua hang', CAST(N'2021-02-22' AS Date))
INSERT [dbo].[HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao]) VALUES (N'HD02      ', N'KH02      ', N'NV02      ', N'CT02      ', N'Hóa đơn hai', CAST(N'2021-02-22' AS Date))
INSERT [dbo].[HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao]) VALUES (N'HD03      ', N'KH03      ', N'NV03      ', N'CT03      ', N'Hóa đơn ba', CAST(N'2021-03-23' AS Date))
INSERT [dbo].[HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao]) VALUES (N'HD04      ', N'KH04      ', N'NV04      ', N'CT04      ', N'Hóa đơn bốn', CAST(N'2021-04-30' AS Date))
INSERT [dbo].[HoaDon] ([SoHD], [MaKH], [MaNV], [MaCT], [TenHD], [NgayTao]) VALUES (N'HD05      ', N'KH05      ', N'NV05      ', N'CT05      ', N'Hóa đơn năm', CAST(N'2021-05-01' AS Date))
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TenCongTy], [MaSoThue], [DiaChi]) VALUES (N'KH01      ', N'Nguyễn Văn A', N'Hợp Tác Xã', N'001                 ', N'1 Ngự Bình')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TenCongTy], [MaSoThue], [DiaChi]) VALUES (N'KH02      ', N'Nguyễn Văn B', N'Vin', N'002                 ', N'2 Hồ Đắc Di')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TenCongTy], [MaSoThue], [DiaChi]) VALUES (N'KH03      ', N'Nguyễn Văn C', N'Vinamiu', N'003                 ', N'3 Hùng Vương')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TenCongTy], [MaSoThue], [DiaChi]) VALUES (N'KH04      ', N'Trần Thị D', N'Vietcom', N'004                 ', N'24 Bà Triệu')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TenCongTy], [MaSoThue], [DiaChi]) VALUES (N'KH05      ', N'Trần Thị E', N'Techcom', N'005                 ', N'54 An Dương Vương')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TenCongTy], [MaSoThue], [DiaChi]) VALUES (N'KH06      ', N'tanto', N'tôtn', N'006                 ', N'fasfas')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen]) VALUES (N'NV01      ', N'Donald Duck')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen]) VALUES (N'NV02      ', N'Micky Mouse')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen]) VALUES (N'NV03      ', N'Tom Cat')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen]) VALUES (N'NV04      ', N'Jerry Mouse')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen]) VALUES (N'NV05      ', N'Miss Barbie')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen]) VALUES (N'oko       ', N'ko')
INSERT [dbo].[SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia]) VALUES (N'DV01      ', N'Vận chuyển Grabbike', N'1km', CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia]) VALUES (N'DV02      ', N'Vận chuyển Grabcar', N'1km', CAST(30000 AS Decimal(18, 0)))
INSERT [dbo].[SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia]) VALUES (N'DV03      ', N'Ship hàng', N'1km', CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia]) VALUES (N'oko       ', N'koko', N'koko', CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia]) VALUES (N'SP01      ', N'Vé máy bay', N'1 vé', CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia]) VALUES (N'SP02      ', N'Vé tàu', N'1 vé', CAST(69000 AS Decimal(18, 0)))
INSERT [dbo].[SanPhamDV] ([MaSPDV], [Ten], [DVT], [DonGia]) VALUES (N'sppd      ', N'sadsa', N'ád', CAST(2666666 AS Decimal(18, 0)))
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HoaDon] FOREIGN KEY([SoHD])
REFERENCES [dbo].[HoaDon] ([SoHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPhamDV] FOREIGN KEY([MaSPDV])
REFERENCES [dbo].[SanPhamDV] ([MaSPDV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPhamDV]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_CongTy] FOREIGN KEY([MaCT])
REFERENCES [dbo].[CongTy] ([MaCT])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_CongTy]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
/****** Object:  StoredProcedure [dbo].[ChiTietHoaDon_Delete]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietHoaDon_Delete]
@soHD CHAR(10),
@maSPDV CHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM dbo.ChiTietHoaDon
	WHERE SoHD = @soHD and MaSPDV = @maSPDV
END

GO
/****** Object:  StoredProcedure [dbo].[ChiTietHoaDon_Insert]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ChiTietHoaDon_Insert]
@soHD char(10),
@maSPDV char(10),
@soLuong INT,
@donGia DECIMAL
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO dbo.ChiTietHoaDon
	        ( SoHD, MaSPDV, SoLuong, DonGia )
	VALUES  ( @soHD, -- SoHD - char(10)
	          @maSPDV, -- MaSPDV - char(10)
	          @soLuong, -- SoLuong - int
	          @donGia  -- DonGia - decimal
	          )
END

GO
/****** Object:  StoredProcedure [dbo].[ChiTietHoaDon_SelectAll]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ChiTietHoaDon_SelectAll]
AS
	SELECT *
	FROM ChiTietHoaDon

GO
/****** Object:  StoredProcedure [dbo].[ChiTietHoaDon_SelectWhereId]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietHoaDon_SelectWhereId]
@soHD CHAR(10)
AS
	SELECT ct.MaSPDV as [Mã hàng], SanPhamDV.Ten as [Tên hàng], SanPhamDV.DVT, ct.DonGia as [Đơn giá], ct.SoLuong as [Số lượng], (ct.DonGia*ct.SoLuong) as [Thành tiền]
	FROM dbo.ChiTietHoaDon as ct inner join SanPhamDV on ct.MaSPDV = SanPhamDV.MaSPDV
	WHERE ct.SoHD = @soHD
GO
/****** Object:  StoredProcedure [dbo].[ChiTietHoaDon_Update]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietHoaDon_Update]
@soHD char(10),
@maSPDV char(10),
@soLuong INT,
@donGia DECIMAL
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE dbo.ChiTietHoaDon
	SET SoLuong = @soLuong, DonGia = @donGia
	WHERE SoHD = @soHD AND MaSPDV = @maSPDV
		
END
GO
/****** Object:  StoredProcedure [dbo].[CongTy_Delete]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CongTy_Delete]
@maCT CHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM dbo.CongTy
	WHERE MaCT = @maCT
END

GO
/****** Object:  StoredProcedure [dbo].[CongTy_Insert]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CongTy_Insert]
@maCT char(10),
@ten nvarchar(250),
@diaChi nvarchar(250),
@SDT nchar(20),
@fax nchar(20),
@maSoThue nchar(20)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO dbo.CongTy
	        ( MaCT, Ten, DiaChi, SDT, Fax, MaSoThue )
	VALUES  ( @maCT, -- MaCT - char(10)
	          @ten, -- Ten - nvarchar(250)
	          @diaChi, -- DiaChi - nvarchar(250)
	          @SDT, -- SDT - nchar(20)
	          @fax, -- Fax - nchar(20)
	          @maSoThue  -- MaSoThue - nchar(20)
	          )
END

GO
/****** Object:  StoredProcedure [dbo].[CongTy_SelectAll]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CongTy_SelectAll]
AS
	SELECT *
	FROM dbo.CongTy

GO
/****** Object:  StoredProcedure [dbo].[CongTy_SelectWhereId]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CongTy_SelectWhereId]
@maCT CHAR(10)
AS
	SELECT *
	FROM dbo.CongTy
	WHERE MaCT = @maCT

GO
/****** Object:  StoredProcedure [dbo].[CongTy_Update]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CongTy_Update]
@maCT char(10),
@ten nvarchar(250),
@diaChi nvarchar(250),
@SDT nchar(20),
@fax nchar(20),
@maSoThue nchar(20)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE dbo.CongTy
	SET	Ten = @ten, DiaChi = @diaChi, SDT = @SDT, Fax = @fax, MaSoThue = @maSoThue
	WHERE MaCT = @maCT
END

GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Delete]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HoaDon_Delete]
@soHD CHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM dbo.HoaDon
	WHERE SoHD = @soHD
END

GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Insert]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HoaDon_Insert]
@soHD char(10),
@maKH char(10),
@maNV char(10),
@maCT char(10),
@tenHD nvarchar(250)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO dbo.HoaDon
	        ( SoHD, MaKH, MaNV, MaCT, TenHD, NgayTao )
	VALUES  ( @soHD, -- SoHD - char(10)
	          @maKH, -- MaKH - char(10)
	          @maNV, -- MaNV - char(10)
	          @maCT, -- MaCT - char(10)
	          @tenHD, -- TenHD - nvarchar(250)
	          GETDATE()  -- NgayTao - date
	          )
END

GO
/****** Object:  StoredProcedure [dbo].[HoaDon_SelectAll]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HoaDon_SelectAll]
AS
	SELECT KhachHang.HoTen as [Tên khách hàng], HoaDon.SoHD as [Số hóa đơn], HoaDon.NgayTao, NhanVien.HoTen as [Tên nhân viên]
	FROM dbo.HoaDon inner join NhanVien on HoaDon.MaNV = NhanVien.MaNV
	inner join KhachHang on HoaDon.MaKH = KhachHang.MaKH
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_SelectWhereId]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[HoaDon_SelectWhereId]
@soHD CHAR(10)
AS
	SELECT *
	FROM HoaDon as hd 
	inner join CongTy on CongTy.MaCT = hd.MaCT
	inner join KhachHang on KhachHang.MaKH = hd.MaKH
	inner join NhanVien on NhanVien.MaNV = hd.MaNV
	inner join ChiTietHoaDon as cthd on hd.SoHD = cthd.SoHD
	inner join SanPhamDV as sp on sp.MaSPDV = cthd.MaSPDV
	WHERE hd.SoHD = @soHD
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Update]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HoaDon_Update]
@soHD char(10),
@maKH char(10),
@maNV char(10),
@maCT char(10),
@tenHD nvarchar(250)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE dbo.HoaDon
	SET MaKH = @maKH, MaNV = @maNV, MaCT = @maCT, TenHD = @tenHD
	WHERE SoHD = @soHD
END

GO
/****** Object:  StoredProcedure [dbo].[KhachHang_Delete]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[KhachHang_Delete]
@maKH CHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM dbo.KhachHang
	WHERE MaKH = @maKH
END

GO
/****** Object:  StoredProcedure [dbo].[KhachHang_Insert]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[KhachHang_Insert]
@maKH CHAR(10),
@hoTen NVARCHAR(250),
@tenCongTy nvarchar(250),
@maSoThue nchar(20),
@diaChi nvarchar(250)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO dbo.KhachHang
	        ( MaKH ,
	          HoTen ,
	          TenCongTy ,
	          MaSoThue ,
	          DiaChi
	        )
	VALUES  ( @maKH , -- MaKH - char(10)
	          @hoTen , -- HoTen - nvarchar(250)
	          @tenCongTy , -- TenCongTy - nvarchar(250)
	          @maSoThue , -- MaSoThue - nchar(20)
	          @diaChi  -- DiaChi - nvarchar(250)
	        )
END

GO
/****** Object:  StoredProcedure [dbo].[KhachHang_SelectAll]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[KhachHang_SelectAll]
AS
	SELECT *
	FROM dbo.KhachHang

GO
/****** Object:  StoredProcedure [dbo].[KhachHang_SelectWhereId]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[KhachHang_SelectWhereId]
@maKH CHAR(10)
AS
	SELECT *
	FROM dbo.KhachHang
	WHERE dbo.KhachHang.MaKH = @maKH

GO
/****** Object:  StoredProcedure [dbo].[KhachHang_Update]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[KhachHang_Update]
@maKH CHAR(10),
@hoTen NVARCHAR(250),
@tenCongTy nvarchar(250),
@maSoThue nchar(20),
@diaChi nvarchar(250)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE dbo.KhachHang
	SET HoTen = @hoTen, TenCongTy = @tenCongTy, MaSoThue = @maSoThue, DiaChi = @diaChi
	WHERE MaKH = @maKH
END

GO
/****** Object:  StoredProcedure [dbo].[NhanVien_Delete]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NhanVien_Delete]
@maNV CHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM dbo.NhanVien
	WHERE MaNV = @maNV
END

GO
/****** Object:  StoredProcedure [dbo].[NhanVien_Insert]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NhanVien_Insert]
@maNV CHAR(10),
@hoTen NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO dbo.NhanVien
	        ( MaNV, HoTen )
	VALUES  ( @maNV, -- MaNV - char(10)
	          @hoTen  -- HoTen - nvarchar(250)
	          )
END

GO
/****** Object:  StoredProcedure [dbo].[NhanVien_SelectAll]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NhanVien_SelectAll]
AS
	SELECT *
	FROM dbo.NhanVien

GO
/****** Object:  StoredProcedure [dbo].[NhanVien_SelectWhereId]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NhanVien_SelectWhereId]
@maNV CHAR(10)
AS
	SELECT *
	FROM dbo.NhanVien
	WHERE dbo.NhanVien.MaNV = @maNV

GO
/****** Object:  StoredProcedure [dbo].[NhanVien_Update]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NhanVien_Update]
@maNV CHAR(10),
@hoTen NVARCHAR(250)
AS
BEGIN
	SET NOCOUNT ON

	UPDATE dbo.NhanVien
	SET	HoTen = @hoTen
	WHERE MaNV = @maNV
END

GO
/****** Object:  StoredProcedure [dbo].[SanPhamDV_Delete]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SanPhamDV_Delete]
@maSPDV CHAR(10)
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM dbo.SanPhamDV
	WHERE MaSPDV = @maSPDV
END

GO
/****** Object:  StoredProcedure [dbo].[SanPhamDV_Insert]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SanPhamDV_Insert]
@maSPDV CHAR(10),
@ten nvarchar(250),
@DVT nvarchar(250),
@donGia decimal
AS
BEGIN
	SET NOCOUNT ON

	INSERT INTO dbo.SanPhamDV
	        ( MaSPDV, Ten, DVT, DonGia )
	VALUES  ( @maSPDV, -- MaSPDV - char(10)
	          @ten, -- Ten - nvarchar(250)
	          @DVT, -- DVT - nvarchar(250)
	          @donGia  -- DonGia - decimal
	          )
END

GO
/****** Object:  StoredProcedure [dbo].[SanPhamDV_SelectAll]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SanPhamDV_SelectAll]
AS
	SELECT *
	FROM dbo.SanPhamDV

GO
/****** Object:  StoredProcedure [dbo].[SanPhamDV_SelectWhereId]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SanPhamDV_SelectWhereId]
@maSPDV CHAR(10)
AS
	SELECT *
	FROM dbo.SanPhamDV
	WHERE MaSPDV = @maSPDV

GO
/****** Object:  StoredProcedure [dbo].[SanPhamDV_Update]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SanPhamDV_Update]
@maSPDV CHAR(10),
@ten nvarchar(250),
@DVT nvarchar(250),
@donGia decimal
AS
BEGIN
	SET NOCOUNT ON

	UPDATE dbo.SanPhamDV
	SET	Ten = @ten, DVT = @DVT, DonGia = @donGia
	WHERE MaSPDV = @maSPDV
END

GO
/****** Object:  Trigger [dbo].[ChiTietHoaDon_Deleted]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ChiTietHoaDon_Deleted] ON [dbo].[ChiTietHoaDon] 
	FOR DELETE
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_ChiTietHoaDon SELECT *, 'D', GETDATE() FROM Deleted
END

GO
/****** Object:  Trigger [dbo].[ChiTietHoaDon_Inserted]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ChiTietHoaDon_Inserted] ON [dbo].[ChiTietHoaDon] 
	FOR INSERT
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_ChiTietHoaDon SELECT *, 'I', GETDATE() FROM Inserted
END

GO
/****** Object:  Trigger [dbo].[ChiTietHoaDon_Updated]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ChiTietHoaDon_Updated] ON [dbo].[ChiTietHoaDon] 
	FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_ChiTietHoaDon SELECT *, 'U', GETDATE() FROM Inserted
END

GO
/****** Object:  Trigger [dbo].[CongTy_Deleted]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
CREATE TRIGGER [dbo].[CongTy_Deleted] ON [dbo].[CongTy] 
	FOR DELETE
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_CongTy SELECT *, 'D', GETDATE() FROM Deleted
END

GO
/****** Object:  Trigger [dbo].[CongTy_Inserted]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----====================================
----  Create database trigger template 
----====================================
--USE <database_name, sysname, AdventureWorks>
--GO

--IF EXISTS(
--  SELECT *
--    FROM sys.triggers
--   WHERE name = N'<trigger_name, sysname, table_alter_drop_safety>'
--     AND parent_class_desc = N'DATABASE'
--)
--	DROP TRIGGER <trigger_name, sysname, table_alter_drop_safety> ON DATABASE
--GO

CREATE TRIGGER [dbo].[CongTy_Inserted] ON [dbo].[CongTy] 
	FOR INSERT
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_CongTy SELECT *, 'I', GETDATE() FROM Inserted
END

GO
/****** Object:  Trigger [dbo].[CongTy_Updated]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
CREATE TRIGGER [dbo].[CongTy_Updated] ON [dbo].[CongTy] 
	FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_CongTy SELECT *, 'U', GETDATE() FROM Inserted
END

GO
/****** Object:  Trigger [dbo].[HoaDon_Deleted]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
CREATE TRIGGER [dbo].[HoaDon_Deleted] ON [dbo].[HoaDon] 
	FOR DELETE
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_HoaDon SELECT *, 'D', GETDATE() FROM Deleted
END

GO
/****** Object:  Trigger [dbo].[HoaDon_Inserted]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----====================================
----  Create database trigger template 
----====================================
--USE <database_name, sysname, AdventureWorks>
--GO

--IF EXISTS(
--  SELECT *
--    FROM sys.triggers
--   WHERE name = N'<trigger_name, sysname, table_alter_drop_safety>'
--     AND parent_class_desc = N'DATABASE'
--)
--	DROP TRIGGER <trigger_name, sysname, table_alter_drop_safety> ON DATABASE
--GO

CREATE TRIGGER [dbo].[HoaDon_Inserted] ON [dbo].[HoaDon] 
	FOR INSERT
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_HoaDon SELECT *, 'I', GETDATE() FROM Inserted
END

GO
/****** Object:  Trigger [dbo].[HoaDon_Updated]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
CREATE TRIGGER [dbo].[HoaDon_Updated] ON [dbo].[HoaDon] 
	FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_HoaDon SELECT *, 'U', GETDATE() FROM Inserted
END

GO
/****** Object:  Trigger [dbo].[KhachHang_Deleted]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
CREATE TRIGGER [dbo].[KhachHang_Deleted] ON [dbo].[KhachHang] 
	FOR DELETE
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_KhachHang SELECT *, 'D', GETDATE() FROM Deleted
END

GO
/****** Object:  Trigger [dbo].[KhachHang_Inserted]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----====================================
----  Create database trigger template 
----====================================
--USE <database_name, sysname, AdventureWorks>
--GO

--IF EXISTS(
--  SELECT *
--    FROM sys.triggers
--   WHERE name = N'<trigger_name, sysname, table_alter_drop_safety>'
--     AND parent_class_desc = N'DATABASE'
--)
--	DROP TRIGGER <trigger_name, sysname, table_alter_drop_safety> ON DATABASE
--GO

CREATE TRIGGER [dbo].[KhachHang_Inserted] ON [dbo].[KhachHang] 
	FOR INSERT
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_KhachHang SELECT *, 'I', GETDATE() FROM Inserted
END

GO
/****** Object:  Trigger [dbo].[KhachHang_Updated]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
CREATE TRIGGER [dbo].[KhachHang_Updated] ON [dbo].[KhachHang] 
	FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_KhachHang SELECT *, 'U', GETDATE() FROM Inserted
END

GO
/****** Object:  Trigger [dbo].[NhanVien_Deleted]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
CREATE TRIGGER [dbo].[NhanVien_Deleted] ON [dbo].[NhanVien] 
	FOR DELETE
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_NhanVien SELECT *, 'D', GETDATE() FROM Deleted
END

GO
/****** Object:  Trigger [dbo].[NhanVien_Inserted]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----====================================
----  Create database trigger template 
----====================================
--USE <database_name, sysname, AdventureWorks>
--GO

--IF EXISTS(
--  SELECT *
--    FROM sys.triggers
--   WHERE name = N'<trigger_name, sysname, table_alter_drop_safety>'
--     AND parent_class_desc = N'DATABASE'
--)
--	DROP TRIGGER <trigger_name, sysname, table_alter_drop_safety> ON DATABASE
--GO

CREATE TRIGGER [dbo].[NhanVien_Inserted] ON [dbo].[NhanVien] 
	FOR INSERT
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_NhanVien SELECT *, 'I', GETDATE() FROM Inserted
END

GO
/****** Object:  Trigger [dbo].[NhanVien_Updated]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
CREATE TRIGGER [dbo].[NhanVien_Updated] ON [dbo].[NhanVien] 
	FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_NhanVien SELECT *, 'U', GETDATE() FROM Inserted
END

GO
/****** Object:  Trigger [dbo].[SanPhamDV_Deleted]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
CREATE TRIGGER [dbo].[SanPhamDV_Deleted] ON [dbo].[SanPhamDV] 
	FOR DELETE
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_SanPhamDV SELECT *, 'D', GETDATE() FROM Deleted
END

GO
/****** Object:  Trigger [dbo].[SanPhamDV_Inserted]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----====================================
----  Create database trigger template 
----====================================
--USE <database_name, sysname, AdventureWorks>
--GO

--IF EXISTS(
--  SELECT *
--    FROM sys.triggers
--   WHERE name = N'<trigger_name, sysname, table_alter_drop_safety>'
--     AND parent_class_desc = N'DATABASE'
--)
--	DROP TRIGGER <trigger_name, sysname, table_alter_drop_safety> ON DATABASE
--GO

CREATE TRIGGER [dbo].[SanPhamDV_Inserted] ON [dbo].[SanPhamDV] 
	FOR INSERT
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_SanPhamDV SELECT *, 'I', GETDATE() FROM Inserted
END

GO
/****** Object:  Trigger [dbo].[SanPhamDV_Updated]    Script Date: 12/4/2021 9:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
CREATE TRIGGER [dbo].[SanPhamDV_Updated] ON [dbo].[SanPhamDV] 
	FOR UPDATE
AS
BEGIN
   SET NOCOUNT ON;

   INSERT INTO AUDIT_SanPhamDV SELECT *, 'U', GETDATE() FROM Inserted
END

GO
USE [master]
GO
ALTER DATABASE [QLBHang] SET  READ_WRITE 
GO

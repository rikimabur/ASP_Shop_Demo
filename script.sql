USE [master]
GO
/****** Object:  Database [DAMobile]    Script Date: 6/25/2016 11:35:00 AM ******/
CREATE DATABASE [DAMobile]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DAMobile', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DAMobile.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DAMobile_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DAMobile_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DAMobile] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DAMobile].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DAMobile] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DAMobile] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DAMobile] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DAMobile] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DAMobile] SET ARITHABORT OFF 
GO
ALTER DATABASE [DAMobile] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DAMobile] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DAMobile] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DAMobile] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DAMobile] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DAMobile] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DAMobile] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DAMobile] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DAMobile] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DAMobile] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DAMobile] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DAMobile] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DAMobile] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DAMobile] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DAMobile] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DAMobile] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DAMobile] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DAMobile] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DAMobile] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DAMobile] SET  MULTI_USER 
GO
ALTER DATABASE [DAMobile] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DAMobile] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DAMobile] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DAMobile] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DAMobile]
GO
/****** Object:  Table [dbo].[DONHANG]    Script Date: 6/25/2016 11:35:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONHANG](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [datetime] NOT NULL,
	[TongTien] [money] NOT NULL,
	[MAKH] [int] NOT NULL,
	[ThanhToan] [int] NOT NULL,
 CONSTRAINT [PK__DONHANG__2725866117EEB7CA] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONHANGCHITIET]    Script Date: 6/25/2016 11:35:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONHANGCHITIET](
	[MAID] [int] IDENTITY(1,1) NOT NULL,
	[MaDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[Gia] [money] NOT NULL,
	[TongTien] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHASANXUAT]    Script Date: 6/25/2016 11:35:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHASANXUAT](
	[MANSX] [int] IDENTITY(1,1) NOT NULL,
	[TENNSX] [nvarchar](50) NULL,
	[bixoa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MANSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 6/25/2016 11:35:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MASP] [int] IDENTITY(1,1) NOT NULL,
	[TENSP] [nvarchar](50) NULL,
	[Link] [text] NULL,
	[MATHELOAI] [int] NULL,
	[MANHASANXUAT] [int] NULL,
	[Ngay] [datetime] NULL,
	[SoLuotXem] [decimal](18, 0) NULL,
	[bixoa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MASP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SANPHAMCHITIET]    Script Date: 6/25/2016 11:35:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAMCHITIET](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MASP] [int] NOT NULL,
	[ManHinh] [nvarchar](50) NULL,
	[HeDieuHanh] [nvarchar](50) NULL,
	[CamSau] [varchar](20) NULL,
	[CamTruoc] [varchar](20) NULL,
	[CPU] [varchar](100) NULL,
	[Ram] [varchar](30) NULL,
	[BoNhoTrong] [varchar](20) NULL,
	[TheSim] [nvarchar](50) NULL,
	[HoTroTheNho] [nvarchar](50) NULL,
	[DungLuongPin] [nvarchar](50) NULL,
	[ChucNangKhac] [nvarchar](200) NULL,
	[Soluong] [int] NULL,
	[SoLuongBan] [int] NULL,
	[Gia] [money] NULL,
 CONSTRAINT [PK__SANPHAMC__3214EC2797BF8111] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 6/25/2016 11:35:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[bixoa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THELOAI]    Script Date: 6/25/2016 11:35:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THELOAI](
	[MATL] [int] IDENTITY(1,1) NOT NULL,
	[TENTHELOAI] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MATL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DONHANG] ON 

INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (18, CAST(0x0000A617017C9FCD AS DateTime), 20800.0000, 2, 0)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (21, CAST(0x0000A61F00EE9F3A AS DateTime), 104000.0000, 2, 0)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (22, CAST(0x0000A62000F9A231 AS DateTime), 119000.0000, 2, 0)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (23, CAST(0x0000A62000F9BE07 AS DateTime), 261470.0000, 2, 0)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (27, CAST(0x0000A62101626401 AS DateTime), 54600.0000, 2, 1)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (28, CAST(0x0000A62101627F47 AS DateTime), 119000.0000, 2, 0)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (29, CAST(0x0000A621016B240E AS DateTime), 145700.0000, 2, 0)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (30, CAST(0x0000A622009B5855 AS DateTime), 142800.0000, 2, 0)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (31, CAST(0x0000A6270116672E AS DateTime), 196300.0000, 2, 1)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (32, CAST(0x0000A6280018C60C AS DateTime), 208200.0000, 15, 0)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (33, CAST(0x0000A62900033198 AS DateTime), 266820.0000, 2, 0)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (34, CAST(0x0000A62900EC5865 AS DateTime), 129080.0000, 2, 0)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (35, CAST(0x0000A62900ED376C AS DateTime), 207400.0000, 2, 0)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (36, CAST(0x0000A62900ED6C17 AS DateTime), 44700.0000, 2, 1)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (37, CAST(0x0000A629015C3F14 AS DateTime), 118900.0000, 18, 1)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (38, CAST(0x0000A629015C5382 AS DateTime), 29700.0000, 18, 1)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (39, CAST(0x0000A629015C646F AS DateTime), 38500.0000, 18, 0)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (40, CAST(0x0000A62C017EF9BE AS DateTime), 68400.0000, 2, 1)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (41, CAST(0x0000A62D000C318E AS DateTime), 131000.0000, 2, 1)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (42, CAST(0x0000A62D0176D83A AS DateTime), 6000.0000, 2, 1)
INSERT [dbo].[DONHANG] ([MaDH], [NgayNhap], [TongTien], [MAKH], [ThanhToan]) VALUES (43, CAST(0x0000A62D01786A72 AS DateTime), 124320.0000, 2, 1)
SET IDENTITY_INSERT [dbo].[DONHANG] OFF
SET IDENTITY_INSERT [dbo].[DONHANGCHITIET] ON 

INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (15, 18, 2, 1, 5900.0000, 5900.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (16, 18, 3, 1, 14900.0000, 14900.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (22, 21, 1, 5, 14900.0000, 74500.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (23, 21, 2, 5, 5900.0000, 29500.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (24, 22, 3, 5, 14900.0000, 74500.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (25, 22, 4, 3, 10900.0000, 32700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (26, 22, 2, 2, 5900.0000, 11800.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (27, 23, 3, 4, 14900.0000, 59600.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (28, 23, 6, 5, 9900.0000, 49500.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (29, 23, 4, 3, 10900.0000, 32700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (30, 23, 1, 3, 14900.0000, 44700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (31, 23, 9, 3, 24990.0000, 74970.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (40, 27, 3, 1, 14900.0000, 14900.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (41, 27, 4, 2, 10900.0000, 21800.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (42, 27, 7, 1, 17900.0000, 17900.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (43, 28, 2, 2, 5900.0000, 11800.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (44, 28, 3, 2, 14900.0000, 29800.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (45, 28, 4, 3, 10900.0000, 32700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (46, 28, 1, 3, 14900.0000, 44700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (47, 29, 1, 3, 14900.0000, 44700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (48, 29, 2, 4, 5900.0000, 23600.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (49, 29, 3, 3, 14900.0000, 44700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (50, 29, 4, 3, 10900.0000, 32700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (51, 30, 1, 3, 14900.0000, 44700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (52, 30, 2, 4, 5900.0000, 23600.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (53, 30, 3, 5, 14900.0000, 74500.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (54, 31, 4, 3, 10900.0000, 32700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (55, 31, 3, 5, 14900.0000, 74500.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (56, 31, 2, 5, 5900.0000, 29500.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (57, 31, 1, 4, 14900.0000, 59600.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (58, 32, 3, 3, 14900.0000, 44700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (59, 32, 2, 4, 5900.0000, 23600.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (60, 32, 4, 6, 10900.0000, 65400.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (61, 32, 1, 5, 14900.0000, 74500.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (62, 33, 11, 3, 27490.0000, 82470.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (63, 33, 9, 5, 24990.0000, 124950.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (64, 33, 6, 6, 9900.0000, 59400.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (65, 34, 5, 2, 19990.0000, 39980.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (66, 34, 6, 9, 9900.0000, 89100.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (67, 35, 1, 5, 14900.0000, 74500.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (68, 35, 2, 3, 5900.0000, 17700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (69, 35, 3, 7, 14900.0000, 104300.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (70, 35, 4, 1, 10900.0000, 10900.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (71, 36, 1, 3, 14900.0000, 44700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (72, 37, 3, 3, 14900.0000, 44700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (73, 37, 2, 5, 5900.0000, 29500.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (74, 37, 1, 3, 14900.0000, 44700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (75, 38, 8, 3, 9900.0000, 29700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (76, 39, 2, 4, 5900.0000, 23600.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (77, 39, 3, 1, 14900.0000, 14900.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (78, 40, 2, 3, 5900.0000, 17700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (79, 40, 1, 3, 14900.0000, 44700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (80, 40, 73, 3, 2000.0000, 6000.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (81, 41, 1, 3, 14900.0000, 44700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (82, 41, 2, 2, 5900.0000, 11800.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (83, 41, 3, 5, 14900.0000, 74500.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (84, 42, 73, 3, 2000.0000, 6000.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (85, 43, 13, 3, 4990.0000, 14970.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (86, 43, 6, 3, 9900.0000, 29700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (87, 43, 8, 3, 9900.0000, 29700.0000)
INSERT [dbo].[DONHANGCHITIET] ([MAID], [MaDH], [MaSP], [SoLuong], [Gia], [TongTien]) VALUES (88, 43, 15, 5, 9990.0000, 49950.0000)
SET IDENTITY_INSERT [dbo].[DONHANGCHITIET] OFF
SET IDENTITY_INSERT [dbo].[NHASANXUAT] ON 

INSERT [dbo].[NHASANXUAT] ([MANSX], [TENNSX], [bixoa]) VALUES (1, N'SoNy', 0)
INSERT [dbo].[NHASANXUAT] ([MANSX], [TENNSX], [bixoa]) VALUES (2, N'Apple', 0)
INSERT [dbo].[NHASANXUAT] ([MANSX], [TENNSX], [bixoa]) VALUES (3, N'MicroSoft', 0)
INSERT [dbo].[NHASANXUAT] ([MANSX], [TENNSX], [bixoa]) VALUES (4, N'Lenovo', 0)
INSERT [dbo].[NHASANXUAT] ([MANSX], [TENNSX], [bixoa]) VALUES (5, N'SamSung', 0)
INSERT [dbo].[NHASANXUAT] ([MANSX], [TENNSX], [bixoa]) VALUES (6, N'HTC', 0)
SET IDENTITY_INSERT [dbo].[NHASANXUAT] OFF
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (1, N'Sony Z3S', N'dienthoai/sony/z3s.png', 1, 1, CAST(0x0000A24A00000000 AS DateTime), CAST(51 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (2, N'Lenovo P70A', N'dienthoai/lenovo/p70a.png', 1, 4, CAST(0x0000A24A00000000 AS DateTime), CAST(26 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (3, N'SamSung S6', N'dienthoai/samsung/s6.png', 1, 5, CAST(0x0000A24A00000000 AS DateTime), CAST(72 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (4, N'SamSung Note4', N'dienthoai/samsung/note4.png', 1, 5, CAST(0x0000A24A00000000 AS DateTime), CAST(6 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (5, N'Iphone6', N'dienthoai/iphone/6.png', 1, 2, CAST(0x0000A24A00000000 AS DateTime), CAST(14 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (6, N'Iphone 5S', N'dienthoai/iphone/5S.png', 1, 2, CAST(0x0000A24A00000000 AS DateTime), CAST(8 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (7, N'Sony Z5', N'dienthoai/sony/z5preminum.png', 1, 1, CAST(0x0000A24A00000000 AS DateTime), CAST(19 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (8, N'Sony M5', N'dienthoai/sony/m5.png', 1, 1, CAST(0x0000A24A00000000 AS DateTime), CAST(2 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (9, N'Iphone 6 plus', N'dienthoai/iphone/6s_plus.png', 1, 2, CAST(0x0000A24A00000000 AS DateTime), CAST(2 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (10, N'SamSung Note 5', N'dienthoai/samsung/note5.png', 1, 5, CAST(0x0000A24A00000000 AS DateTime), CAST(11 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (11, N'Iphone 6S Plus', N'dienthoai/iphone/6s_plus.png', 1, 2, CAST(0x0000A24A00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (12, N'Iphone 5SE', N'dienthoai/iphone/5SE.png', 1, 2, CAST(0x0000A24A00000000 AS DateTime), CAST(32 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (13, N'Sony Xperia M4 Aqua LTE', N'dienthoai/sony/m4.png', 1, 1, CAST(0x0000A24A00000000 AS DateTime), CAST(2 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (14, N'Sony Xperia C4 Dual', N'dienthoai/sony/c4.png', 1, 1, CAST(0x0000A24A00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (15, N'Microsoft Lumia 950 XL', N'dienthoai/microsoft/950xl.png', 1, 3, CAST(0x0000A24A00000000 AS DateTime), CAST(4 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (16, N'Microsoft Lumia 950', N'dienthoai/microsoft/950.png', 1, 3, CAST(0x0000A24A00000000 AS DateTime), CAST(6 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (17, N'Microsoft Lumia 650 dual sim', N'dienthoai/microsoft/650.png', 1, 3, CAST(0x0000A24A00000000 AS DateTime), CAST(6 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (18, N'Nokia Lumia 730 Dual SIM', N'dienthoai/microsoft/730.png', 1, 3, CAST(0x0000A24A00000000 AS DateTime), CAST(3 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (19, N' Lenovo Vibe P1', N'dienthoai/lenovo/vibe_p1.png', 1, 4, CAST(0x0000A24A00000000 AS DateTime), CAST(2 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (20, N'Lenovo Vibe S1', N'dienthoai/lenovo/vibe_s1.png', 1, 4, CAST(0x0000A24A00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (21, N'Samsung Galaxy S7 Edge', N'dienthoai/samsung/s7_edge.png', 1, 5, CAST(0x0000A24A00000000 AS DateTime), CAST(2 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (22, N'Samsung Galaxy S7', N'dienthoai/samsung/s7.png', 1, 5, CAST(0x0000A24A00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (23, N'Samsung Galaxy A7 (2016)', N'dienthoai/samsung/a7.png', 1, 5, CAST(0x0000A24A00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (24, N'Samsung Galaxy A5 2016', N'dienthoai/samsung/a5.png', 1, 5, CAST(0x0000A24A00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (25, N'Samsung Galaxy A3 2016', N'dienthoai/samsung/a3.png', 1, 5, CAST(0x0000A24A00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (26, N'HTC One A9', N'dienthoai/htc/a9.png', 1, 6, CAST(0x0000A24A00000000 AS DateTime), CAST(5 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (27, N'HTC One M9s', N'dienthoai/htc/m9s.png', 1, 6, CAST(0x0000A24A00000000 AS DateTime), CAST(9 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (28, N'HTC One M8 Eye', N'dienthoai/htc/m8.png', 1, 6, CAST(0x0000A24A00000000 AS DateTime), CAST(2 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (29, N'HTC Desire Eye', N'dienthoai/htc/desire_eye.png', 1, 6, CAST(0x0000A24A00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (30, N'HTC Desire 628', N'dienthoai/htc/628.png', 1, 6, CAST(0x0000A24A00000000 AS DateTime), CAST(2 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (31, N'HTC Desire 630', N'dienthoai/htc/630.png', 1, 6, CAST(0x0000A24A00000000 AS DateTime), CAST(1 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (32, N'iPad Pro Wifi Cellular 128GB', N'maytinhbang/ipad/pro128g.png', 2, 2, CAST(0x0000A24A00000000 AS DateTime), CAST(4 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (33, N'iPad Air 2 Cellular 64GB', N'maytinhbang/ipad/air_2.png', 2, 2, CAST(0x0000A24A00000000 AS DateTime), CAST(2 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (34, N'iPad Mini 4 Wifi Cellular 64GB', N'maytinhbang/ipad/mini4_64g.png', 2, 2, CAST(0x0000A24A00000000 AS DateTime), CAST(3 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (73, N'HTC One', N'sanpham/73/main.png', 1, 6, CAST(0x0000A627011F35E8 AS DateTime), CAST(6 AS Decimal(18, 0)), 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (74, N'Htc9', N'sanpham/74/main.png', 1, 6, CAST(0x0000A62701649E5B AS DateTime), CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [Link], [MATHELOAI], [MANHASANXUAT], [Ngay], [SoLuotXem], [bixoa]) VALUES (75, N'sony m5 single', N'sanpham/75/main.png', 1, 1, CAST(0x0000A62900EE2DEA AS DateTime), CAST(0 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
SET IDENTITY_INSERT [dbo].[SANPHAMCHITIET] ON 

INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (1, 1, N'IPS LCD, 5.2", Full HD', N'Android 5.0 (Lollipop)', N'20.7 MP', N'5 MP', N'	Snapdragon 810 8 nhân 64-bit, 4 nhân 1.5 GHz Cortex-A53 & 4 nhân 2 GHz Cortex-A57', N'3 GB', N'32 GB', N'1 Sim, Nano SIM', N'1MicroSD (T-Flash), 128 GB', N'2930 mAh', N'Sạc pin nhanh, Chống nước, chống bụi', 61, 26, 14900.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (2, 2, N'IPS LCD, 5", HD', N'Android 4.4 (KitKat)', N'	13 MP', N'5 MP', N'MTK 6752 8 nhân 64-bit, 1.7 GHz', N'2 GB', N'16 GB', N'2 SIM 2 sóng, Micro SIM', N'MicroSD (T-Flash), 32 GB', N'4000 mAh', N'Không', 58, 26, 5900.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (3, 3, N'Super AMOLED, 5.1", Quad HD', N'Android 5.1 (Lollipop)', N'16 MP', N'5 MP', N'	Exynos 7420 8 nhân 64-bit, 4 nhân 1.5 GHz Cortex-A53 & 4 nhân 2.1 GHz Cortex-A57', N'3 GB', N'	32 GB', N'	1 Sim, Nano SIM', N'Không', N'2550 mAh', N'Mở khóa bằng vân tay, Sạc pin nhanh', 48, 24, 14900.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (4, 4, N'Super AMOLED, 5.7", Quad HD', N'Android 4.4 (KitKat)', N'16 MP', N'3.7 MP', N'	Exynos 5433 8 nhân, 4 nhân 1.3 GHz Cortex-A53 & 4 nhân 1.9 GHz Cortex-A57', N'	3 GB', N'32 GB', N'1 Sim, Micro SIM', N'MicroSD (T-Flash), 128 GB', N'3220 mAh', N'Mở khóa bằng vân tay, Sạc pin nhanh', 94, 13, 10900.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (5, 5, N'LED-backlit IPS LCD, 5.5", Retina HD', N'iOS 8.0', N'8 MP', N'1.2 MP', N'Apple A8 2 nhân 64-bit, 1.4 GHz', N'1 GB', N'64 GB', N'1 Sim, Nano SIM', N'Không', N'2915 mAh', N'Mở khóa bằng vân tay', 53, 13, 19990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (6, 6, N'LED-backlit IPS LCD, 4", DVGA', N'OS 9', N'8 MP', N'1.2 MP', N'Apple A7 2 nhân 64-bit, 1.3 GHz', N'1 GB', N'	16 GB', N'1 Sim, Nano SIM', N'Không', N'1560 mAh', N'Mở khóa bằng vân tay', 37, 22, 9900.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (7, 7, N'IPS LCD, 5.2", IPS-LCD', N'Android 5.1 (Lollipop)', N'23 MP', N'5 MP', N'	Snapdragon 810 8 nhân 64-bit, 4 nhân 1.5 GHz Cortex-A53 & 4 nhân 2 GHz Cortex-A57', N'3 GB', N'32 GB', N'2 SIM 2 sóng, Nano SIM', N'MicroSD (T-Flash), 200 GB', N'2900 mAh', N'Mở khóa bằng vân tay, Sạc pin nhanh', 61, 1, 17900.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (8, 8, N'IPS LCD, 5", Full HD', N'Android 5.0 (Lollipop)', N'21.5 MP', N'13 MP', N'MT6795 (Helio x10) 8 nhân 64-bit, 2.0 GHz', N'3 GB', N'16 GB', N'	2 SIM 2 sóng, Nano SIM', N'MicroSD (T-Flash), 200 GB', N'2600 mAh', N'Không', 75, 8, 9900.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (9, 9, N'LED-backlit IPS LCD, 5.5", Retina HD', N'iOS 8.0', N'8 MP', N'1.2 MP', N'Apple A8 2 nhân 64-bit, 1.4 GHz', N'1 GB', N'64 GB', N'1 Sim, Nano SIM', N'Không', N'	2915 mAh', N'Mở khóa bằng vân tay', 25, 3, 24990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (10, 10, N'Super AMOLED, 5.7", Quad HD', N'Android 5.1 (Lollipop)', N'	16 MP', N'5 MP', N'Exynos 7420 8 nhân 64-bit, 4 nhân 1.5 GHz Cortex-A53 & 4 nhân 2.1 GHz Cortex-A57', N'4 GB', N'	32 GB', N'1 Sim, Nano SIM', N'Không', N'	3000 mAh', N'Mở khóa bằng vân tay, Tương thích kính thực tế ảo Gear VR, Sạc pin không dây, Sạc pin nhanh', 44, 4, 18990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (11, 11, N'LED-backlit IPS LCD, 5.5", Retina HD', N'iOS 9', N'12 MP', N'5 MP', N'Apple A9 2 nhân 64-bit, 1.8 GHz', N'2 GB', N'128 GB', N'1 Sim, Nano SIM', N'Không', N'	2750 mAh', N'Mở khóa bằng vân tay', 96, 5, 27490.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (12, 12, N'IPS LCD, 4", Retina', N'iOS 9', N'12 MP', N'	1.2 MP', N'Apple A9 2 nhân 64-bit, 1.8 GHz', N'2 GB', N'16 GB', N'1 Sim, Nano SIM', N'Không, Không', N'1642 mAh', N'Mở khóa bằng vân tay', 100, 6, 11490.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (13, 13, N'IPS LCD, 5", HD', N'	Android 5.0 (Lollipop)', N'13 MP', N'	5 MP', N'Snapdragon 615 8 nhân 64-bit, Quad-core 1.5 GHz + Quad-core 1 GHz', N'2 GB', N'8 GB', N'1 Sim, Nano SIM', N'MicroSD, 128 GB', N'	2400 mAh', N'Không', 197, 10, 4990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (14, 14, N'IPS LCD, 5.5", Full HD', N'Android 5.0 (Lollipop)', N'13 MP', N'	5 MP', N'MTK 6752 8 nhân 64-bit, 1.7 GHz', N'2 GB', N'16 GB', N'	2 SIM 2 sóng, Nano SIM', N'MicroSD, 128 GB', N'	2600 mAh', N'Không', 100, 2, 6190.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (15, 15, N'AMOLED, 5.7", Quad HD', N'Windows 10 (for Mobile)', N'20 MP', N'5 MP', N'	Snapdragon 810 8 nhân 64-bit, 4 nhân 1.5 GHz Cortex-A53 & 4 nhân 2 GHz Cortex-A57', N'	3 GB', N'	32 GB', N'1 Sim, Nano SIM', N'MicroSD, 200 GB', N'3340 mAh', N'Microsoft Continuum, Quét mống mắt, Sạc pin không dây, Sạc pin nhanh', 195, 8, 9990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (16, 16, N'AMOLED, 5.2", Quad HD', N'Windows 10 (for Mobile)', N'20 MP', N'5 MP', N'	Qualcomm Snapdragon 808 6 nhân 64-bit, 2 nhân 1.8 GHz Cortex-A57 & 4 nhân 1.44 GHz Cortex-A53', N'	3 GB', N'	32 GB', N'1 Sim, Nano SIM', N'MicroSD, 200 GB', N'3000 mAh', N'Quét mống mắt, Sạc pin không dây, Sạc pin nhanh', 100, 4, 7990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (17, 17, N'AMOLED, 5", HD', N'Windows 10 (for Mobile)', N'8 MP', N'5 MP', N'Qualcomm Snapdragon 212 4 nhân 32-bit, 1.3 GHz', N'	1 GB', N'16 GB', N'2 SIM 2 sóng, Nano SIM', N'MicroSD, 200 GB', N'2000 mAh', N'Không', 200, 5, 3990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (18, 18, N'AMOLED, 4.7", HD', N'Windows Phone 8.1 (Nâng cấp lên Windows 10)', N'6.7 MP', N'5 MP', N'Qualcomm Snapdragon 400 4 nhân 32-bit, 1.2 GHz', N'1 GB', N'8 GB', N'2 SIM 2 sóng, Micro SIM', N'MicroSD, 128 GB', N'	2220 mAh', N'Không', 100, 7, 3690.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (19, 19, N'IPS LCD, 5.5", Full HD', N'Android 5.1 (Lollipop)', N'13 MP', N'5 MP', N'Snapdragon 615 8 nhân 64-bit, 4 nhân 1.5 GHz Cortex-A53 + 4 nhân 1.0 GHz Cortex-A53', N'2 GB', N'32 GB', N'2 SIM 2 sóng, Nano SIM', N'MicroSD, 128 GB', N'5000 mAh', N'Mở khóa bằng vân tay, Sạc pin nhanh', 200, 8, 6690.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (20, 20, N'IPS LCD, 5", Full HD', N'Android 5.0 (Lollipop)', N'13 MP', N'8 MP và 2 MP', N'MTK 6752 8 nhân 64-bit, 1.7 GHz', N'3 GB', N'32 GB', N'2 SIM, SIM 2 chung khe thẻ nhớ, Nano SIM', N'MicroSD, 128 GB', N'2420 mAh', N'Không', 100, 0, 5490.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (21, 21, N'Super AMOLED, 5.5", Quad HD', N'Android 6.0 (Marshmallow)', N'12 MP', N'5 MP', N'Exynos 8890 8 nhân 64-bit, 4 nhân 2.3 GHz và 4 nhân 1.6 GHz', N'4 GB', N'32 GB', N'	2 SIM, SIM 2 chung khe thẻ nhớ, Nano SIM', N'	MicroSD, 200 GB', N'3600 mAh', N'Sạc pin nhanh, Sạc pin không dây, Chống nước, chống bụi, Mở khóa bằng vân tay', 200, 9, 18490.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (22, 22, N'Super AMOLED, 5.1", Quad HD', N'Android 6.0 (Marshmallow)', N'12 MP', N'5 MP', N'Exynos 8890 8 nhân 64-bit, 4 nhân 2.3 GHz và 4 nhân 1.6 GHz', N'4 GB', N'32 GB', N'	2 SIM, SIM 2 chung khe thẻ nhớ, Nano SIM', N'	MicroSD, 200 GB', N'3000 mAh', N'Mở khóa bằng vân tay, Chống nước, chống bụi, Sạc pin không dây, Sạc pin nhanh', 100, 0, 15990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (23, 23, N'Super AMOLED, 5.5", Full HD', N'Android 5.1 (Lollipop)', N'13 MP', N'5 MP', N'	Exynos 7580 8 nhân 64-bit, 1.6 GHz', N'3 GB', N'16 GB', N'2 SIM 2 sóng, Nano SIM', N'MicroSD, 128 GB', N'3300 mAh', N'Mở khóa bằng vân tay, Sạc pin nhanh', 150, 0, 9990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (24, 24, N'Super AMOLED, 5.2", Full HD', N'Android 5.1 (Lollipop)', N'13 MP', N'5 MP', N'	Exynos 7580 8 nhân 64-bit, 1.6 GHz', N'2 GB', N'	16 GB', N'2 SIM 2 sóng, Nano SIM', N'MicroSD, 128 GB', N'	2900 mAh', N'ạc pin nhanh, Mở khóa bằng vân tay', 120, 2, 8990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (25, 25, N'Super AMOLED, 4.7", HD', N'ndroid 5.1 (Lollipop)', N'13 MP', N'5 MP', N'Exynos 7578 4 nhân 64-bit, 1.5 GHz', N'1.5 GB', N'	16 GB', N'2 SIM 2 sóng, Nano SIM', N'MicroSD, 128 GB', N'2300 mAh', N'Không', 100, 4, 6190.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (26, 26, N'AMOLED, 5", AMOLED 16 triệu màu', N'Android 6.0 (Marshmallow)', N'13 MP', N'4 Ultra pixel', N'Qualcomm Snapdragon 617 8 nhân 64-bit, 4 nhân 1.5 GHz Cortex-A53 & 4 nhân1.2 GHz Cortex-A53', N'2 GB', N'	16 GB', N'1 Sim, Nano SIM', N'icroSD, 2 TB', N'2150 mAh', N'Mở khóa bằng vân tay, Dolby Audio™', 100, 3, 10990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (27, 27, N'Super LCD 3, 5", Full HD', N'Android 5.1 (Lollipop)', N'13 MP', N'4 Ultra pixel', N'MT6795 (Helio x10) 8 nhân 64-bit, 2.2 GHz', N'2 GB', N'16 GB', N'	1 Sim, Nano SIM', N'MicroSD, 200 GB', N'2840 mAh', N'Không', 150, 5, 8990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (28, 28, N'Super LCD 3, 5", Full HD', N'Android 5.0 (Lollipop)', N'13 MP', N'5 MP', N'Qualcomm Snapdragon 801 4 nhân 32-bit, 2.3 GHz', N'2 GB', N'16 GB', N'	1 Sim, Nano SIM', N'MicroSD, 128 GB', N'2600 mAh', N'HTC BoomSound™', 100, 4, 7990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (29, 29, N'IPS LCD, 5.2", Full HD', N'Android 4.4 (KitKat)', N'13 MP', N'13 MP', N'Qualcomm Snapdragon 801 4 nhân 32-bit, 2.3 GHz', N'2 GB', N'16 GB', N'	1 Sim, Nano SIM', N'MicroSD, 128 GB', N'2600 mAh', N'HTC BoomSound™', 100, 5, 7490.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (30, 30, N'Super LCD 2, 5", HD', N'Android 5.1 (Lollipop)', N'13 MP', N'5 MP', N'MTK6753 8 nhân 64-bit, 1.3 GHz', N'3 GB', N'32 GB', N'2 SIM 2 sóng, Nano SIM', N'icroSD, 2 TB', N'2200 mAh', N'Đang cập nhật', 200, 4, 4990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (31, 31, N'TFT, 5", HD', N'Android 6.0 (Marshmallow)', N'13 MP', N'5 MP', N'	Qualcomm Snapdragon 400 4 nhân 32-bit, 1.6 GHz', N'2 GB', N'16 GB', N'2 SIM 2 sóng, Nano SIM', N'MicroSD, 200 GB', N'2200 mAh', N'Dolby Audio™', 150, 9, 3990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (32, 32, N'LED backlit LCD, 12.9"', N'	iOS 9', N'8 MP', N'1.2 MP', N'Apple A9X 2 nhân 64-bit, 2.2 GHz', N'4 GB', N'128 GB', N'Nano Sim', N'Không, Không', N'38.5 Wh', NULL, 200, 8, 26990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (33, 33, N'Retina công nghệ IPS, 9.7"', N'iOS 9', N'8 MP', N'1.2 MP', N'Apple A8X 3 nhân 64-bit, 1.5 GHz', N'2 GB', N'64 GB', N'Nano Sim', N'Không, Không', N'27.3 Wh (7300 mAh)', NULL, 100, 6, 17590.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (34, 34, N'LED backlit LCD, 7.9"', N'iOS 9', N'8 MP', N'1.2 MP', N'Apple A8, 1.5 GHz', N'2 GB', N'64 GB', N'Nano Sim', N'Không, Không', N'19.1 Wh (5124 mAh)', NULL, 100, 5, 14990.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (73, 73, N'5.5 Full HD', N'Androi 6', N'5', N'21px', N'13', N'2', N'16', N'2', N'100', N'2900', NULL, 94, 7, 2000.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (74, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2000.0000)
INSERT [dbo].[SANPHAMCHITIET] ([ID], [MASP], [ManHinh], [HeDieuHanh], [CamSau], [CamTruoc], [CPU], [Ram], [BoNhoTrong], [TheSim], [HoTroTheNho], [DungLuongPin], [ChucNangKhac], [Soluong], [SoLuongBan], [Gia]) VALUES (75, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, 0, 2500.0000)
SET IDENTITY_INSERT [dbo].[SANPHAMCHITIET] OFF
SET IDENTITY_INSERT [dbo].[TAIKHOAN] ON 

INSERT [dbo].[TAIKHOAN] ([MaTK], [TenDangNhap], [MatKhau], [HoTen], [NgaySinh], [Email], [bixoa]) VALUES (2, N'phuoccon', N'827CCB0EEA8A706C4C34A16891F84E7B', N'phuoc', CAST(0x0000A5FA00000000 AS DateTime), N'phuoc@gmail.com', 0)
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenDangNhap], [MatKhau], [HoTen], [NgaySinh], [Email], [bixoa]) VALUES (15, N'admin', N'21232F297A57A5A743894A0E4A801FC3', N'admin', CAST(0x0000A62700000000 AS DateTime), N'admin@gmail.com', 0)
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenDangNhap], [MatKhau], [HoTen], [NgaySinh], [Email], [bixoa]) VALUES (16, N'phuocon2', N'827CCB0EEA8A706C4C34A16891F84E7B', N'phuocdemo', CAST(0x0000A63200000000 AS DateTime), N'admin@gmail.com', 0)
INSERT [dbo].[TAIKHOAN] ([MaTK], [TenDangNhap], [MatKhau], [HoTen], [NgaySinh], [Email], [bixoa]) VALUES (18, N'riki', N'827CCB0EEA8A706C4C34A16891F84E7B', N'rikimabur', CAST(0x0000A62400000000 AS DateTime), N'riki@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[TAIKHOAN] OFF
SET IDENTITY_INSERT [dbo].[THELOAI] ON 

INSERT [dbo].[THELOAI] ([MATL], [TENTHELOAI]) VALUES (1, N'Điện Thoại')
INSERT [dbo].[THELOAI] ([MATL], [TENTHELOAI]) VALUES (2, N'Máy Tính Bảng')
SET IDENTITY_INSERT [dbo].[THELOAI] OFF
ALTER TABLE [dbo].[DONHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONHANG_TAIKHOAN] FOREIGN KEY([MAKH])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
GO
ALTER TABLE [dbo].[DONHANG] CHECK CONSTRAINT [FK_DONHANG_TAIKHOAN]
GO
ALTER TABLE [dbo].[DONHANGCHITIET]  WITH CHECK ADD  CONSTRAINT [FK_DONHANGCHITIET_DONHANG] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DONHANG] ([MaDH])
GO
ALTER TABLE [dbo].[DONHANGCHITIET] CHECK CONSTRAINT [FK_DONHANGCHITIET_DONHANG]
GO
ALTER TABLE [dbo].[DONHANGCHITIET]  WITH CHECK ADD  CONSTRAINT [FK_DONHANGCHITIET_SANPHAM] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MASP])
GO
ALTER TABLE [dbo].[DONHANGCHITIET] CHECK CONSTRAINT [FK_DONHANGCHITIET_SANPHAM]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_NHASANXUAT] FOREIGN KEY([MANHASANXUAT])
REFERENCES [dbo].[NHASANXUAT] ([MANSX])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_NHASANXUAT]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_THELOAI] FOREIGN KEY([MATHELOAI])
REFERENCES [dbo].[THELOAI] ([MATL])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_THELOAI]
GO
ALTER TABLE [dbo].[SANPHAMCHITIET]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAMCHITIET_SANPHAM] FOREIGN KEY([MASP])
REFERENCES [dbo].[SANPHAM] ([MASP])
GO
ALTER TABLE [dbo].[SANPHAMCHITIET] CHECK CONSTRAINT [FK_SANPHAMCHITIET_SANPHAM]
GO
USE [master]
GO
ALTER DATABASE [DAMobile] SET  READ_WRITE 
GO

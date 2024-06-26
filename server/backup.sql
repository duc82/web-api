USE [master]
GO
/****** Object:  Database [liutiudiu]    Script Date: 5/21/2024 11:08:22 PM ******/
CREATE DATABASE [liutiudiu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'liutiudiu', FILENAME = N'D:\lib\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\liutiudiu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'liutiudiu_log', FILENAME = N'D:\lib\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\liutiudiu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [liutiudiu] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [liutiudiu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [liutiudiu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [liutiudiu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [liutiudiu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [liutiudiu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [liutiudiu] SET ARITHABORT OFF 
GO
ALTER DATABASE [liutiudiu] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [liutiudiu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [liutiudiu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [liutiudiu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [liutiudiu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [liutiudiu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [liutiudiu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [liutiudiu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [liutiudiu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [liutiudiu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [liutiudiu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [liutiudiu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [liutiudiu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [liutiudiu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [liutiudiu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [liutiudiu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [liutiudiu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [liutiudiu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [liutiudiu] SET  MULTI_USER 
GO
ALTER DATABASE [liutiudiu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [liutiudiu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [liutiudiu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [liutiudiu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [liutiudiu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [liutiudiu] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [liutiudiu] SET QUERY_STORE = ON
GO
ALTER DATABASE [liutiudiu] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [liutiudiu]
GO
/****** Object:  Table [dbo].[tDA_NV]    Script Date: 5/21/2024 11:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDA_NV](
	[Ma] [int] NOT NULL,
	[MaDA] [int] NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK_tDA_NV] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDuAn]    Script Date: 5/21/2024 11:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDuAn](
	[MaDA] [int] NOT NULL,
	[TenDA] [nvarchar](100) NULL,
	[DdTrienKhai] [nvarchar](100) NULL,
	[IsDeleted] [bit] NULL,
	[MaPb] [int] NULL,
 CONSTRAINT [PK_tDuAn] PRIMARY KEY CLUSTERED 
(
	[MaDA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tNhanVien]    Script Date: 5/21/2024 11:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tNhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](100) NULL,
	[GioiTinh] [bit] NULL,
	[Luong] [float] NULL,
	[MaPB] [int] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPhongBan]    Script Date: 5/21/2024 11:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPhongBan](
	[MPB] [int] NOT NULL,
	[TenPB] [nvarchar](50) NULL,
	[TruongPhong] [nvarchar](100) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_tPhongBan] PRIMARY KEY CLUSTERED 
(
	[MPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tDA_NV] ([Ma], [MaDA], [MaNV]) VALUES (1, 1, 1)
INSERT [dbo].[tDA_NV] ([Ma], [MaDA], [MaNV]) VALUES (2, 1, 2)
INSERT [dbo].[tDA_NV] ([Ma], [MaDA], [MaNV]) VALUES (3, 2, 1)
GO
INSERT [dbo].[tDuAn] ([MaDA], [TenDA], [DdTrienKhai], [IsDeleted], [MaPb]) VALUES (1, N'làm lại con đường', N'hà nội', 1, 1)
INSERT [dbo].[tDuAn] ([MaDA], [TenDA], [DdTrienKhai], [IsDeleted], [MaPb]) VALUES (2, N'cuộc chiến tranh', N'đà nẵng', 0, 2)
INSERT [dbo].[tDuAn] ([MaDA], [TenDA], [DdTrienKhai], [IsDeleted], [MaPb]) VALUES (3, N'mai ta đi', N'thanh hoá', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tNhanVien] ON 

INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [Luong], [MaPB], [IsDeleted]) VALUES (1, N'Le đình hùng', 1, 10000, 1, 0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [Luong], [MaPB], [IsDeleted]) VALUES (2, N'Hung dinh le', 1, 20000, 2, 1)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [Luong], [MaPB], [IsDeleted]) VALUES (4, N'liu tiu diu', 1, 20000, 1, 0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [Luong], [MaPB], [IsDeleted]) VALUES (5, N'Pepe', 0, 50000000, 1, 0)
INSERT [dbo].[tNhanVien] ([MaNV], [TenNV], [GioiTinh], [Luong], [MaPB], [IsDeleted]) VALUES (6, N'Antd', 1, 100000000, 2, 0)
SET IDENTITY_INSERT [dbo].[tNhanVien] OFF
GO
INSERT [dbo].[tPhongBan] ([MPB], [TenPB], [TruongPhong], [IsDeleted]) VALUES (1, N'CNTT', N'Hung', 0)
INSERT [dbo].[tPhongBan] ([MPB], [TenPB], [TruongPhong], [IsDeleted]) VALUES (2, N'QTKD', N'Nam', 1)
INSERT [dbo].[tPhongBan] ([MPB], [TenPB], [TruongPhong], [IsDeleted]) VALUES (3, N'QHCH', N'Tung', 0)
INSERT [dbo].[tPhongBan] ([MPB], [TenPB], [TruongPhong], [IsDeleted]) VALUES (4, N'Duc', N'Tung', 1)
INSERT [dbo].[tPhongBan] ([MPB], [TenPB], [TruongPhong], [IsDeleted]) VALUES (5, N'NNA', N'Cong tung', 1)
INSERT [dbo].[tPhongBan] ([MPB], [TenPB], [TruongPhong], [IsDeleted]) VALUES (9, N'tt', N'dung', 0)
GO
ALTER TABLE [dbo].[tNhanVien] ADD  CONSTRAINT [DF_tNhanVien_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tDA_NV]  WITH CHECK ADD  CONSTRAINT [FK_tDA_NV_tDuAn] FOREIGN KEY([MaDA])
REFERENCES [dbo].[tDuAn] ([MaDA])
GO
ALTER TABLE [dbo].[tDA_NV] CHECK CONSTRAINT [FK_tDA_NV_tDuAn]
GO
ALTER TABLE [dbo].[tDA_NV]  WITH CHECK ADD  CONSTRAINT [FK_tDA_NV_tNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tDA_NV] CHECK CONSTRAINT [FK_tDA_NV_tNhanVien]
GO
ALTER TABLE [dbo].[tDuAn]  WITH CHECK ADD  CONSTRAINT [FK_tDuAn_tPhongBan] FOREIGN KEY([MaPb])
REFERENCES [dbo].[tPhongBan] ([MPB])
GO
ALTER TABLE [dbo].[tDuAn] CHECK CONSTRAINT [FK_tDuAn_tPhongBan]
GO
ALTER TABLE [dbo].[tNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_tNhanVien_tPhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[tPhongBan] ([MPB])
GO
ALTER TABLE [dbo].[tNhanVien] CHECK CONSTRAINT [FK_tNhanVien_tPhongBan]
GO
/****** Object:  StoredProcedure [dbo].[GetAllNhanVien]    Script Date: 5/21/2024 11:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAllNhanVien]
AS
SELECT NV.MaNV, NV.TenNV, NV.GioiTinh, NV.Luong, NV.GioiTinh, NV.IsDeleted, PhongBan.* FROM tNhanVien NV LEFT JOIN tPhongBan PhongBan ON NV.MaPB = PhongBan.MPB FOR JSON AUTO;
GO
USE [master]
GO
ALTER DATABASE [liutiudiu] SET  READ_WRITE 
GO

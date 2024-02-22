USE [master]
GO
/****** Object:  Database [TDTUAlumnisManagementSystem]    Script Date: 22/2/2024 6:23:33 PM ******/
CREATE DATABASE [TDTUAlumnisManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TDTUAlumnisManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server1\MSSQL15.SQLEXPRESS03\MSSQL\DATA\TDTUAlumnisManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TDTUAlumnisManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server1\MSSQL15.SQLEXPRESS03\MSSQL\DATA\TDTUAlumnisManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TDTUAlumnisManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET QUERY_STORE = OFF
GO
USE [TDTUAlumnisManagementSystem]
GO
/****** Object:  Table [dbo].[ChatBot]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatBot](
	[IDBot] [nvarchar](15) NOT NULL,
	[NoiDungNguoiDung] [nvarchar](max) NOT NULL,
	[NoiDungPhanHoi] [nvarchar](max) NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CongTyDoanhNghiep]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongTyDoanhNghiep](
	[IDCongTy] [nvarchar](15) NOT NULL,
	[TenCongTy] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[SoDienThoai] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCongTy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuuHSSV]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuuHSSV](
	[IDHSSV] [nvarchar](15) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[SoDienThoai] [nvarchar](15) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [nvarchar](10) NOT NULL,
	[QuocTich] [nvarchar](50) NOT NULL,
	[QueQuan] [nvarchar](50) NOT NULL,
	[CaNhan] [nvarchar](50) NOT NULL,
	[XepLoaiTotNghiep] [nvarchar](50) NOT NULL,
	[NganhHoc] [nvarchar](50) NOT NULL,
	[NamTotNghiep] [int] NOT NULL,
	[CongTyHienTai] [nvarchar](50) NOT NULL,
	[HocVanCaoHoc] [nvarchar](50) NOT NULL,
	[ThoiGianHoanThanhBaoVeLuanAn] [date] NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDHSSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanTriVien]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanTriVien](
	[IDAdmin] [nvarchar](15) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[SoDienThoai] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenTaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[PhanQuyen] [nvarchar](50) NOT NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongBao]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBao](
	[IDThongBao] [nvarchar](15) NOT NULL,
	[TieuDe] [nvarchar](100) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[IDNguoiGui] [nvarchar](15) NULL,
	[IDNguoiNhan] [nvarchar](15) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDThongBao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChatBot]  WITH CHECK ADD FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenTaiKhoan])
GO
ALTER TABLE [dbo].[CuuHSSV]  WITH CHECK ADD FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenTaiKhoan])
GO
ALTER TABLE [dbo].[QuanTriVien]  WITH CHECK ADD FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenTaiKhoan])
GO
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD FOREIGN KEY([IDNguoiGui])
REFERENCES [dbo].[QuanTriVien] ([IDAdmin])
GO
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD FOREIGN KEY([IDNguoiNhan])
REFERENCES [dbo].[CuuHSSV] ([IDHSSV])
GO
/****** Object:  StoredProcedure [dbo].[CheckAccessRights]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Thủ tục kiểm tra quyền truy cập
CREATE PROCEDURE [dbo].[CheckAccessRights] 
    @Username NVARCHAR(50),
    @TableName NVARCHAR(50),
    @AccessGranted BIT OUTPUT
AS
BEGIN
    DECLARE @UserRole NVARCHAR(50);
    
    SELECT @UserRole = PhanQuyen
    FROM TaiKhoan
    WHERE TenTaiKhoan = @Username;
    
    IF (@UserRole = @TableName)
    BEGIN
        SET @AccessGranted = 1; -- Access granted
    END
    ELSE
    BEGIN
        SET @AccessGranted = 0; -- Access denied
    END
END
GO
USE [master]
GO
ALTER DATABASE [TDTUAlumnisManagementSystem] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [TDTUAlumnisManagementSystem]    Script Date: 22/2/2024 6:23:33 PM ******/
CREATE DATABASE [TDTUAlumnisManagementSystem]

GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TDTUAlumnisManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
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
CREATE TABLE [dbo].[DoanhNghiep](
	[IDCongTy] [nvarchar](15) NOT NULL,
	[TenCongTy] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[SoDienThoai] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Website] [nvarchar](50) NULL,
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
	[jobBeginDate] [date] NOT NULL,
	[workplace] [nvarchar](50) NOT NULL,
	[skill] [nvarchar](100) NOT NULL,
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
--Bảng Header
CREATE TABLE [dbo].[Header](
	[IDHeader] [nvarchar](15) NOT NULL,
	[TieuDe] [nvarchar](100) NOT NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
	PRIMARY KEY CLUSTERED 
(
	[IDHeader] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--Bảng Banner
CREATE TABLE [dbo].[Banner](
	[IDBaner] [nvarchar](15) NOT NULL,
	[ImgBaner] [nvarchar](100) NOT NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBaner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--Bảng footer
--Bảng Tin Tức
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[IDTinTuc] [nvarchar](15) NOT NULL,
	[TieuDe] [nvarchar](100) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[HinhAnh] [nvarchar](100) NOT NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTinTuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
--Bảng Tin Tuyển dụng
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuyenDung](
	[IDTinTuyenDung] [nvarchar](15) NOT NULL,
	[TieuDe] [nvarchar](100) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[IDCongTy] [nvarchar](15) NOT NULL,
	[HinhAnh] [nvarchar](100) NOT NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTinTuyenDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TinTuyenDung]  WITH CHECK ADD FOREIGN KEY([IDCongTy])
REFERENCES [dbo].[DoanhNghiep] ([IDCongTy])
GO


--Khóa ngoại
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


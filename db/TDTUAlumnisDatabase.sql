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
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UsersName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Roles] [nvarchar](50) NOT NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UsersName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatBot]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatBot](
	[IDBot] [nvarchar](15) NOT NULL,
	[Prompt] [nvarchar](max) NOT NULL,
	[Result] [nvarchar](max) NOT NULL,
	[UsersName] [nvarchar](50) NULL,
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
CREATE TABLE [dbo].[Enterprise](
	[IDEnterprise] [nvarchar](15) NOT NULL,
	[EnterpriseName] [nvarchar](50) NOT NULL,
	[EnterpriseAddress] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Website] [nvarchar](50) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEnterprise] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[CuuHSSV]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumni](
	[IDAlumni] [nvarchar](15) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Nationality] [nvarchar](50) NOT NULL,
	[HomeTown] [nvarchar](50) NOT NULL,
	[PersonalWebsite] [nvarchar](50) NULL,
	[GraduationType] [nvarchar](50) NOT NULL,
	[Majors] [nvarchar](50) NOT NULL,
	[GraduationYear] [int] NOT NULL,
	[CurrentCompany] [nvarchar](50) NOT NULL,
	[AcademicLevel] [nvarchar](50) NOT NULL,
	[TimeToCompletionOfThesisDefense] [date] NOT NULL,
	[UsersName] [nvarchar](50) NULL,
	[jobBeginDate] [date] NOT NULL,
	[skill] [nvarchar](100) NOT NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
	
PRIMARY KEY CLUSTERED 
(
	[IDAlumni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanTriVien]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[IDAdmin] [nvarchar](15) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[UsersName] [nvarchar](50) NULL,
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

/****** Object:  Table [dbo].[ThongBao]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notify](
	[IDNotify] [nvarchar](15) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[IDSender] [nvarchar](15) NULL,
	[IDReceiver] [nvarchar](15) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDnotify] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


--Bảng Header
CREATE TABLE [dbo].[Header](
	[IDHeader] [nvarchar](15) NOT NULL,
	[TieuDe] [nvarchar](100) NOT NULL,
	[ImgLogo] [nvarchar](100) NOT NULL,
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

--bảng menu
CREATE TABLE [dbo].[Menu](
    [IDMenu] [nvarchar](15) NOT NULL,
    [Title] [nvarchar](100) NOT NULL,
    [ParentID] [nvarchar](15) NULL DEFAULT NULL, -- Đặt giá trị mặc định là NULL	
	[HasChild] [bit] NULL,
    [meta] [nvarchar](50) NULL,
    [hide] [bit] NULL,
    [order] [int] NULL,
    [datebegin] [smalldatetime] NULL,
    PRIMARY KEY CLUSTERED 
    (
        [IDMenu] ASC
    ) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY]
Go

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
CREATE TABLE [dbo].[News](
	[IDNews] [nvarchar](15) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ImgNews] [nvarchar](100) NOT NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDNews] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
--Bảng Tin Tuyển dụng
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecruitmentNews](
	[IDRecruitmentNews] [nvarchar](15) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ImgNews] [nvarchar](100) NOT NULL,
	[IDEnterprise] [nvarchar](15) NOT NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRecruitmentNews] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


ALTER TABLE [dbo].[RecruitmentNews]  WITH CHECK ADD FOREIGN KEY([IDEnterprise])
REFERENCES [dbo].[Enterprise] ([IDEnterprise])
GO


--Khóa ngoại
ALTER TABLE [dbo].[ChatBot]  WITH CHECK ADD FOREIGN KEY([UsersName])
REFERENCES [dbo].[Users] ([UsersName])
GO
ALTER TABLE [dbo].[Alumni]  WITH CHECK ADD FOREIGN KEY([UsersName])
REFERENCES [dbo].[Users] ([UsersName])
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD FOREIGN KEY([UsersName])
REFERENCES [dbo].[Users] ([UsersName])
GO

ALTER TABLE [dbo].[Notify]  WITH CHECK ADD FOREIGN KEY([IDSender])
REFERENCES [dbo].[Admin] ([IDAdmin])
GO
ALTER TABLE [dbo].[Notify]  WITH CHECK ADD FOREIGN KEY([IDreceiver])
REFERENCES [dbo].[Alumni] ([IDAlumni])
GO
/****** Object:  StoredProcedure [dbo].[CheckAccessRights]    Script Date: 22/2/2024 6:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Thủ tục kiểm tra quyền truy cập
/*CREATE PROCEDURE [dbo].[CheckAccessRights] 
    @Username NVARCHAR(50),
    @TableName NVARCHAR(50),
    @AccessGranted BIT OUTPUT
AS
BEGIN
    DECLARE @UserRole NVARCHAR(50);
    
    SELECT @UserRole = Roles
    FROM Users
    WHERE UserName = @Username;
    
    IF (@UserRole = @TableName)
    BEGIN
        SET @AccessGranted = 1; -- Access granted
    END
    ELSE
    BEGIN
        SET @AccessGranted = 0; -- Access denied
    END
END*/



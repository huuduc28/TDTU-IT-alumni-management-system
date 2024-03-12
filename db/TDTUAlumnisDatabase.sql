﻿USE [master]
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
--BẢNG CHATBOT
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

CREATE TABLE [dbo].[Enterprise](
	[IDEnterprise] [INT] IDENTITY(1,1) NOT NULL,
	[EnterpriseName] [nvarchar](50) NOT NULL,
	[EnterpriseAddress] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Website] [nvarchar](255) NULL,
	[ImgLogo] [nvarchar](255) NOT NULL,
	[meta] [nvarchar](255) NULL,
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

CREATE TABLE [dbo].[Alumni](
	---Thông tin cá nhân
    [IDAlumni] [nvarchar](15) NOT NULL,
    [Name] [nvarchar](50) NOT NULL,
    [Email] [nvarchar](50) NOT NULL,
    [Phone] [nvarchar](15) NOT NULL,
    [Birthday] [date] NOT NULL,
    [Gender] [nvarchar](10) NOT NULL,
    [ProfilePicture] [nvarchar](50) NULL,
    [Nationality] [nvarchar](50) NOT NULL,
    [HomeTown] [nvarchar](50) NOT NULL,
    [PersonalWebsite] [nvarchar](50) NULL,
	[skill] [nvarchar](100) NOT NULL,
	--Thông tin học vấn
    [GraduationType] [nvarchar](50) NOT NULL,
    [GraduationInfoID] [INT] Not NULL,--Bảng mới cần sử lý dựa vào id để lấy thông tin của Năm tốt nghiệp và ngành học
    [CurrentCompany] [nvarchar](50) NOT NULL,
    [AcademicLevel] [nvarchar](50) NOT NULL,
    [TimeToCompletionOfThesisDefense] [date] NOT NULL,
    [UsersName] [nvarchar](50) NULL,
	[Profession] [nvarchar](50) NOT NULL,
    [jobBeginDate] [date] NOT NULL,
    [skill] [nvarchar](100) NOT NULL,
	[Profession] [nvarchar](50) NOT NULL,
    [jobBeginDate] [date] NOT NULL, 
	--Thông tin tài khoản
	[Password] [nvarchar](50) NOT NULL,
    [meta] [nvarchar](50) NULL,
    [hide] [bit] NULL,
    [order] [int] NULL,
    [datebegin] [smalldatetime] NULL,
    PRIMARY KEY CLUSTERED ([IDAlumni] ASC)
);



/****** Object:  Table [dbo].[QuanTriVien]    Script Date: 22/2/2024 6:23:33 PM ******/

CREATE TABLE [dbo].[Admin](
	[IDAdmin] [nvarchar](15) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
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
--BẢNG THÔNG BÁO
CREATE TABLE [dbo].[Notify](
    [IDNotify] [INT] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
    [Content] [nvarchar](max) NOT NULL,
    [TargetType] [bit] NOT NULL, --- nếu là true tức là sẽ gửi cho nhóm đối tượng cụ thể 
    [IDSender] [nvarchar](15) NULL,
    [GraduationInfoID] [INT] NULL,
    [meta] [nvarchar](255) NULL,
    [hide] [bit] NULL,
    [order] [int] NULL,
    [datebegin] [smalldatetime] NULL,
    PRIMARY KEY CLUSTERED ([IDNotify] ASC)
);

--Drop table Notify

--BẢNG THÔNG TIN KHÓA HỌC
CREATE TABLE [dbo].[GraduationInfo](
    [ID] [INT] IDENTITY(1,1) NOT NULL,
    [Majors] [nvarchar](50) NOT NULL,
    [GraduationYear] [INT] NOT NULL,
	[meta] [nvarchar](255) NULL,
    [hide] [bit] NULL,
    [order] [int] NULL,
    [datebegin] [smalldatetime] NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

ALTER TABLE [dbo].[Alumni] WITH CHECK ADD CONSTRAINT [FK_Alumni_GraduationInfo] FOREIGN KEY([GraduationInfoID])
REFERENCES [dbo].[GraduationInfo] ([ID]);

ALTER TABLE [dbo].[Notify] WITH CHECK ADD CONSTRAINT [FK_Notify_GraduationInfo] FOREIGN KEY([GraduationInfoID])
REFERENCES [dbo].[GraduationInfo] ([ID]);

IF NOT EXISTS (SELECT * FROM sys.columns WHERE Name = 'GraduationInfoID' AND Object_ID = Object_ID(N'dbo.Notify'))
BEGIN
    ALTER TABLE dbo.Notify
    ADD GraduationInfoID INT NULL
END

--Bảng Header
CREATE TABLE [dbo].[Header](
	[IDHeader] [nvarchar](15) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
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

drop table Header

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

--BẢNG BANNER
CREATE TABLE [dbo].[Banner](
	[IDBanner] [INT] IDENTITY(1,1)  NOT NULL,
	[ImgBanner] [nvarchar](100) NOT NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDBanner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

Drop table Banner


--Bảng News
CREATE TABLE [dbo].[News](
    [IDNews] [INT] IDENTITY(1,1) NOT NULL,
    [Title] [nvarchar](255) NOT NULL,
    [Content] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
    [ImgNews] [nvarchar](100) NOT NULL,
    [meta] [nvarchar](255) NULL,
    [hide] [bit] NULL ,
    [order] [INT] NULL,
    [datebegin] [smalldatetime] NULL, -- Đặt mặc định là GETDATE()
    PRIMARY KEY CLUSTERED 
    (
        [IDNews] ASC
    ) WITH (
        PAD_INDEX = OFF, 
        STATISTICS_NORECOMPUTE = OFF, 
        IGNORE_DUP_KEY = OFF, 
        ALLOW_ROW_LOCKS = ON, 
        ALLOW_PAGE_LOCKS = ON, 
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

Drop table News

--Bảng Tin Tuyển dụng
CREATE TABLE [dbo].[RecruitmentNew](
    [IDRecruitmentNew] [INT] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Describe][nvarchar](max) NULL,
	[Content] [nvarchar](max) NOT NULL,
	[JobDescription] [nvarchar](max) NOT NULL,
	[IDEnterprise] [INT] NOT NULL,
	[meta] [nvarchar](255) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDRecruitmentNew] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--KHÓA NGOẠI CHO BẢNG CÔNG TY
ALTER TABLE [dbo].[RecruitmentNew]  WITH CHECK ADD FOREIGN KEY([IDEnterprise])
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
--ALTER TABLE [dbo].[Notify]  WITH CHECK ADD FOREIGN KEY([IDreceiver])
--REFERENCES [dbo].[Alumni] ([IDAlumni])
GO
/****** Object:  StoredProcedure [dbo].[CheckAccessRights]    Script Date: 22/2/2024 6:23:33 PM ******/


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



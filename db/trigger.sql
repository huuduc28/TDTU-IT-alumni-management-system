﻿USE [master]
GO
use TDTUAlumnis
GO

-- Tạo trigger cho bảng ChatBot
CREATE TRIGGER trg_ChatBot_AfterInsert
ON dbo.ChatBot
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.ChatBot;

    -- Cập nhật giá trị hide, datebegin, meta và [order] cho mỗi bản ghi mới
    
	UPDATE dbo.ChatBot
    SET hide = 1, 
        datebegin = GETDATE()
    FROM inserted
    WHERE dbo.ChatBot.IDBot = inserted.IDBot;

    -- Cập nhật giá trị [order] cho các bản ghi mới
    WITH UpdatedRows AS (
        SELECT IDBot, ROW_NUMBER() OVER (ORDER BY IDBot) AS NewOrder
        FROM dbo.ChatBot
        WHERE IDBot IN (SELECT IDBot FROM inserted)
    )
    UPDATE dbo.ChatBot
    SET [order] = @MaxOrder + NewOrder
    FROM UpdatedRows
    WHERE dbo.ChatBot.IDBot = UpdatedRows.IDBot;
END;
GO

-- Tạo trigger cho bảng CongTyDoanhNghiep
CREATE TRIGGER trg_Enterprise_AfterInsert
ON dbo.Enterprise
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.Enterprise;

    -- Cập nhật giá trị hide, datebegin, meta và [order] cho mỗi bản ghi mới
    UPDATE dbo.Enterprise
    SET hide = 1, 
        datebegin = GETDATE()
    FROM inserted
    WHERE dbo.Enterprise.IDEnterprise = inserted.IDEnterprise;

    -- Cập nhật giá trị [order] cho các bản ghi mới
    WITH UpdatedRows AS (
        SELECT IDEnterprise, ROW_NUMBER() OVER (ORDER BY IDEnterprise) AS NewOrder
        FROM dbo.Enterprise
        WHERE IDEnterprise IN (SELECT IDEnterprise FROM inserted)
    )
    UPDATE dbo.Enterprise
    SET [order] = @MaxOrder + NewOrder
    FROM UpdatedRows
    WHERE dbo.Enterprise.IDEnterprise = UpdatedRows.IDEnterprise;
END;
GO

-- Tạo trigger cho bảng CuuHSSV
CREATE TRIGGER trg_Alumni_AfterInsert
ON dbo.Alumni
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.Alumni;

    -- Cập nhật giá trị hide, datebegin, meta và [order] cho mỗi bản ghi mới
    UPDATE dbo.Alumni
    SET hide = 1, 
        datebegin = GETDATE()
    FROM inserted
    WHERE dbo.Alumni.IDAlumni = inserted.IDAlumni;

    -- Cập nhật giá trị [order] cho các bản ghi mới
    WITH UpdatedRows AS (
        SELECT IDAlumni, ROW_NUMBER() OVER (ORDER BY IDAlumni) AS NewOrder
        FROM dbo.Alumni
        WHERE IDAlumni IN (SELECT IDAlumni FROM inserted)
    )
    UPDATE dbo.Alumni
    SET [order] = @MaxOrder + NewOrder
    FROM UpdatedRows
    WHERE dbo.Alumni.IDAlumni = UpdatedRows.IDAlumni;
END;
GO

-- Tạo trigger cho bảng Admin
CREATE TRIGGER trg_Admin_AfterInsert
ON dbo.Admin
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.Admin;

    -- Cập nhật giá trị hide, datebegin, meta và [order] cho mỗi bản ghi mới
    UPDATE dbo.Admin
    SET hide = 1, 
        datebegin = GETDATE()
    FROM inserted
    WHERE dbo.Admin.IDAdmin = inserted.IDAdmin;

    -- Cập nhật giá trị [order] cho các bản ghi mới
    WITH UpdatedRows AS (
        SELECT IDAdmin, ROW_NUMBER() OVER (ORDER BY IDAdmin) AS NewOrder
        FROM dbo.Admin
        WHERE IDAdmin IN (SELECT IDAdmin FROM inserted)
    )
    UPDATE dbo.Admin
    SET [order] = @MaxOrder + NewOrder
    FROM UpdatedRows
    WHERE dbo.Admin.IDAdmin = UpdatedRows.IDAdmin;
END;
GO

-- Tạo trigger cho bảng TaiKhoan
CREATE TRIGGER trg_TaiKhoan_AfterInsert
ON dbo.Users
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.Users;

    -- Cập nhật giá trị hide, datebegin, meta và [order] cho mỗi bản ghi mới
    UPDATE dbo.Users
    SET hide = 1, 
        datebegin = GETDATE()
    FROM inserted
    WHERE dbo.Users.UsersName = inserted.UsersName;

    -- Cập nhật giá trị [order] cho các bản ghi mới
    WITH UpdatedRows AS (
        SELECT UsersName, ROW_NUMBER() OVER (ORDER BY UsersName) AS NewOrder
        FROM dbo.Users
        WHERE UsersName IN (SELECT UsersName FROM inserted)
    )
    UPDATE dbo.Users
    SET [order] = @MaxOrder + NewOrder
    FROM UpdatedRows
    WHERE dbo.Users.UsersName = UpdatedRows.UsersName;
END;
GO

-- Tạo trigger cho bảng Notification
CREATE TRIGGER trg_Notification_AfterInsert
ON dbo.Notification
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.Notification;

    -- Cập nhật giá trị hide, datebegin, meta và [order] cho mỗi bản ghi mới
    UPDATE dbo.Notification
    SET hide = 1, 
        datebegin = GETDATE()
    FROM inserted
    WHERE dbo.Notification.IDNotification = inserted.IDNotification;

    -- Cập nhật giá trị [order] cho các bản ghi mới
    WITH UpdatedRows AS (
        SELECT IDNotification, ROW_NUMBER() OVER (ORDER BY IDNotification) AS NewOrder
        FROM dbo.Notification
        WHERE IDNotification IN (SELECT IDNotification FROM inserted)
    )
    UPDATE dbo.Notification
    SET [order] = @MaxOrder + NewOrder
    FROM UpdatedRows
    WHERE dbo.Notification.IDNotification = UpdatedRows.IDNotification;
END;
GO


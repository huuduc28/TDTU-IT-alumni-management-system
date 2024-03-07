USE [master]
GO
use TDTUAlumnisManagementSystem
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

-- Tạo trigger cho bảng Notify
CREATE TRIGGER trg_Notify_AfterInsert
ON dbo.Notify
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.Notify;

    -- Cập nhật giá trị hide, datebegin, meta và [order] cho mỗi bản ghi mới
    UPDATE dbo.Notify
    SET hide = 1, 
        datebegin = GETDATE(),
		ReadStatus = 1
    FROM inserted
    WHERE dbo.Notify.IDNotify = inserted.IDNotify;

    -- Cập nhật giá trị [order] cho các bản ghi mới
    WITH UpdatedRows AS (
        SELECT IDNotify, ROW_NUMBER() OVER (ORDER BY IDNotify) AS NewOrder
        FROM dbo.Notify
        WHERE IDNotify IN (SELECT IDNotify FROM inserted)
    )
    UPDATE dbo.Notify
    SET [order] = @MaxOrder + NewOrder
    FROM UpdatedRows
    WHERE dbo.Notify.IDNotify = UpdatedRows.IDNotify;
END;
GO


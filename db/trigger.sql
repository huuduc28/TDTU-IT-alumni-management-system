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
        datebegin = GETDATE(),
        meta = NULL
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
CREATE TRIGGER trg_CongTyDoanhNghiep_AfterInsert
ON dbo.CongTyDoanhNghiep
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.CongTyDoanhNghiep;

    -- Cập nhật giá trị hide, datebegin, meta và [order] cho mỗi bản ghi mới
    UPDATE dbo.CongTyDoanhNghiep
    SET hide = 1, 
        datebegin = GETDATE(),
        meta = NULL
    FROM inserted
    WHERE dbo.CongTyDoanhNghiep.IDCongTy = inserted.IDCongTy;

    -- Cập nhật giá trị [order] cho các bản ghi mới
    WITH UpdatedRows AS (
        SELECT IDCongTy, ROW_NUMBER() OVER (ORDER BY IDCongTy) AS NewOrder
        FROM dbo.CongTyDoanhNghiep
        WHERE IDCongTy IN (SELECT IDCongTy FROM inserted)
    )
    UPDATE dbo.CongTyDoanhNghiep
    SET [order] = @MaxOrder + NewOrder
    FROM UpdatedRows
    WHERE dbo.CongTyDoanhNghiep.IDCongTy = UpdatedRows.IDCongTy;
END;
GO

-- Tạo trigger cho bảng CuuHSSV
CREATE TRIGGER trg_CuuHSSV_AfterInsert
ON dbo.CuuHSSV
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.CuuHSSV;

    -- Cập nhật giá trị hide, datebegin, meta và [order] cho mỗi bản ghi mới
    UPDATE dbo.CuuHSSV
    SET hide = 1, 
        datebegin = GETDATE(),
        meta = NULL
    FROM inserted
    WHERE dbo.CuuHSSV.IDHSSV = inserted.IDHSSV;

    -- Cập nhật giá trị [order] cho các bản ghi mới
    WITH UpdatedRows AS (
        SELECT IDHSSV, ROW_NUMBER() OVER (ORDER BY IDHSSV) AS NewOrder
        FROM dbo.CuuHSSV
        WHERE IDHSSV IN (SELECT IDHSSV FROM inserted)
    )
    UPDATE dbo.CuuHSSV
    SET [order] = @MaxOrder + NewOrder
    FROM UpdatedRows
    WHERE dbo.CuuHSSV.IDHSSV = UpdatedRows.IDHSSV;
END;
GO

-- Tạo trigger cho bảng QuanTriVien
CREATE TRIGGER trg_QuanTriVien_AfterInsert
ON dbo.QuanTriVien
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.QuanTriVien;

    -- Cập nhật giá trị hide, datebegin, meta và [order] cho mỗi bản ghi mới
    UPDATE dbo.QuanTriVien
    SET hide = 1, 
        datebegin = GETDATE(),
        meta = NULL
    FROM inserted
    WHERE dbo.QuanTriVien.IDAdmin = inserted.IDAdmin;

    -- Cập nhật giá trị [order] cho các bản ghi mới
    WITH UpdatedRows AS (
        SELECT IDAdmin, ROW_NUMBER() OVER (ORDER BY IDAdmin) AS NewOrder
        FROM dbo.QuanTriVien
        WHERE IDAdmin IN (SELECT IDAdmin FROM inserted)
    )
    UPDATE dbo.QuanTriVien
    SET [order] = @MaxOrder + NewOrder
    FROM UpdatedRows
    WHERE dbo.QuanTriVien.IDAdmin = UpdatedRows.IDAdmin;
END;
GO

-- Tạo trigger cho bảng TaiKhoan
CREATE TRIGGER trg_TaiKhoan_AfterInsert
ON dbo.TaiKhoan
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.TaiKhoan;

    -- Cập nhật giá trị hide, datebegin, meta và [order] cho mỗi bản ghi mới
    UPDATE dbo.TaiKhoan
    SET hide = 1, 
        datebegin = GETDATE(),
        meta = NULL
    FROM inserted
    WHERE dbo.TaiKhoan.TenTaiKhoan = inserted.TenTaiKhoan;

    -- Cập nhật giá trị [order] cho các bản ghi mới
    WITH UpdatedRows AS (
        SELECT TenTaiKhoan, ROW_NUMBER() OVER (ORDER BY TenTaiKhoan) AS NewOrder
        FROM dbo.TaiKhoan
        WHERE TenTaiKhoan IN (SELECT TenTaiKhoan FROM inserted)
    )
    UPDATE dbo.TaiKhoan
    SET [order] = @MaxOrder + NewOrder
    FROM UpdatedRows
    WHERE dbo.TaiKhoan.TenTaiKhoan = UpdatedRows.TenTaiKhoan;
END;
GO

-- Tạo trigger cho bảng ThongBao
CREATE TRIGGER trg_ThongBao_AfterInsert
ON dbo.ThongBao
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.ThongBao;

    -- Cập nhật giá trị hide, datebegin, meta và [order] cho mỗi bản ghi mới
    UPDATE dbo.ThongBao
    SET hide = 1, 
        datebegin = GETDATE(),
        meta = NULL
    FROM inserted
    WHERE dbo.ThongBao.IDThongBao = inserted.IDThongBao;

    -- Cập nhật giá trị [order] cho các bản ghi mới
    WITH UpdatedRows AS (
        SELECT IDThongBao, ROW_NUMBER() OVER (ORDER BY IDThongBao) AS NewOrder
        FROM dbo.ThongBao
        WHERE IDThongBao IN (SELECT IDThongBao FROM inserted)
    )
    UPDATE dbo.ThongBao
    SET [order] = @MaxOrder + NewOrder
    FROM UpdatedRows
    WHERE dbo.ThongBao.IDThongBao = UpdatedRows.IDThongBao;
END;
GO


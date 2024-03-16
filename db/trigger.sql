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
		role = 0,
        datebegin = GETDATE()
    FROM dbo.Alumni
    INNER JOIN inserted ON dbo.Alumni.IDAlumni = inserted.IDAlumni;

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





-- Tạo trigger cho bảng Notify
CREATE TRIGGER trg_Notify_AfterInsert
ON dbo.Notify
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy giá trị tối đa của cột "order"
    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.Notify;

    -- Cập nhật giá trị cho mỗi bản ghi mới
    UPDATE n
    SET [order] = @MaxOrder + 1, 
        hide = 1,  
        datebegin = GETDATE()  
    FROM dbo.Notify n
    INNER JOIN inserted i ON n.IDNotify = i.IDNotify;

END;
GO



CREATE TRIGGER trg_News_AfterInsert
ON dbo.News
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy giá trị tối đa của cột "order"
    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.News;

    -- Cập nhật giá trị cho mỗi bản ghi mới
    UPDATE n
    SET [order] = @MaxOrder + 1,  -- Tăng giá trị order lên 1 so với giá trị lớn nhất hiện có
        hide = 1,  -- Đặt cột "hide" thành true
        datebegin = GETDATE()  -- Đặt cột "datebegin" thành giá trị hiện tại
    FROM dbo.News n
    INNER JOIN inserted i ON n.IDNews = i.IDNews;

END;
GO


CREATE TRIGGER trg_Banner_AfterInsert
ON dbo.Banner
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy giá trị tối đa của cột "order"
    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.Banner;

    -- Cập nhật giá trị cho mỗi bản ghi mới
    UPDATE n
    SET [order] = @MaxOrder + 1, 
        hide = 1,  
        datebegin = GETDATE()  
    FROM dbo.Banner n
    INNER JOIN inserted i ON n.IDBanner = i.IDBanner;

END;
GO

/*-- TRIGGER AUTO GIÁ TRỊ CHO BẢNG DOANH NGHIỆP
CREATE TRIGGER trg_Enterprise_AfterInsert
ON dbo.Enterprise
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy giá trị tối đa của cột "order"
    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.Enterprise;

    -- Cập nhật giá trị cho mỗi bản ghi mới
    UPDATE n
    SET [order] = @MaxOrder + 1, 
        hide = 1,  
        datebegin = GETDATE()  
    FROM dbo.Enterprise n
    INNER JOIN inserted i ON n.IDEnterprise = i.IDEnterprise;

END;
GO*/

-- TRIGGER AUTO GIÁ TRỊ CHO BẢNG TIN TUYỂN DỤNG
CREATE TRIGGER trg_RecruitmentNew_AfterInsert
ON dbo.RecruitmentNew
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy giá trị tối đa của cột "order"
    DECLARE @MaxOrder INT;
    SELECT @MaxOrder = ISNULL(MAX([order]), 0) FROM dbo.RecruitmentNew;

    -- Cập nhật giá trị cho mỗi bản ghi mới
    UPDATE n
    SET [order] = @MaxOrder + 1, 
        hide = 1,  
        datebegin = GETDATE()  
    FROM dbo.RecruitmentNew n
    INNER JOIN inserted i ON n.IDRecruitmentNew = i.IDRecruitmentNew;

END;
GO

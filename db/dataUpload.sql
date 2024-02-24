USE [master]
GO
use TDTUAlumnisManagementSystem
GO

INSERT INTO TaiKhoan
	(TenTaiKhoan, MatKhau, PhanQuyen)
VALUES
	-- Dữ liệu cho admin
	('admin1', 'adminpass1', 'Admin'),
	('admin2', 'adminpass2', 'Admin'),
	('admin3', 'adminpass3', 'Admin'),
	('admin4', 'adminpass4', 'Admin'),
	('admin5', 'adminpass5', 'Admin'),
	('admin6', 'adminpass6', 'Admin'),
	('admin7', 'adminpass7', 'Admin'),
	('admin8', 'adminpass8', 'Admin'),
	('admin9', 'adminpass9', 'Admin'),
	('admin10', 'adminpass10', 'Admin'),

	-- Dữ liệu cho cựu học sinh - sinh viên
	('user1', 'password1', 'User'),
	('user2', 'password2', 'User'),
	('user3', 'password3', 'User'),
	('user4', 'password4', 'User'),
	('user5', 'password5', 'User'),
	('user6', 'password6', 'User'),
	('user7', 'password7', 'User'),
	('user8', 'password8', 'User'),
	('user9', 'password9', 'User'),
	('user10', 'password10', 'User');

-- Thêm dữ liệu vào bảng QuanTriVien
INSERT INTO QuanTriVien
	(IDAdmin, Ten, SoDienThoai, Email, TenTaiKhoan)
VALUES
	('admin001',N'John Doe', '0123456789', 'john.doe@example.com', 'admin1'),
	('admin002',N'Jane Smith', '0987654321', 'jane.smith@example.com', 'admin2'),
	('admin003',N'Michael Johnson', '0123456789', 'michael.johnson@example.com', 'admin3'),
	('admin004',N'Emily Brown', '0987654321', 'emily.brown@example.com', 'admin4'),
	('admin005',N'Matthew Wilson', '0123456789', 'matthew.wilson@example.com', 'admin5'),
	('admin006',N'Emma Davis', '0987654321', 'emma.davis@example.com', 'admin6'),
	('admin007',N'Olivia Martinez', '0123456789', 'olivia.martinez@example.com', 'admin7'),
	('admin008',N'Daniel Anderson', '0987654321', 'daniel.anderson@example.com', 'admin8'),
	('admin009',N'Sophia Thomas', '0123456789', 'sophia.thomas@example.com', 'admin9'),
	('admin010',N'Alexander Taylor', '0987654321', 'alexander.taylor@example.com', 'admin10');

-- Thêm dữ liệu vào bảng CuuHSSV
INSERT INTO CuuHSSV
	(IDHSSV, Ten, Email, SoDienThoai, NgaySinh, GioiTinh, QuocTich, QueQuan, CaNhan, XepLoaiTotNghiep, NganhHoc, NamTotNghiep, CongTyHienTai, HocVanCaoHoc, ThoiGianHoanThanhBaoVeLuanAn, TenTaiKhoan, jobBeginDate, workplace, skill)
VALUES
	('alumni001', N'Alice Smith', 'alice.smith@example.com', '0123456789', '1990-05-15', N'Nữ', N'Việt Nam', N'Hồ Chí Minh', N'Độc thân', N'Giỏi', N'Khoa Học Máy Tính', 2012, 'ABC Company', N'Thạc sĩ', '2022-01-01', 'user1', '2022-01-01', 'FPT SOFT', 'Java, Python'),
	('alumni002', N'Bob Johnson', 'bob.johnson@example.com', '0987654321', '1992-08-20', N'Nam', N'Việt Nam', N'Hà Nội', N'Độc thân', N'Khá', N'Kinh Tế', 2014, 'XYZ Corporation', N'Tiến sĩ', '2023-01-01', 'user2', '2023-01-01', 'TECHCOMPANY', 'Java, Python'),
	('alumni003', N'Emma Smith', 'emma.smith@example.com', '0123456789', '1993-05-20', N'Nữ', N'Việt Nam', N'Hà Nội', N'Độc thân', N'Giỏi', N'Khoa Học Máy Tính', 2013, 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user3', '2023-01-01', 'FPT SOFT', 'Java, Python'),
	('alumni004', N'Ethan Nguyen', 'ethan.nguyen@example.com', '0987654321', '1991-08-15', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'Độc thân', N'Khá', N'Kinh Tế', 2015, 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user4', '2024-01-01', 'TECHCOMPANY', 'Java, Python'),
	('alumni005', N'Ava Garcia', 'ava.garcia@example.com', '0123456789', '1992-06-10', N'Nữ', N'Việt Nam', N'Hà Nội', N'Độc thân', N'Giỏi', N'Khoa Học Máy Tính', 2014, 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user5', '2023-01-01', 'FPT SOFT', 'Java, Python'),
	('alumni006', N'Noah Hernandez', 'noah.hernandez@example.com', '0987654321', '1990-09-25', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'Độc thân', N'Khá', N'Kinh Tế', 2016, 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user6', '2024-01-01', 'TECHCOMPANY', 'Java, Python'),
	('alumni007', N'Isabella Lopez', 'isabella.lopez@example.com', '0123456789', '1991-07-30', N'Nữ', N'Việt Nam', N'Hà Nội', N'Độc thân', N'Giỏi', N'Khoa Học Máy Tính', 2015, 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user7', '2023-01-01', 'FPT SOFT', 'Java, Python'),
	('alumni008', N'Liam Lee', 'liam.lee@example.com', '0987654321', '1993-10-05', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'Độc thân', N'Khá', N'Kinh Tế', 2017, 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user8', '2024-01-01', 'TECHCOMPANY', 'Java, Python'),
	('alumni009', N'Mia Kim', 'mia.kim@example.com', '0123456789', '1992-08-10', N'Nữ', N'Việt Nam', N'Hà Nội', N'Độc thân', N'Giỏi', N'Khoa Học Máy Tính', 2016, 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user9', '2023-01-01', 'FPT SOFT', 'Java, Python'),
	('alumni010', N'William Wong', 'william.wong@example.com', '0987654321', '1990-11-15', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'Độc thân', N'Khá', N'Kinh Tế', 2018, 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user10', '2024-01-01', 'SHOPEE', 'Java, Python');

-- Thêm dữ liệu vào bảng CongTyDoanhNghiep
INSERT INTO CongTyDoanhNghiep
	(IDCongTy, TenCongTy, DiaChi, SoDienThoai, Email)
VALUES
	('enterprise001', N'ABC Company', N'123 Main Street, City, Country', '0123456789', 'info@abccompany.com'),
	('enterprise002', N'XYZ Corporation', N'456 First Avenue, City, Country', '0987654321', 'info@xyzcorp.com'),
	('enterprise003', N'ABC Company 2', N'123 Main Street, City, Country', '0123456789', 'info@abccompany2.com'),
	('enterprise004', N'XYZ Corporation 2', N'456 First Avenue, City, Country', '0987654321', 'info@xyzcorp2.com'),
	('enterprise005', N'ABC Company 3', N'123 Main Street, City, Country', '0123456789', 'info@abccompany3.com'),
	('enterprise006', N'XYZ Corporation 3', N'456 First Avenue, City, Country', '0987654321', 'info@xyzcorp3.com'),
	('enterprise007', N'ABC Company 4', N'123 Main Street, City, Country', '0123456789', 'info@abccompany4.com'),
	('enterprise008', N'XYZ Corporation 4', N'456 First Avenue, City, Country', '0987654321', 'info@xyzcorp4.com'),
	('enterprise009', N'ABC Company 5', N'123 Main Street, City, Country', '0123456789', 'info@abccompany5.com'),
	('enterprise010', N'XYZ Corporation 5', N'456 First Avenue, City, Country', '0987654321', 'info@xyzcorp5.com');

-- dữ liệu banner
INSERT INTO Banner
	(IDBaner, ImgBaner, meta, hide, [order], datebegin)
VALUES
	-- Dữ liệu cho admin
	('01', 'BannerIT.png', '', 1, 1, GETDATE()), 
	('02', 'BannerIT2.png', '', 1, 2, GETDATE()); 

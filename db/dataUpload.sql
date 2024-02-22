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
	('admin001','John Doe', '0123456789', 'john.doe@example.com', 'admin1'),
	('admin002','Jane Smith', '0987654321', 'jane.smith@example.com', 'admin2'),
	('admin003','Michael Johnson', '0123456789', 'michael.johnson@example.com', 'admin3'),
	('admin004','Emily Brown', '0987654321', 'emily.brown@example.com', 'admin4'),
	('admin005','Matthew Wilson', '0123456789', 'matthew.wilson@example.com', 'admin5'),
	('admin006','Emma Davis', '0987654321', 'emma.davis@example.com', 'admin6'),
	('admin007','Olivia Martinez', '0123456789', 'olivia.martinez@example.com', 'admin7'),
	('admin008','Daniel Anderson', '0987654321', 'daniel.anderson@example.com', 'admin8'),
	('admin009','Sophia Thomas', '0123456789', 'sophia.thomas@example.com', 'admin9'),
	('admin010','Alexander Taylor', '0987654321', 'alexander.taylor@example.com', 'admin10');

-- Thêm dữ liệu vào bảng CuuHSSV
INSERT INTO CuuHSSV
	(IDHSSV, Ten, Email, SoDienThoai, NgaySinh, GioiTinh, QuocTich, QueQuan, CaNhan, XepLoaiTotNghiep, NganhHoc, NamTotNghiep, CongTyHienTai, HocVanCaoHoc, ThoiGianHoanThanhBaoVeLuanAn, TenTaiKhoan)
VALUES
	('alumni001', 'Alice Smith', 'alice.smith@example.com', '0123456789', '1990-05-15', 'Nữ', 'Việt Nam', 'Hồ Chí Minh', 'Độc thân', 'Giỏi', 'Khoa Học Máy Tính', 2012, 'ABC Company', 'Thạc sĩ', '2022-01-01', 'user1'),
	('alumni002', 'Bob Johnson', 'bob.johnson@example.com', '0987654321', '1992-08-20', 'Nam', 'Việt Nam', 'Hà Nội', 'Độc thân', 'Khá', 'Kinh Tế', 2014, 'XYZ Corporation', 'Tiến sĩ', '2023-01-01', 'user2'),
	('alumni003', 'Emma Smith', 'emma.smith@example.com', '0123456789', '1993-05-20', 'Nữ', 'Việt Nam', 'Hà Nội', 'Độc thân', 'Giỏi', 'Khoa Học Máy Tính', 2013, 'ABC Company', 'Thạc sĩ', '2023-01-01', 'user3'),
	('alumni004', 'Ethan Nguyen', 'ethan.nguyen@example.com', '0987654321', '1991-08-15', 'Nam', 'Việt Nam', 'Hồ Chí Minh', 'Độc thân', 'Khá', 'Kinh Tế', 2015, 'XYZ Corporation', 'Tiến sĩ', '2024-01-01', 'user4'),
	('alumni005', 'Ava Garcia', 'ava.garcia@example.com', '0123456789', '1992-06-10', 'Nữ', 'Việt Nam', 'Hà Nội', 'Độc thân', 'Giỏi', 'Khoa Học Máy Tính', 2014, 'ABC Company', 'Thạc sĩ', '2023-01-01', 'user5'),
	('alumni006', 'Noah Hernandez', 'noah.hernandez@example.com', '0987654321', '1990-09-25', 'Nam', 'Việt Nam', 'Hồ Chí Minh', 'Độc thân', 'Khá', 'Kinh Tế', 2016, 'XYZ Corporation', 'Tiến sĩ', '2024-01-01', 'user6'),
	('alumni007', 'Isabella Lopez', 'isabella.lopez@example.com', '0123456789', '1991-07-30', 'Nữ', 'Việt Nam', 'Hà Nội', 'Độc thân', 'Giỏi', 'Khoa Học Máy Tính', 2015, 'ABC Company', 'Thạc sĩ', '2023-01-01', 'user7'),
	('alumni008', 'Liam Lee', 'liam.lee@example.com', '0987654321', '1993-10-05', 'Nam', 'Việt Nam', 'Hồ Chí Minh', 'Độc thân', 'Khá', 'Kinh Tế', 2017, 'XYZ Corporation', 'Tiến sĩ', '2024-01-01', 'user8'),
	('alumni009', 'Mia Kim', 'mia.kim@example.com', '0123456789', '1992-08-10', 'Nữ', 'Việt Nam', 'Hà Nội', 'Độc thân', 'Giỏi', 'Khoa Học Máy Tính', 2016, 'ABC Company', 'Thạc sĩ', '2023-01-01', 'user9'),
	('alumni010', 'William Wong', 'william.wong@example.com', '0987654321', '1990-11-15', 'Nam', 'Việt Nam', 'Hồ Chí Minh', 'Độc thân', 'Khá', 'Kinh Tế', 2018, 'XYZ Corporation', 'Tiến sĩ', '2024-01-01', 'user10');

-- Thêm dữ liệu vào bảng CongTyDoanhNghiep
INSERT INTO CongTyDoanhNghiep
	(IDCongTy, TenCongTy, DiaChi, SoDienThoai, Email)
VALUES
	('enterprise001', 'ABC Company', '123 Main Street, City, Country', '0123456789', 'info@abccompany.com'),
	('enterprise002', 'XYZ Corporation', '456 First Avenue, City, Country', '0987654321', 'info@xyzcorp.com'),
	('enterprise003', 'ABC Company 2', '123 Main Street, City, Country', '0123456789', 'info@abccompany2.com'),
	('enterprise004', 'XYZ Corporation 2', '456 First Avenue, City, Country', '0987654321', 'info@xyzcorp2.com'),
	('enterprise005', 'ABC Company 3', '123 Main Street, City, Country', '0123456789', 'info@abccompany3.com'),
	('enterprise006', 'XYZ Corporation 3', '456 First Avenue, City, Country', '0987654321', 'info@xyzcorp3.com'),
	('enterprise007', 'ABC Company 4', '123 Main Street, City, Country', '0123456789', 'info@abccompany4.com'),
	('enterprise008', 'XYZ Corporation 4', '456 First Avenue, City, Country', '0987654321', 'info@xyzcorp4.com'),
	('enterprise009', 'ABC Company 5', '123 Main Street, City, Country', '0123456789', 'info@abccompany5.com'),
	('enterprise010', 'XYZ Corporation 5', '456 First Avenue, City, Country', '0987654321', 'info@xyzcorp5.com');



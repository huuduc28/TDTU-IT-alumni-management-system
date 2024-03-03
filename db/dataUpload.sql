USE [master]
GO
use TDTUAlumnisManagrmentSystem
GO

INSERT INTO Users
	(UsersName, Password, Roles)
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
INSERT INTO Admin
	(IDAdmin, Name, Phone, Email, UsersName)
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
INSERT INTO Alumni
	(IDAlumni, Name, Email, Phone, Birthday, Gender, Nationality, HomeTown, PersonalWebsite, GraduationType, Majors, GraduationYear, CurrentCompany, AcademicLevel, TimeToCompletionOfThesisDefense, UsersName, jobBeginDate, skill)
VALUES
	('alumni001', N'Alice Smith', 'alice.smith@example.com', '0123456789', '1990-05-15', N'Nữ', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Giỏi', N'Khoa Học Máy Tính', 2012, 'ABC Company', N'Thạc sĩ', '2022-01-01', 'user1', '2022-01-01', 'Java, Python'),
	('alumni002', N'Bob Johnson', 'bob.johnson@example.com', '0987654321', '1992-08-20', N'Nam', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Khá', N'Kinh Tế', 2014, 'XYZ Corporation', N'Tiến sĩ', '2023-01-01', 'user2', '2023-01-01',  'Java, Python'),
	('alumni003', N'Emma Smith', 'emma.smith@example.com', '0123456789', '1993-05-20', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', N'Khoa Học Máy Tính', 2013, 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user3', '2023-01-01',  'Java, Python'),
	('alumni004', N'Ethan Nguyen', 'ethan.nguyen@example.com', '0987654321', '1991-08-15', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', N'Kinh Tế', 2015, 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user4', '2024-01-01',  'Java, Python'),
	('alumni005', N'Ava Garcia', 'ava.garcia@example.com', '0123456789', '1992-06-10', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', N'Khoa Học Máy Tính', 2014, 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user5', '2023-01-01',  'Java, Python'),
	('alumni006', N'Noah Hernandez', 'noah.hernandez@example.com', '0987654321', '1990-09-25', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', N'Kinh Tế', 2016, 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user6', '2024-01-01',  'Java, Python'),
	('alumni007', N'Isabella Lopez', 'isabella.lopez@example.com', '0123456789', '1991-07-30', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', N'Khoa Học Máy Tính', 2015, 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user7', '2023-01-01',  'Java, Python'),
	('alumni008', N'Liam Lee', 'liam.lee@example.com', '0987654321', '1993-10-05', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', N'Kinh Tế', 2017, 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user8', '2024-01-01',  'Java, Python'),
	('alumni009', N'Mia Kim', 'mia.kim@example.com', '0123456789', '1992-08-10', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', N'Khoa Học Máy Tính', 2016, 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user9', '2023-01-01',  'Java, Python'),
	('alumni010', N'William Wong', 'william.wong@example.com', '0987654321', '1990-11-15', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', N'Kinh Tế', 2018, 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user10', '2024-01-01', 'Java, Python');

-- Thêm dữ liệu vào bảng CongTyDoanhNghiep
INSERT INTO Enterprise
	(IDEnterprise, EnterpriseName, EnterpriseAddress, Phone, Email)
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
	-- Dữ liệu cho Banner
	('01', 'BannerIT.png', '', 1, 1, GETDATE()), 
	('02', 'BannerIT2.png', '', 1, 2, GETDATE()); 

-- dữ liệu Menu
INSERT INTO Menu
	(IDMenu, Title ,ParentID,HasChild, meta, hide, [order], datebegin)
VALUES
	('01', N'Trang chủ',Null,0, '/', 1, 1, GETDATE()),
	('02', N'Sinh viên',Null,0, 'cuu-sinh-vien', 1, 2, GETDATE()), 
	('03', N'Doanh nghiệp',null,0, 'doanh-nghiep', 1, 3, GETDATE()), 
	('04', N'Hỗ Trợ',NULL,1, '', 1, 4, GETDATE()), 
	('05', N'Thông báo',NULL,1, '', 1, 5, GETDATE()), 
	('06', N'BOT Chat','04',0, 'bot-chat', 1, 6, GETDATE()), 
	('07', N'Liên hệ khoa','04',0, 'https://www.facebook.com/it.tdtu.edu.vn', 1, 7, GETDATE()), 
	('08', N'Tạo thông báo','05',0, 'thong-bao', 1, 8, GETDATE());


-- dữ liệu header
INSERT INTO Header
	(IDHeader,TieuDe,ImgLogo, meta, hide, [order], datebegin)
VALUES
	-- Dữ liệu cho Banner
	('01',N'Cổng thông tin cựu sinh viên','logo-tdtu.png', '', 1, 1, GETDATE());

select * from News

INSERT INTO News
	(IDNews, Title ,Content,ImgNews, meta, hide, [order], datebegin)
VALUES
	('01', N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','New.jpg', 'tin-hom-nay', 1, 1, GETDATE()),
	('02', N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','New.jpg', 'tin-hom-nay', 1, 1, GETDATE()),
	('03', N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','New.jpg', 'tin-hom-nay', 1, 1, GETDATE()),
	('04', N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','New.jpg', 'tin-hom-nay', 1, 1, GETDATE()),
	('05', N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','New.jpg', 'tin-hom-nay', 1, 1, GETDATE());


INSERT INTO Notify
	(IDNotify, Title ,Content,IDSender,IDReceiver, meta, hide, [order], datebegin)
VALUES
	('01', N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','01','01', 'tin-hom-nay', 1, 1, GETDATE()),
	('02', N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','01','01', 'tin-hom-nay', 1, 1, GETDATE()),
	('03', N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','01','01', 'tin-hom-nay', 1, 1, GETDATE()),
	('04', N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','01','01', 'tin-hom-nay', 1, 1, GETDATE()),
	('05', N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','01','01', 'tin-hom-nay', 1, 1, GETDATE());
	
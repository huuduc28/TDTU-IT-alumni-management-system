﻿USE [master]
GO
use TDTUAlumnisManagementSystem
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

INSERT INTO GraduationInfo (Majors, GraduationYear)
VALUES 
    (N'Khoa học máy tính', 2019),
    (N'Kỹ thuật phần mềm', 2019),
    (N'Mạng Máy Tính Và Truyền Thông Dữ Liệu', 2019),
    (N'Khoa học máy tính', 2020),
    (N'Kỹ thuật phần mềm', 2020),
    (N'Mạng Máy Tính Và Truyền Thông Dữ Liệu', 2020),
    (N'Khoa học máy tính', 2021),
    (N'Kỹ thuật phần mềm', 2021),
    (N'Mạng Máy Tính Và Truyền Thông Dữ Liệu', 2021),
    (N'Khoa học máy tính', 2022),
    (N'Kỹ thuật phần mềm', 2022),
    (N'Mạng Máy Tính Và Truyền Thông Dữ Liệu', 2022),
    (N'Khoa học máy tính', 2023),
    (N'Kỹ thuật phần mềm', 2023),
    (N'Mạng Máy Tính Và Truyền Thông Dữ Liệu', 2023);

-- Thêm dữ liệu vào bảng CuuHSSV
INSERT INTO Alumni
	(IDAlumni, Name, Email, Phone, Birthday, Gender, Nationality, HomeTown, PersonalWebsite, GraduationType, CurrentCompany, AcademicLevel, TimeToCompletionOfThesisDefense, UsersName, jobBeginDate, skill, Profession, GraduationInfoID)
VALUES
	('alumni001', N'Alice Smith', 'alice.smith@example.com', '0123456789', '1990-05-15', N'Nữ', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ', '2022-01-01', 'user1', '2022-01-01', 'Java, Python', 'Back-end dev', 1),
	('alumni002', N'Bob Johnson', 'bob.johnson@example.com', '0987654321', '1992-08-20', N'Nam', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2023-01-01', 'user2', '2023-01-01',  'Java, Python', 'Back-end dev', 2),
	('alumni003', N'Emma Smith', 'emma.smith@example.com', '0123456789', '1993-05-20', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user3', '2023-01-01',  'Java, Python', 'Back-end dev', 3),
	('alumni004', N'Ethan Nguyen', 'ethan.nguyen@example.com', '0987654321', '1991-08-15', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user4', '2024-01-01',  'Java, Python', 'Back-end dev', 4),
	('alumni005', N'Ava Garcia', 'ava.garcia@example.com', '0123456789', '1992-06-10', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user5', '2023-01-01',  'Java, Python', 'Back-end dev', 5),
	('alumni006', N'Noah Hernandez', 'noah.hernandez@example.com', '0987654321', '1990-09-25', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user6', '2024-01-01',  'Java, Python', 'Back-end dev', 6),
	('alumni007', N'Isabella Lopez', 'isabella.lopez@example.com', '0123456789', '1991-07-30', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user7', '2023-01-01',  'Java, Python', 'Back-end dev', 7),
	('alumni008', N'Liam Lee', 'liam.lee@example.com', '0987654321', '1993-10-05', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user8', '2024-01-01',  'Java, Python', 'Front-end dev', 8),
	('alumni009', N'Mia Kim', 'mia.kim@example.com', '0123456789', '1992-08-10', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user9', '2023-01-01',  'Java, Python','Front-end dev', 9),
	('alumni010', N'William Wong', 'william.wong@example.com', '0987654321', '1990-11-15', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user10', '2024-01-01', 'Java, Python','Front-end dev', 10),
	('alumni0011', N'Noah Hernandez', 'noah.hernandez@example.com', '0987654321', '1990-09-25', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user6', '2024-01-01',  'Java, Python','Front-end dev', 11),
	('alumni0012', N'Isabella Lopez', 'isabella.lopez@example.com', '0123456789', '1991-07-30', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user7', '2023-01-01',  'Java, Python','Front-end dev', 12),
	('alumni0013', N'Liam Lee', 'liam.lee@example.com', '0987654321', '1993-10-05', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user8', '2024-01-01',  'Java, Python','Front-end dev', 13),
	('alumni0014', N'Mia Kim', 'mia.kim@example.com', '0123456789', '1992-08-10', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ', '2023-01-01', 'user9', '2023-01-01',  'Java, Python','Front-end dev', 14),
	('alumni0015', N'William Wong', 'william.wong@example.com', '0987654321', '1990-11-15', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'user10', '2024-01-01', 'Java, Python','Front-end dev', 15);


-- Thêm dữ liệu vào bảng CongTyDoanhNghiep
INSERT INTO Enterprise
	(IDEnterprise, EnterpriseName, EnterpriseAddress, Phone, Email,ImgLogo, meta, hide, [order], datebegin)
VALUES
	('enterprise001', N'ABC Company', N'123 Main Street, City, Country', '0123456789', 'info@abccompany.com','LogoIT.png','cong-ty',1, 1, GETDATE()),
	('enterprise002', N'XYZ Corporation', N'456 First Avenue, City, Country', '0987654321', 'info@xyzcorp.com','LogoIT.png','cong-ty',1, 2, GETDATE()),
	('enterprise003', N'ABC Company 2', N'123 Main Street, City, Country', '0123456789', 'info@abccompany2.com','LogoIT.png','cong-ty',1, 3, GETDATE()),
	('enterprise004', N'XYZ Corporation 2', N'456 First Avenue, City, Country', '0987654321', 'info@xyzcorp2.com','LogoIT.png','cong-ty',1, 4, GETDATE()),
	('enterprise005', N'ABC Company 3', N'123 Main Street, City, Country', '0123456789', 'info@abccompany3.com','LogoIT.png','cong-ty',1, 5, GETDATE()),
	('enterprise006', N'XYZ Corporation 3', N'456 First Avenue, City, Country', '0987654321', 'info@xyzcorp3.com','LogoIT.png','cong-ty',1, 6, GETDATE()),
	('enterprise007', N'ABC Company 4', N'123 Main Street, City, Country', '0123456789', 'info@abccompany4.com','LogoIT.png','cong-ty',1, 7, GETDATE()),
	('enterprise008', N'XYZ Corporation 4', N'456 First Avenue, City, Country', '0987654321', 'info@xyzcorp4.com','LogoIT.png','cong-ty',1, 8, GETDATE()),
	('enterprise009', N'ABC Company 5', N'123 Main Street, City, Country', '0123456789', 'info@abccompany5.com','LogoIT.png','cong-ty',1, 9, GETDATE()),
	('enterprise010', N'XYZ Corporation 5', N'456 First Avenue, City, Country', '0987654321', 'info@xyzcorp5.com','LogoIT.png','cong-ty',1, 10, GETDATE());

-- dữ liệu banner
INSERT INTO Banner
	(ImgBanner, meta)
VALUES
	-- Dữ liệu cho Banner
	('BannerIT.png', 'banner'), 
	('BannerIT2.png', 'banner'); 

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
	(IDHeader,Title,ImgLogo, meta, hide, [order], datebegin)
VALUES
	('01',N'Cổng thông tin cựu sinh viên','logo-tdtu.png', '', 1, 1, GETDATE());

select * from News

INSERT INTO [dbo].[News] ([Title], [Content], [Description], [ImgNews], [meta], [hide])
VALUES (N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',
N'Ngày 07/03/2024 tại Paris, Cộng hoà Pháp, đoàn công tác của Trường Đại học Tôn Đức Thắng (TDTU) đã có buổi làm việc và ký kết hợp tác với Trường Kinh doanh Emlyon (Emlyon), một trong những trường đại học đào tạo kinh doanh tốt nhất của Cộng hoà Pháp và Châu Âu.

Trong khuôn khổ hợp tác TDTU và Emlyon thống nhất triển khai và triển khai chương trình liên kết đào tạo (2 + 2) ngành Quản trị kinh doanh. Đây là chương trình hợp tác đầu tiên của Emlyon tại Việt Nam và Đông Nam Á.

Bên cạnh chương trình hợp tác liên kết đào tạo ngành quản trị kinh doanh, lãnh đạo hai trường đã trao đổi và thống nhất mở rộng các chương trình hợp tác khác với mục tiêu thiết lập quan hệ hợp tác chiến lược giữa hai Trường trong việc đào tạo và nghiên cứu trong các lĩnh vực Kinh doanh, Tài chính, Marketing…vv; thúc đẩy hợp tác trao đổi sinh viên/giảng viên; hợp tác chuyển giao công nghệ; đồng tổ chức hội thảo quốc tế; và đặc biệt định hướng lựa chọn TDTU là nơi hợp tác triển khai mở rộng và chuyển giao các chương trình đào tạo kinh doanh uy tín của Emlyon trong tương lai tại khu vực Đông Nam Á.'
, N'Trường Đại học Tôn Đức Thắng tuyển dụng nhân sự các vị trí: giảng viên, giáo viên, nghiên cứu viên, viên chức hành chính, ...','New.jpg', 'tin-hom-nay', 1);



INSERT INTO Notify
	(Title ,[Description],Content,TargetType,IDSender, meta)
VALUES
	(N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.',0,'admin001', 'tin-hom-nay');

INSERT INTO Notify
	(Title ,[Description],Content,TargetType,IDSender,GraduationInfoID, meta)
VALUES
	(N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.',0,'admin001',15,'tin-hom-nay');





INSERT INTO RecruitmentNew
	(IDRecruitmentNew, Title ,Content,IDEnterprise, meta, hide, [order], datebegin)
VALUES
	('01', N'FPT Software tuyển dụng Fresher.Net',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','enterprise001', 'tuyen-dung', 1, 1, GETDATE()),
	('02', N'FPT Software tuyển dụng Fresher.Net',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','enterprise001', 'tuyen-dung', 1, 1, GETDATE()),
	('03', N'FPT Software tuyển dụng Fresher.Net',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','enterprise001', 'tuyen-dung', 1, 1, GETDATE()),
	('04', N'FPT Software tuyển dụng Fresher.Net',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','enterprise001', 'tuyen-dung', 1, 1, GETDATE()),
	('05', N'FPT Software tuyển dụng Fresher.Net',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','enterprise001', 'tuyen-dung', 1, 1, GETDATE());
	

select * from RecruitmentNew
select * from Enterprise
select * from Banner

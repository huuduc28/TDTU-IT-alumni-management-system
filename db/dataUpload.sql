USE [master]
GO
use TDTUAlumnisManagementSystem
GO

-- Thêm dữ liệu vào bảng QuanTriVien
INSERT INTO Administrators
	(IDAdmin, [Name], Phone, Email, [Password])
VALUES
	('admin01',N'Admin', '0377777777', 'admin@gmail.com', '$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000645',N'Nguyễn Hữu Đức', '0377777777', 'nguyenhuuduc@gmail.com', '$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('admin03',N'Phạm Nguyễn', '0377777777', 'phamnguyen@gmail.com', '$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm');


-- Thêm dữ liệu vào bảng khóa học
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
	(IDAlumni, Name, Email, Phone, Birthday, Gender, Nationality, HomeTown, PersonalWebsite, GraduationType, CurrentCompany, AcademicLevel,jobBeginDate, skill, Profession,GraduationInfoID,ProfilePicture,[ReceiveNews],[TypeOfTraining],[Password])
VALUES
	('52000645', N'Nguyễn Hữu Đức', 'nduc3281@gmail.com', '0123456789', '1990-05-15', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ', '2022-01-01', 'Java, Python', 'Back-end dev',1,'AvataNam1.png','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000001', N'Nguyễn Văn Minh', 'nguyenvanminh@gmail.com', '0987654321', '1992-08-20', N'Nam', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2023-01-01',  'Java, Python', 'Back-end dev',2,'AvataNam2.png','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000002', N'Lê Minh Quân', 'leminhquan@gmail.com', '0123456789', '1993-05-20', N'Nam', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ',  '2023-01-01',  'Java, Python', 'Back-end dev',3,'AvataNam3.png','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000003', N'Lê Minh Quốc', 'leminhquoc@gmail.com', '0987654321', '1991-08-15', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01',  'Java, Python', 'Back-end dev',4,'AvataNam1.png','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000004', N'Trần Quốc Phong', 'tranquocphong@gmail.com', '0123456789', '1992-06-10', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ',  '2023-01-01',  'Java, Python', 'Back-end dev',5,'AvataNam2.png','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000005', N'Đinh Văn Dũng', 'dinhvandung@gmail.com', '0987654321', '1990-09-25', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ',  '2024-01-01',  'Java, Python', 'Back-end dev',6,'AvataNam3.png','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000006', N'Bùi Tuấn Anh', 'buituananh@gmail.com', '0123456789', '1991-07-30', N'Nam', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ',  '2023-01-01',  'Java, Python', 'Back-end dev',7,'AvataNam2.png','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000007', N'Vũ Kiên Trung', 'vukientrung@gmail.com', '0987654321', '1993-10-05', N'Nam', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01',  'Java, Python', 'Front-end dev',1,'AvataNam3.png','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000008', N'Vũ Kiên Minh', 'vukienminh@gmail.com', '0123456789', '1992-08-10', N'Nam', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ', '2023-01-01', 'Java, Python','Front-end dev',6,'AvataNam4.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	
	('52000009', N'Nguyễn Thị Linh', 'nguyenthilinh@gmail.com', '0987654321', '1990-11-15', N'Nữ', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'Java, Python','Front-end dev',1,'avatanu1.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000010', N'Phạm Thị Nga', 'phamthinga@gmail.com', '0987654321', '1990-09-25', N'Nữ', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01',  'Java, Python','Front-end dev',1,'avatanu2.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000011', N'Trần Thị Trang', 'tranthitrang@gmail.com', '0123456789', '1991-07-30', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ',  '2023-01-01',  'Java, Python','Front-end dev',2,'avatanu3.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000012', N'Lê Thị Dung', 'lethidung@gmail.com', '0987654321', '1993-10-05', N'Nữ', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01',  'Java, Python','Front-end dev',3,'avatanu1.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000013', N'Bùi Thị Hằng', 'buithihang@gmail.com', '0123456789', '1992-08-10', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ', '2023-01-01',  'Java, Python','Front-end dev',4,'avatanu2.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000014', N'Vũ Thị Loan', 'vuthiloan@gmail.com', '0987654321', '1990-11-15', N'Nữ', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'Java, Python','Front-end dev',5,'avatanu1.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	
	('52000015', N'Nguyễn Thị Hoa', 'nguyenthihoa@gmail.com', '0987654321', '1990-11-15', N'Nữ', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'Java, Python','Front-end dev',1,'avatanu1.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000016', N'Phạm Thị Trang', 'phamthitrang@gmail.com', '0987654321', '1990-09-25', N'Nữ', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01',  'Java, Python','Front-end dev',1,'avatanu2.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000017', N'Trần Thị Nga', 'tranthinga@gmail.com', '0123456789', '1991-07-30', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ',  '2023-01-01',  'Java, Python','Front-end dev',2,'avatanu3.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000018', N'Trần Thị Dung', 'tranthidung@gmail.com', '0987654321', '1993-10-05', N'Nữ', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01',  'Java, Python','Front-end dev',3,'avatanu1.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000019', N'Bùi Thị Loan', 'buithiloan@gmail.com', '0123456789', '1992-08-10', N'Nữ', N'Việt Nam', N'Hà Nội', N'abcxyz.com', N'Giỏi', 'ABC Company', N'Thạc sĩ', '2023-01-01',  'Java, Python','Front-end dev',4,'avatanu2.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm'),
	('52000020', N'Vũ Thị Hằng', 'vuthihang@gmail.com', '0987654321', '1990-11-15', N'Nữ', N'Việt Nam', N'Hồ Chí Minh', N'abcxyz.com', N'Khá', 'XYZ Corporation', N'Tiến sĩ', '2024-01-01', 'Java, Python','Front-end dev',5,'avatanu1.jpg','$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm');


-- Thêm dữ liệu vào bảng CongTyDoanhNghiep
INSERT INTO Enterprise
	(EnterpriseName, EnterpriseAddress, Phone, Email,[Website],ImgLogo,meta)
VALUES
	(N'FPT Software', N'492 Lê Văn Lương, Hà Nội, Việt Nam', '19001478', 'fpt@gmail.com','https://fptsoftware.com/','Fpt.png','cong-ty'),
	(N'Công ty TNHH GAMELOFT', N'492 Lê Văn Lương, Hồ Chí Minh, Việt Nam','19001234','gameloft@gmail.com','https://www.gameloft.com','gameloft.png','cong-ty'),
	(N'Công ty Cổ phần Phần mềm TPS', N'492 Lê Văn Lương, Hà Nội, Việt Nam', '0349999999', 'tpssoft@gmail.com','https://tpssoft.com//','TPS.png','cong-ty'),
	(N'Công ty TNHH TECHBASE VIỆT NAM', N'493 Lê Văn Lương, Hà Nội, Việt Nam', '0349999988', 'techbasevn@gmail.com','https://www.techbasevn.com/','TechBase.png','cong-ty'),
	(N'Axon Active', N'496 Lê Văn Lương, Hà Nội, Việt Nam', '0349999977', 'axonactive@gmail.com','https://www.axonactive.com','Axon.png','cong-ty'),
	(N'Netcompany', N'500 Lê Văn Lương, Hà Nội, Việt Nam', '0349999966', 'netcompany@gmail.com','https://www.netcompany.com','NET.png','cong-ty');



-- dữ liệu banner
INSERT INTO Banner
	(ImgBanner, meta)
VALUES
	('BannerIT.png', 'banner'), 
	('BannerIT2.png', 'banner'); 

-- dữ liệu Menu
INSERT INTO Menu
	(Title ,ParentID,HasChild, meta)
VALUES
	(N'Trang chủ',Null,0, ''),
	( N'Sinh viên',Null,0, 'cuu-sinh-vien'), 
	(N'Doanh nghiệp',null,0, 'doanh-nghiep'), 
	(N'Hỗ Trợ',NULL,1, ''), 
	(N'Thông báo',NULL,0, 'thong-bao'), 
	(N'BOT Chat','04',0, 'bot-chat'), 
	(N'Liên hệ khoa','04',0, 'https://www.facebook.com/it.tdtu.edu.vn');
	

-- dữ liệu header
INSERT INTO Header
	(Title,ImgLogo, meta, hide, [order], datebegin)
VALUES
	(N'Hệ thống quản lý cựu sinh viên','logo-tdtu.png', '', 1, 1, GETDATE());


INSERT INTO [dbo].[News] ([Title], [Content], [Description], [ImgNews], [meta], [hide])
VALUES (N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',
N'Ngày 07/03/2024 tại Paris, Cộng hoà Pháp, đoàn công tác của Trường Đại học Tôn Đức Thắng (TDTU) đã có buổi làm việc và ký kết hợp tác với Trường Kinh doanh Emlyon (Emlyon), một trong những trường đại học đào tạo kinh doanh tốt nhất của Cộng hoà Pháp và Châu Âu.
Trong khuôn khổ hợp tác TDTU và Emlyon thống nhất triển khai và triển khai chương trình liên kết đào tạo (2 + 2) ngành Quản trị kinh doanh. Đây là chương trình hợp tác đầu tiên của Emlyon tại Việt Nam và Đông Nam Á.
Bên cạnh chương trình hợp tác liên kết đào tạo ngành quản trị kinh doanh, lãnh đạo hai trường đã trao đổi và thống nhất mở rộng các chương trình hợp tác khác với mục tiêu thiết lập quan hệ hợp tác chiến lược giữa hai Trường trong việc đào tạo và nghiên cứu trong các lĩnh vực Kinh doanh, Tài chính, Marketing…vv; thúc đẩy hợp tác trao đổi sinh viên/giảng viên; hợp tác chuyển giao công nghệ; đồng tổ chức hội thảo quốc tế; và đặc biệt định hướng lựa chọn TDTU là nơi hợp tác triển khai mở rộng và chuyển giao các chương trình đào tạo kinh doanh uy tín của Emlyon trong tương lai tại khu vực Đông Nam Á.'
, N'Trường Đại học Tôn Đức Thắng tuyển dụng nhân sự các vị trí: giảng viên, giáo viên, nghiên cứu viên, viên chức hành chính, ...','New.jpg', 'tin-hom-nay', 1),
--tin2
(N'Trường Đại học Tôn Đức Thắng tổ chức Lễ trao tặng Huy hiệu Đảng và Hội nghị tổng kết công tác xây dựng Đảng năm 2023, triển khai nhiệm vụ năm 2024',
N'Ngày 12/3/2024, Đảng bộ Trường Đại học Tôn Đức Thắng đã tổ chức lễ trao tặng Huy hiệu 30 năm tuổi Đảng cho Đảng viên Lê Văn Đào, Đảng viên Chi bộ Hành chính 2; trao Khánh vàng kỷ niệm cho các đồng chí tròn 10, 15, 20, 25, 50 tuổi Đảng và tổ chức Hội nghị Tổng kết công tác xây dựng Đảng năm 2023, triển khai nhiệm vụ 2024.

Đến dự buổi lễ có đồng chí Nguyễn Thị Là - Phó Bí thư Thường trực Đảng uỷ Khối Đại học, Cao đẳng TP. Hồ Chí Minh; đồng chí Đặng Thùy Khánh Vân, Trưởng Ban Tuyên giáo Đảng ủy Khối. Về phía Nhà trường có sự hiện diện của đồng chí Vũ Anh Đức - Bí thư Đảng ủy, Chủ tịch Hội đồng trường; đồng chí Trần Trọng Đạo - Phó Bí thư Đảng ủy, Hiệu trưởng Nhà trường; đồng chí Võ Hoàng Duy - Đảng ủy viên, Phó Hiệu trưởng Nhà Trường và các đồng chí trong BCH Đảng bộ và toàn thể đảng viên trong Đảng bộ.'
, N'Ngày 12/3/2024, Đảng bộ Trường Đại học Tôn Đức Thắng đã tổ chức lễ trao tặng Huy hiệu 30 năm tuổi Đảng cho Đảng viên Lê Văn Đào','New.jpg', 'tin-hom-nay', 1),
--tin3

(N'Khoa CNTT tổ chức Ngày hội CHÚC MỪNG NĂM MỚI 2024',
N'Ngày 07/03/2024 tại Paris, Cộng hoà Pháp, đoàn công tác của Trường Đại học Tôn Đức Thắng (TDTU) đã có buổi làm việc và ký kết hợp tác với Trường Kinh doanh Emlyon (Emlyon), một trong những trường đại học đào tạo kinh doanh tốt nhất của Cộng hoà Pháp và Châu Âu.

Trong khuôn khổ hợp tác TDTU và Emlyon thống nhất triển khai và triển khai chương trình liên kết đào tạo (2 + 2) ngành Quản trị kinh doanh. Đây là chương trình hợp tác đầu tiên của Emlyon tại Việt Nam và Đông Nam Á.

Bên cạnh chương trình hợp tác liên kết đào tạo ngành quản trị kinh doanh, lãnh đạo hai trường đã trao đổi và thống nhất mở rộng các chương trình hợp tác khác với mục tiêu thiết lập quan hệ hợp tác chiến lược giữa hai Trường trong việc đào tạo và nghiên cứu trong các lĩnh vực Kinh doanh, Tài chính, Marketing…vv; thúc đẩy hợp tác trao đổi sinh viên/giảng viên; hợp tác chuyển giao công nghệ; đồng tổ chức hội thảo quốc tế; và đặc biệt định hướng lựa chọn TDTU là nơi hợp tác triển khai mở rộng và chuyển giao các chương trình đào tạo kinh doanh uy tín của Emlyon trong tương lai tại khu vực Đông Nam Á.'
, N'Trường Đại học Tôn Đức Thắng tuyển dụng nhân sự các vị trí: giảng viên, giáo viên, nghiên cứu viên, viên chức hành chính, ...','New2.jpg', 'tin-hom-nay', 1),
--tin4

(N'Trường Đại học Tôn Đức Thắng khai mạc Hội thao sinh viên TDTU Games 2024',

N'Ngày 9/3/2024, Hội thao sinh viên Trường Đại học Tôn Đức Thắng (TDTU Games) 2024 chính thức khai mạc tại Nhà thi đấu đa năng Trường Đại học Tôn Đức Thắng (TDTU).TDTU Games là sự kiện thường niên nhằm đẩy mạnh phong trào rèn luyện thân thể và chơi tốt thể thao theo gương Bác Hồ vĩ đại; khuyến khích thói quen tập luyện thể thao trong sinh viên cũng như tuyển chọn, bồi dưỡng những tài năng thể thao cho các giải toàn quốc và quốc tế. Đây còn là hoạt động để kỷ niệm 78 năm Ngày thể thao Việt Nam (27/03/1946 – 27/03/2024) và 49 năm Ngày giải phóng miền Nam thống nhất đất nước (30/04/1975 – 30/04/2024).
TDTU Games 2024 diễn ra từ 9/3/2024 và sẽ kéo dài đến ngày 12/05/2024 với sự tham gia của gần 1.700 vận động viên là sinh viên từ 16 Khoa chuyên môn thi đấu trong các môn: Bóng rổ, Cầu lông, Taekwondo, Bóng bàn, Nhảy hiện đại, Cờ vua, Kéo co, Bóng đá, Bơi lội, Chạy việt dã. Đây là các môn thể thao được sinh viên TDTU yêu thích và tích cực rèn luyện, thể hiện qua việc sinh viên Nhà trường đã mang về rất nhiều huy chương, giải thưởng danh giá cho thể thao Việt Nam.Vừa qua, tại Đại hội Thể dục Thể thao Đông Nam Á lần thứ 32 (SEA Games 32), Đoàn thể thao Việt Nam, sinh viên và cựu sinh viên TDTU đã xuất sắc đóng góp 2 huy chương vàng (HCV), 1 huy chương bạc (HCB) và 2 huy chương đồng (HCĐ) vào thành tích chung của Đội tuyển Taekwondo Việt Nam, cụ thể:

Sinh viên Phạm Đăng Quang - HCV nội dung đối kháng hạng cân 63kg;

Sinh viên Nguyễn Thị Mộng Quỳnh, cựu sinh viên Châu Tuyết Vân, cựu sinh viên Hứa Văn Huy - HCV Đồng đội 5 người - Quyền Sáng tạo;

Sinh viên Lê Trần Kim Uyên - HCB Quyền Tiêu chuẩn Đôi Nam Nữ, HCĐ Đồng đội Nữ - Quyền Tiêu chuẩn;

Sinh viên Nguyễn Thị Kim Hà - HCĐ Đồng đội Nữ - Quyền Tiêu chuẩn;

Bên cạnh đó, ở Giải Bóng đá 7 người Sinh viên toàn quốc lần 2 - năm 2023, với tinh thần thi đấu đầy quyết tâm, Đội tuyển bóng đá Nam TDTU đã cố gắng bám sát, phòng thủ và có những pha bóng tấn công đầy uy lực, mang đến trận cầu mãn nhãn, đầy kịch tính và chính thức trở thành Tân vương trong trận Chung kết Giải bóng đá 7 người Sinh viên toàn quốc lần 2 năm - 2023.

Tại Giải Bóng rổ sinh viên toàn quốc (NUC) năm 2023, đội tuyển bóng rổ nữ Trường Đại học Tôn Đức Thắng (TDTU) đã xuất sắc giành ngôi Vô địch khu vực Miền Nam và ghi dấu ấn tại trận Chung kết toàn quốc với ngôi vị Á quân.  

Trong 5 năm qua, Nhà trường duy trì và phát triển các câu lạc bộ thể dục thể thao cũng như các phong trào, hoạt động thể dục thể theo nhiều hình thức khác nhau; kết quả là sinh viên Trường đạt nhiều huy chương cấp thế giới, cấp khu vực, quốc gia cụ thể: đạt 19 Huy chương vàng, 10 Huy chương bạc, 16 Huy chương đồng cấp thế giới; Cấp khu vực đạt 08 Huy chương vàng, 07 Huy chương bạc, 12 Huy chương đồng; Cấp toàn quốc đạt 79 Huy chương vàng, 53 Huy chương bạc, 78 Huy chương đồng. Đặc biệt, năm 2023, Đội bóng đá 7 người đã đạt Huy chương vàng giải bóng đá sinh viên Toàn quốc. Đội bóng rổ đạt Huy chương vàng Giải bóng rổ Sinh viên TPHCM; HCV và HCĐ Giải bóng rổ sinh viên toàn quốc Khu vực 3, HCB giải bóng rổ sinh viên toàn quốc.

Với phương châm “Thể xác khỏe là nền tảng để có tinh thần mạnh; thể xác và tinh thần khỏe mạnh là nền tảng để có tự do”, Các vận động viên là sinh viên TDTU luôn được tạo điều kiện luyện tập tốt nhất để phát triển toàn diện cả trí và lực trong khu liên hợp thể thao của Trường với nhà thi đấu đa năng, sân vận động chuẩn FIFA 2 sao, sân bóng rổ, phòng tập thể hình, yoga, phòng mô phỏng golf 3D... Có thể thấy rằng, những đóng góp của các vận động viên không chỉ mang ý nghĩa thành tích cho TDTU, chính tinh thần “thép”, nỗ lực thi đấu đầy nhiệt huyết, đã truyền cảm hứng cho rất nhiều người hâm mộ, mang về niềm tự hào cho thể thao nước nhà.

Hội thao sinh viên Trường Đại học Tôn Đức Thắng được tổ chức thường niên nhằm đẩy mạnh phong trào rèn luyện thân thể và chơi tốt thể thao theo cuộc vận động “Toàn dân rèn luyện thân thể theo gương Bác Hồ vĩ đại”; khuyến khích thói quen tập luyện thể thao trong sinh viên cũng như tuyển chọn, bồi dưỡng những tài năng thể thao cho các giải toàn quốc và quốc tế.', N'Trường Đại học Tôn Đức Thắng tuyển dụng nhân sự các vị trí: giảng viên, giáo viên, nghiên cứu viên, viên chức hành chính, ...','New1.jpg', 'tin-hom-nay', 1);



INSERT INTO Notify
	(Title ,[Description],Content,TargetType,IDSender,GraduationInfoID, meta)
VALUES
	(N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.',1,'admin01',1,'tin-hom-nay'),
(N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.',1,'admin01',1,'tin-hom-nay'),
(N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.',1,'admin01',2,'tin-hom-nay'),
(N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.',1,'admin01',3,'tin-hom-nay');


INSERT INTO Notify
	(Title ,[Description],Content,TargetType,IDSender, meta)
VALUES
	(N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',
	N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',
	N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.',0,'admin01','tin-hom-nay'),

	(N'ĐÊM NHẠC VÀ CHIA SẺ “MÌNH CÙNG NGỒI NÓI CHUYỆN TÌNH YÊU”',
	N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',
	N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.',0,'admin01','tin-hom-nay'),

	(N'THÔNG BÁO SỐ 09/2024/PTC-TB V/V NỘP HỌC PHÍ HỌC KỲ DỰ THÍNH 2 ',
	N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',
	N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.',0,'admin01','tin-hom-nay'),
	(N' THÔNG BÁO SỐ 06/2024/PTC-TB V/V NỘP HỌC PHÍ HỌC KỲ 2 NĂM HỌC 2023-2024',
	N'Khoa CNTT tổ chức Ngày hội Sinh viên IT và Doanh nghiệp - IT CAREER DAY 2023',
	N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.',0,'admin01','tin-hom-nay');






INSERT INTO RecruitmentNew
	(Title,Describe ,Content,IDEnterprise, meta, JobDescription)
VALUES
	(N'FPT Software tuyển dụng Fresher.Net',N'FPT Software tuyển dụng Fresher.Net',N'Ngày hội sinh viên IT và Doanh nghiệp do Khoa CNTT tổ chức vào ngày 15/11/2023 đã  khép lại với nhiều thành công, đã thu hút hơn gần 1000 lượt sinh viên tham gia với sự tham gia của các doanh nghiệp lớn trong nước thuộc lĩnh vực công nghệ thông tin. 
Bên cạnh việc kết nối bạn SV với nhà tuyển dụng, tại các gian hàng, Ban tổ chức còn tổ chức nhiều hoạt động chia sẻ kinh nghiệm và định hướng nghề nghiệp cho sinh viên. Các ứng cử viên trẻ có nhiều thời gian trao đổi trực tiếp với đại diện doanh nghiệp nhằm tích lũy thêm kinh nghiệm phỏng vấn và hoàn thiện hồ sơ ứng tuyển.
Ngày hội sinh viên IT và Doanh nghiệp - IT Career Day 2023 kết thúc thành công tốt đẹp, thực sự mang lại nhiều lợi ích cho người tham dự. Chương trình đã thúc đẩy mối liên kết chặt chẽ giữa nhà trường và doanh nghiệp, hỗ trợ sinh viên những thông tin thiết thực về chính sách tuyển dụng của các công ty. Trong thời gian tới, Khoa CNTT sẽ còn tiếp tục tổ chức nhiều chương trình hỗ trợ tìm việc, 
các chương trình đào tạo kỹ năng cho sinh viên, đặc biệt là các sinh viên sắp tốt nghiệp.','1', 'tuyen-dung', 'JD Thuc tap thang 3.2024.pdf');

--$2a$11$zOXGXKYB5ovxJ0HZxJy2eeOA/sVXHIiZdYafU5KDBI6gqXACTKapm ->123456789


# TDTU-IT-alumni-management-system
## Giới thiệu
TDTU-IT-alumni-management-system là một ứng dụng web được phát triển để quản lý thông tin về cựu sinh viên tại Trường Đại học Tôn Đức Thắng, đặc biệt là trong lĩnh vực Công nghệ Thông tin.

Với TDTU-IT-alumni-management-system, cả cựu sinh viên và nhân viên của trường có thể truy cập vào hệ thống để thực hiện các chức năng như đăng ký thông tin cá nhân, cập nhật thông tin liên lạc, tìm kiếm và kết nối với các cựu sinh viên khác, cũng như tham gia vào các sự kiện hoặc chương trình gắn kết cộng đồng.
## Các tính năng chính
**1.Đăng ký và quản lý thông tin cá nhân:** Cựu sinh viên có thể đăng ký thông tin cá nhân của mình vào hệ thống, bao gồm thông tin về học vấn, công việc, kỹ năng và sở thích.<br>
**2.Tìm kiếm và kết nối:** Người dùng có thể tìm kiếm thông tin về các cựu sinh viên khác dựa trên các tiêu chí như năm tốt nghiệp, ngành học, vị trí công việc, v.v. Họ cũng có thể kết nối và liên lạc với nhau thông qua hệ thống.<br>
**3.Quản lý sự kiện và chương trình gắn kết:**  Hệ thống cung cấp các chức năng để quản lý và tổ chức các sự kiện, buổi họp, hoặc chương trình gắn kết cộng đồng, giúp tạo ra cơ hội gặp gỡ và giao lưu giữa các cựu sinh viên.
## Công nghệ sử dụng
**ASP.NET MVC:** Framework được sử dụng để xây dựng phần backend của ứng dụng.<br>
**HTML/CSS/JavaScript:** Các công nghệ front-end để xây dựng giao diện người dùng thân thiện.<br>
**SQL Server:** Hệ quản trị cơ sở dữ liệu được sử dụng để lưu trữ thông tin của cựu sinh viên.<br>
## Cách cài đặt và chạy
1.Clone repository từ GitHub về máy local của bạn.<br>
2.Chạy database trong Microsoft SQL Server Management Studio với 3 file data.<br>
3.Mở solution trong Visual Studio.<br>
4.Nối database bằng cách vào thư mục Model -> Add -> New Item ->ADO.NET Entity Data Model -> FE Desiger from database -> sau đó kế nối đến database Lưu ý đặt tên kết nối trong Web.config là TDTUAlumnisManagementSystemEntities.<br>
**Lưu ý tên bắt buộc phải là TDTUAlumnisManagementSystemEntities nếu không đặt được kiểm tra lại trong Web.config để xóa connectionStrings trước đó.<br>**
5.Chạy và sử dụng
## Các tài khoản truy cập web
l. Link website:http://alumnitdtu.io.vn/<br>
2. Nếu yêu website yêu cầu tài khoản và mật khẩu để truy cập website:<br>
Tên người dùng: 11168626<br>
Mật khẩu: 60-dayfreetrial<br>
3. Tài khoản Cựu sinh viên:<br>
Tài khoản: 52000001<br>
Mật khẩu: 123456789<br>
4.Tài khoản quản trị viên:<br>
Tài khoản: admin@gmail.com<br>
Mật khẩu: 123456789<br>
## Người thực hiện
Nguyễn Hữu Đức<br>
Phạm Nguyễn

using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using TDTU_IT_alumni_management_system.Models;
using MailKit;
using MimeKit;
using MailKit.Security;
using MailKit.Net.Smtp;
using System.Net;

namespace TDTU_IT_alumni_management_system.Controllers
{
    public class LoginController : Controller
    {
        TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();
        public ActionResult Index()
        {
            if (Session["UID"]  == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
            
        }

        //POST: Login/Login
        [HttpPost]
        public ActionResult Login(string Username, string Password)
        {

            var user = db.Alumni.Where(u => u.IDAlumni == Username && u.Password == Password).FirstOrDefault();

            if (user != null)
            {

                Session["UID"] = user.IDAlumni;
                Session["Name"] = user.Name;
                Session["Major"] = user.GraduationInfoID;
                Session["Avatar"] = user.ProfilePicture;
                ViewBag.session = user;
                return Json(new { success = true, message = "Đăng nhập thành công!" });
            }
            else
            {

                return Json(new { success = false, message = "Tên đăng nhập hoặc mật khẩu không hợp lệ!" });
            }
        }
        public ActionResult Logout()
        {
            Session.Clear(); // Xóa toàn bộ session khi người dùng đăng xuất
            return RedirectToAction("Index", "Login"); // Chuyển hướng đến trang chính sau khi đăng xuất
        }
        //POST: Login/ForgotPassword
        [HttpPost]
        public ActionResult ForgotPassword(string Email, string Uid)
        {
            var user = db.Alumni.Where(u => u.IDAlumni == Uid && u.Email == Email).FirstOrDefault();

            if (user != null)
            {
                //tạo token, gửi email
                Guid guid = Guid.NewGuid();
                string str = guid.ToString().Substring(0, 20);
                Session.Clear();
                Session["tempUID"] = user.IDAlumni;
                Session["tempMail"] = user.Email;
                Session["token"] = str;
                Session["Expiry"] = DateTime.UtcNow.AddMinutes(5);
                SendEmail(user.Email, str);
                return Json(new { success = true, message = "Đã gửi thông tin về email: " + Email});
            }
            else
            {
                return Json(new { success = false, message = "Email hoặc mã số sinh viên không hợp lệ!"  });
            }
        }

        public ActionResult CheckTokenView()
        {
            if (Session["tempUID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Index", "Login");
            }
            else
            {
                return View();
            }
        }
        

        [HttpPost]
        public ActionResult CheckAndChangeDataInSession(string CurrentPassword, string NewPassword)
        {
            string Uid = "";
            if (Session["UID"] != null)
            {
                Uid = Session["UID"].ToString();
            }
            else
            {
                Uid = Session["tempUID"].ToString();
            }    

            var user = db.Alumni.Where(u => u.Password == u.Password && u.IDAlumni == Uid).FirstOrDefault();

            if (user != null)
            {
                user.Password = NewPassword;
                db.SaveChanges();
                Session.Clear();
                return Json(new { success = true, message = "Đổi mật khẩu thành công!"});
            }
            else
            {
                return Json(new { success = false, message = "Mật khẩu hiện tại không chính xác!"});
            }
        }
        public ActionResult ChangePassword()
        {
            if (Session["UID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Index", "Login");
            }
            else
            {
                return View();
            }
        }
        [HttpPost]
        public ActionResult CheckingTokenData(string Token, int check)
        {
            if (Session["token"].ToString() == Token && (DateTime)Session["Expiry"] > DateTime.UtcNow)
            {
                return Json(new { success = true, message = "Token hợp lệ! " + ((DateTime)Session["Expiry"]).ToString() });
            }
            else
            {
                return Json(new { success = false, message = "Token không hợp lệ! " + ((DateTime)Session["Expiry"]).ToString() });
            }
        }

        public static void SendEmail(string toEmail, string body)
        {
            // Tạo email message
            var message = new MimeMessage();
            message.From.Add(new MailboxAddress("TDTUAlumnis", "swordbestking@gmail.com"));
            message.To.Add(new MailboxAddress(toEmail, toEmail));
            message.Subject = "Mã token quên mật khẩu từ TDTU Alumni Management";
            message.Body = new TextPart(MimeKit.Text.TextFormat.Html) { Text = body };

            // Tạo SMTP client
            using (var client = new SmtpClient())
            {
                client.Connect("smtp.gmail.com", 587, SecureSocketOptions.StartTls);
                client.Authenticate("swordbestking@gmail.com", "wrux tvne fuwu eaie");
                client.Send(message);
                client.Disconnect(true);
            }
        }
    }
}

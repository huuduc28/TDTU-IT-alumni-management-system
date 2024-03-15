using CKSource.CKFinder.Connector.Core.Authentication;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TDTU_IT_alumni_management_system.Models;

namespace TDTU_IT_alumni_management_system.Areas.Admin.Controllers
{
    public class LoginAdminController : Controller
    {
        private TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();

        // GET: Admin/LoginAdmin
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string Email, string Password)
        {
            // Tìm kiếm admin dựa trên email
            var admin = db.Administrators.FirstOrDefault(u => u.Email == Email);
            if (admin != null && VerifyPassword(Password, admin.Password) && admin.UserRole == 1)
            {
                // Đăng nhập thành công
                Session["UID"] = admin.IDAdmin;
                Session["Name"] = admin.Name;
                Session["Role"] = admin.UserRole;
                return Redirect("/quan-ly");
            }
            else
            {
                TempData["ErrorMessage"] = "Tên đăng nhập hoặc mật khẩu không chính xác";
                return Redirect("/quan-ly/dang-nhap");
            }
        }
        public ActionResult Logout()
        {
            Session.Clear(); 
            return Redirect("/quan-ly/dang-nhap");
        }
        public static string HashPassword(string password)
        {
            string salt = BCrypt.Net.BCrypt.GenerateSalt();
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password, salt);
            return hashedPassword;
        }
        public static bool VerifyPassword(string password, string hashedPassword)
        {
            return BCrypt.Net.BCrypt.Verify(password, hashedPassword);
        }
        public ActionResult ChangePassword(string id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Administrator administrator = db.Administrators.Find(id);
                if (administrator == null)
                {
                    return HttpNotFound();
                }
                return View(administrator);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ChangePassword(string OldPassword, string NewPassword)
        {

            // Tìm kiếm admin dựa trên email
            return Redirect("/quan-ly");
        }
    }
}
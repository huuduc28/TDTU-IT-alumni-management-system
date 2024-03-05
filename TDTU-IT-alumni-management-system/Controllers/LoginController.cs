using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TDTU_IT_alumni_management_system.Models; // Thêm namespace này

namespace TDTU_IT_alumni_management_system.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        //POST: Login/Login
       [HttpPost]
        public ActionResult Login(string Username, string Password)
        {

            using (var db = new TDTUAlumnisManagementSystemEntities())
            {

                var user = db.Users.Where(u => u.UsersName == Username && u.Password == Password).FirstOrDefault();

                if (user != null)
                {

                    Session["Username"] = user.UsersName;


                    return Json(new { success = true });
                }
                else
                {

                    return Json(new { success = false, message = "Tên đăng nhập hoặc mật khẩu không hợp lệ!" });
                }
            }
        }
    }
}

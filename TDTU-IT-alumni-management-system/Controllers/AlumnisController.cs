using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TDTU_IT_alumni_management_system.Models;

namespace TDTU_IT_alumni_management_system.Controllers
{
    public class AlumnisController : Controller
    {
        // GET: Alumnis

        TDTUAlumnisManagementSystemEntities _context = new TDTUAlumnisManagementSystemEntities();

        public ActionResult Index(string meta)
        {
            return View();
        }
        public ActionResult GetAlumniByMajor(string major)
        {
            // Khởi tạo context của Entity Framework
            using (var context = new TDTUAlumnisManagementSystemEntities())
            {
                // Lấy danh sách sinh viên theo ngành, sắp xếp theo order tăng dần
                var alumni = context.Alumni.Where(a => a.Majors == major)
                                              .OrderBy(a => a.order)
                                              .Take(4) // Lấy 4 sinh viên đầu tiên
                                              .ToList();
                return PartialView(alumni);
            }
        }

        public ActionResult AlumniCategory()
        {
            return View();
        }
        public ActionResult DetailAlumni()
        {
            return View();
        }
        public ActionResult PersonInfo()
        {
            return View();
        }
    }
}
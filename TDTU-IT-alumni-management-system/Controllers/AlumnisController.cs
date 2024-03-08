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
        public ActionResult GetAlumniByMajor(string major, int count)
        {
            if (major != null)
            {
                if (count > 0)
                {
                    using (var context = new TDTUAlumnisManagementSystemEntities())
                    {
                        ViewBag.meta = "cuu-sinh-vien";
                        // Lấy danh sách sinh viên theo ngành, sắp xếp theo order tăng dần
                        var alumni = context.Alumni.Where(a => a.Majors == major)
                                                      .OrderBy(a => a.order)
                                                      .Take(count) // Lấy 4 sinh viên đầu tiên
                                                      .ToList();
                        return PartialView(alumni);
                    }
                }
                else
                {
                    using (var context = new TDTUAlumnisManagementSystemEntities())
                    {
                        ViewBag.meta = "cuu-sinh-vien";
                        // Lấy danh sách sinh viên theo ngành, sắp xếp theo order tăng dần
                        var alumni = context.Alumni.Where(a => a.Majors == major)
                                                      .OrderBy(a => a.order)
                                                      .ToList();
                        return PartialView(alumni);
                    }
                }
            }
            else
            {
                using (var context = new TDTUAlumnisManagementSystemEntities())
                {
                    ViewBag.meta = "cuu-sinh-vien";
                    // Lấy danh sách sinh viên theo ngành, sắp xếp theo order tăng dần
                    var alumni = context.Alumni.OrderBy(a => a.order).ToList();
                    return PartialView(alumni);
                }
            }
            
        }


        public ActionResult AlumniCategory(string majorKey)
        {
            var major = majorKey;
            ViewBag.meta = "cuu-sinh-vien";
            ViewData["majorKey"] = major;
            return View();
        }
        public ActionResult DetailAlumni(string id)
        {
            using (var context = new TDTUAlumnisManagementSystemEntities())
            {
                ViewBag.meta = "cuu-sinh-vien";
                // Lấy danh sách sinh viên theo ngành, sắp xếp theo order tăng dần
                var alumni = context.Alumni.Where(a => a.IDAlumni == id).OrderBy(a => a.order).FirstOrDefault();
                return View(alumni);
            }            
        }
        public ActionResult PersonInfo()
        {
            return View();
        }
    }
}
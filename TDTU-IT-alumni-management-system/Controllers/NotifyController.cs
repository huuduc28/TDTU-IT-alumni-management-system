using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TDTU_IT_alumni_management_system.Models;

namespace TDTU_IT_alumni_management_system.Controllers
{
    public class NotifyController : Controller
    {
        TDTUAlumnisManagementSystemEntities _db = new TDTUAlumnisManagementSystemEntities();
        // GET: Notifications
        public ActionResult GetNofityDetal(int id)
        {
            if (Session["UID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return Redirect("/dang-nhap");
            }
            else
            {
                var v = from t in _db.Notifies
                        where t.IDNotify == id && t.hide == true
                        orderby t.datebegin descending
                        select t;
                return PartialView(v.FirstOrDefault());
            }
        }
        public ActionResult GetNofity(string searchString)
        {
            if (Session["UID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return Redirect("/dang-nhap");
            }
            else
            {
                ViewBag.meta = "thong-bao";
                if (!string.IsNullOrEmpty(searchString))
                {
                    var data = from t in _db.Notifies
                               where t.TargetType == false && t.hide == true && t.Title.Contains(searchString)
                               orderby t.datebegin descending
                               select t;
                    return PartialView("_NotifyPartialView", data.ToList());
                }
                var v = from t in _db.Notifies
                        where t.TargetType == false && t.hide == true
                        orderby t.datebegin descending
                        select t;
                return View(v.ToList());
            }
        }
        public ActionResult GetListNofityByMajors(int GraduationInfoID)
        {
            if (Session["UID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return Redirect("/dang-nhap");
            }
            else
            {
                ViewBag.meta = "thong-bao-nhom";
                var v = from t in _db.Notifies
                        where t.GraduationInfoID == GraduationInfoID && t.hide == true
                        orderby t.datebegin descending
                        select t;
                return PartialView(v.ToList());
            }
        }
        public ActionResult GetAllListNofityByMajors(int id , string searchString)
        {
            if (Session["UID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return Redirect("/dang-nhap");
            }
            else
            {
                ViewBag.meta = "thong-bao";
                if (!string.IsNullOrEmpty(searchString))
                {
                    var data = from t in _db.Notifies
                               where t.Title.Contains(searchString) && t.GraduationInfoID == id && t.hide == true
                               orderby t.datebegin descending
                               select t;
                    return PartialView("_NotifyPartialView", data.ToList());
                }
                var v = from t in _db.Notifies
                        where t.GraduationInfoID == id && t.hide == true
                        orderby t.datebegin descending
                        select t;
                return PartialView(v.ToList());
            }
        }

    }
}
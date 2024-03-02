using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TDTU_IT_alumni_management_system.Models;

namespace TDTU_IT_alumni_management_system.Controllers
{
    public class HomeController : Controller
    {
        TDTUAlumnisManagementSystemEntities _db = new TDTUAlumnisManagementSystemEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetHeader()
        {
            var v = from t in _db.Headers
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.FirstOrDefault());
        }

        public ActionResult GetBanner()
        {
            var v = from t in _db.Banners
                    where t.hide == true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
        public ActionResult GetMenu()
        {
            var v = from t in _db.Menus
                    where t.hide == true && t.ParentID == null
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
        public ActionResult GetChildMenu(string parentID)
        {
            var v = from t in _db.Menus
                    where t.hide == true && t.ParentID == parentID
                    orderby t.order ascending
                    select t;
            ViewBag.Count = v.ToList().Count;
            return PartialView(v.ToList());
        }
        public ActionResult GetNewsHome()
        {
            ViewBag.meta = "tin-tuc";
            var v = (from t in _db.News
                    where t.hide == true
                    orderby t.datebegin descending
                    select t).Take(4);
            return PartialView(v.ToList());
        }
        
    }
}
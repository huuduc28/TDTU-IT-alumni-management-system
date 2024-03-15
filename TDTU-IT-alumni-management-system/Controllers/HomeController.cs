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
        public ActionResult GetNotifyHome()
        {
            ViewBag.meta = "thong-bao";
            var v = (from t in _db.Notifies
                     where t.TargetType == false && t.hide == true 
                     orderby t.datebegin descending
                     select t).Take(12);
            return PartialView(v.ToList());
        }
        public ActionResult GetRecruitmentNew(int count)
        {
            ViewBag.meta = "tin-tuyen-dung";
            var v = (from t in _db.RecruitmentNews
                     join c in _db.Enterprises on t.IDEnterprise equals c.IDEnterprise
                     where t.hide == true
                     orderby t.datebegin descending
                     select new RecruitmentNewsViewModel
                     {
                         IDRecruitmentNew = t.IDRecruitmentNew,
                         Title = t.Title,
                         Content = t.Content,
                         IDEnterprise = t.IDEnterprise,
                         ImgLogo = c.ImgLogo,
                         JobDescription = t.JobDescription,
                         Meta = t.meta,
                         Hide = (bool)t.hide,
                         Order = (int)t.order,
                         DateBegin = (DateTime)t.datebegin,
                     }).Take(count);
            return PartialView(v.ToList());
        }

    }
}
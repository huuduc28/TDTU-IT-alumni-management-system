using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TDTU_IT_alumni_management_system.Models;

namespace TDTU_IT_alumni_management_system.Controllers
{
    public class EnterprisesController : Controller
    {
        // GET: Enterprises
        TDTUAlumnisManagementSystemEntities _db = new TDTUAlumnisManagementSystemEntities();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetRecruitmentNewList()
        {
            ViewBag.meta = "tin-tuyen-dung";
            var v = from t in _db.RecruitmentNews
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
                         Meta = t.meta,
                         Hide = (bool)t.hide,
                         Order = (int)t.order,
                         DateBegin = (DateTime)t.datebegin,
                     };
            return PartialView(v.ToList());
        }
        public ActionResult GetRecruitmentNewDetal(string id)
        {
            var v = from t in _db.RecruitmentNews
                    where t.IDRecruitmentNew == id && t.hide == true
                    orderby t.datebegin descending
                    select t;
            return PartialView(v.FirstOrDefault());
        }
    }
}
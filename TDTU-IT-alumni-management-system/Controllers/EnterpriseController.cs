using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TDTU_IT_alumni_management_system.Models;

namespace TDTU_IT_alumni_management_system.Controllers
{
    public class EnterpriseController : Controller
    {
        // GET: Enterprises
        TDTUAlumnisManagementSystemEntities _db = new TDTUAlumnisManagementSystemEntities();

        public ActionResult Index()
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

        public ActionResult GetEnterpriseList()
        {
            ViewBag.meta = "doanh-nghiep";
            var enterprises = _db.Enterprises.OrderBy(e => e.order).ToList();
            return PartialView(enterprises);
        }

        public ActionResult EnterpriseRecruitmentBoard(int id)
        {
            if (Session["UID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Index", "Login");
            }
            else
            {
                ViewBag.meta = "tin-tuyen-dung";
                ViewData["eName"] = _db.Enterprises.FirstOrDefault(e => e.IDEnterprise == id).EnterpriseName;
                var v = from t in _db.RecruitmentNews
                        join c in _db.Enterprises on t.IDEnterprise equals c.IDEnterprise
                        where c.IDEnterprise == id
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
            

        }
        public ActionResult GetRecruitmentNewDetal(int id)
        {

            var v = from t in _db.RecruitmentNews
                    where t.IDRecruitmentNew == id && t.hide == true
                    orderby t.datebegin descending
                    select t;
            return PartialView(v.FirstOrDefault());
        }
    }
}
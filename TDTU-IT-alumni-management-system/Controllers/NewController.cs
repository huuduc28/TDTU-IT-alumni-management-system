using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TDTU_IT_alumni_management_system.Models;

namespace TDTU_IT_alumni_management_system.Controllers
{
    public class NewController : Controller
    {
        // GET: News
        TDTUAlumnisManagementSystemEntities _db = new TDTUAlumnisManagementSystemEntities();

        public ActionResult GetNewsDetal(string id)
        {
            var v = from t in _db.News
                    where t.IDNews == id && t.hide == true
                    orderby t.datebegin descending
                    select t;
            return PartialView(v.FirstOrDefault());
        }
        public ActionResult GetNewsList()
        {
            var v = (from t in _db.News
                     where t.hide == true
                     orderby t.datebegin descending
                     select t).Take(10);
            return PartialView(v.ToList());
        }
    }
}
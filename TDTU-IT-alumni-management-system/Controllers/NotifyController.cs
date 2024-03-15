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
            var v = from t in _db.Notifies
                    where t.IDNotify == id && t.hide == true
                    orderby t.datebegin descending
                    select t;
            return PartialView(v.FirstOrDefault());
        }
        public ActionResult GetNofity()
        {
            ViewBag.meta = "thong-bao";
            var v = (from t in _db.Notifies
                     where t.TargetType == false && t.hide == true
                     orderby t.datebegin descending
                     select t).Take(10);
            return PartialView(v.ToList());
        }
        public ActionResult GetListNofityByMajors(int GraduationInfoID, int Count)
        {
            ViewBag.meta = "thong-bao";
            var v = (from t in _db.Notifies
                     where t.TargetType == true && t.GraduationInfoID == GraduationInfoID && t.hide == true
                     orderby t.datebegin descending
                     select t).Take(Count);
            return PartialView(v.ToList());
        }
        
    }
}
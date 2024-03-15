using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TDTU_IT_alumni_management_system.Models;

namespace TDTU_IT_alumni_management_system.Areas.Admin.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Admin/Default
        public ActionResult Index()
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                return View();

            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
        }
    }
}
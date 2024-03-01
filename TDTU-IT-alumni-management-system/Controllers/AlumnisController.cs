using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TDTU_IT_alumni_management_system.Controllers
{
    public class AlumnisController : Controller
    {
        // GET: Alumnis
        public ActionResult Index(string meta)
        {
            return View();
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
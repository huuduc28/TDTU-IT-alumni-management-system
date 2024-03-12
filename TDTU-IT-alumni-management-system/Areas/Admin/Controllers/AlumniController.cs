using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TDTU_IT_alumni_management_system.Models;

namespace TDTU_IT_alumni_management_system.Areas.Admin.Controllers
{
    public class AlumniController : Controller
    {
        private TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();

        // GET: Admin/Alumni
        public ActionResult Index()
        {
            return View(db.Alumni.ToList());
        }

        // GET: Admin/Alumni/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Alumnus alumnus = db.Alumni.Find(id);
            if (alumnus == null)
            {
                return HttpNotFound();
            }
            return View(alumnus);
        }

        // GET: Admin/Alumni/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Alumni/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDAlumni,Name,Email,Phone,Birthday,Gender,ProfilePicture,Nationality,HomeTown,PersonalWebsite,skill,GraduationType,GraduationInfoID,CurrentCompany,AcademicLevel,TimeToCompletionOfThesisDefense,UsersName,Profession,jobBeginDate,Password,meta,hide,order,datebegin")] Alumnus alumnus)
        {
            if (ModelState.IsValid)
            {
                db.Alumni.Add(alumnus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(alumnus);
        }

        // GET: Admin/Alumni/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Alumnus alumnus = db.Alumni.Find(id);
            if (alumnus == null)
            {
                return HttpNotFound();
            }
            return View(alumnus);
        }

        // POST: Admin/Alumni/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDAlumni,Name,Email,Phone,Birthday,Gender,ProfilePicture,Nationality,HomeTown,PersonalWebsite,skill,GraduationType,GraduationInfoID,CurrentCompany,AcademicLevel,TimeToCompletionOfThesisDefense,UsersName,Profession,jobBeginDate,Password,meta,hide,order,datebegin")] Alumnus alumnus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(alumnus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(alumnus);
        }

        // GET: Admin/Alumni/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Alumnus alumnus = db.Alumni.Find(id);
            if (alumnus == null)
            {
                return HttpNotFound();
            }
            return View(alumnus);
        }

        // POST: Admin/Alumni/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Alumnus alumnus = db.Alumni.Find(id);
            db.Alumni.Remove(alumnus);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}

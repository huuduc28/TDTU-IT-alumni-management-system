using Newtonsoft.Json;
using PagedList;
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
        public ActionResult Index(int? page)
        {
            var pageSize = 10;
            var pageNumber = (page ?? 1); 
            var data = db.Alumni.Include(r => r.GraduationInfo).ToList();
            var pagedData = data.ToPagedList(pageNumber, pageSize);
            return View(pagedData);
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
        public ActionResult Search(string searchString, int? page)
        {
            var pageSize = 10; 
            var pageNumber = (page ?? 1); 
            var data = db.Alumni.OrderByDescending(n => n.datebegin).ToList();

            if (!string.IsNullOrEmpty(searchString))
            {
                data = data.Where(n => n.IDAlumni.Contains(searchString) || n.Name.Contains(searchString)).ToList();
            }
            var pagedData = data.ToPagedList(pageNumber, pageSize);
            return View("Index", pagedData);
        }
        public ActionResult DataFilter(string majorKey)
        {
       
            var query = db.Alumni.Include(r => r.GraduationInfo);
            // Lọc theo ngành học nếu có
            if (!string.IsNullOrEmpty(majorKey))
            {
                query = query.Where(a => a.GraduationInfo.Majors == majorKey);
            }
            var filteredData = query.ToList();
            return PartialView("_AlumniPartialView", filteredData);
        }
    }
}

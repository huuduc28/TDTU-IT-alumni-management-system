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
    public class GraduationInfoesController : Controller
    {
        private TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();

        // GET: Admin/GraduationInfoesGraduationInfoes
        public ActionResult Index()
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                return View(db.GraduationInfoes.ToList());
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
        }
        // GET: Admin//Create
        public ActionResult Create()
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

        // POST: Admin/GraduationInfoes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Majors,GraduationYear")] GraduationInfo graduationInfo)
        {
            if (ModelState.IsValid)
            {
                db.GraduationInfoes.Add(graduationInfo);
                db.SaveChanges();
                return Redirect("/quan-ly/khoa-hoc");
            }

            return View(graduationInfo);
        }

        // GET: Admin/GraduationInfoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                GraduationInfo graduationInfo = db.GraduationInfoes.Find(id);
                if (graduationInfo == null)
                {
                    return HttpNotFound();
                }
                return View(graduationInfo);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
            
        }

        // POST: Admin/GraduationInfoes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Majors,GraduationYear")] GraduationInfo graduationInfo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(graduationInfo).State = EntityState.Modified;
                db.SaveChanges();
                return Redirect("/quan-ly/khoa-hoc");
            }
            return View(graduationInfo);
        }

        // GET: Admin/GraduationInfoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                GraduationInfo graduationInfo = db.GraduationInfoes.Find(id);
                if (graduationInfo == null)
                {
                    return HttpNotFound();
                }
                return View(graduationInfo);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
           
        }

        // POST: Admin/GraduationInfoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            GraduationInfo graduationInfo = db.GraduationInfoes.Find(id);

            bool isUsedInAlumnus = db.Alumni.Any(a => a.GraduationInfoID == id);

            bool isUsedInNotifir = db.Notifies.Any(ad => ad.GraduationInfoID == id);

            if (isUsedInAlumnus || isUsedInNotifir)
            {
                TempData["ErrorMessage"] = "Không thể xóa vì dữ liệu đang được sử dụng trong các bảng khác.";
                return Redirect("/quan-ly/khoa-hoc");
            }
            db.GraduationInfoes.Remove(graduationInfo);
            db.SaveChanges();
            return Redirect("/quan-ly/khoa-hoc");
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

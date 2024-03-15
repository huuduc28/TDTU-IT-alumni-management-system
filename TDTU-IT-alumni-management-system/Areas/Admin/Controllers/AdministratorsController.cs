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
    public class AdministratorsController : Controller
    {
        private TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();


        // GET: Admin/Administrators
        public ActionResult Index()
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                return View(db.Administrators.ToList());
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
        }

        // GET: Admin/Administrators/Details/5
        public ActionResult Details(string id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Administrator administrator = db.Administrators.Find(id);
                if (administrator == null)
                {
                    return HttpNotFound();
                }
                return View(administrator);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }

        }

        // GET: Admin/Administrators/Create
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

        // POST: Admin/Administrators/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDAdmin,Name,Phone,Email,Password,UserRole")] Administrator administrator)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (ModelState.IsValid)
                {
                    administrator.UserRole = 1;
                    administrator.Password = HashPassword(administrator.Password);
                    db.Administrators.Add(administrator);
                    db.SaveChanges();
                    return Redirect("/quan-ly/quan-tri-vien");
                }

                return View(administrator);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }

        }

        // GET: Admin/Administrators/Edit/5
        public ActionResult Edit(string id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Administrator administrator = db.Administrators.Find(id);
                if (administrator == null)
                {
                    return HttpNotFound();
                }
                return View(administrator);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }

        }

        // POST: Admin/Administrators/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDAdmin,Name,Phone,Email,Password,UserRole")] Administrator administrator)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (ModelState.IsValid)
                {
                    administrator.UserRole = 1;
                    db.Entry(administrator).State = EntityState.Modified;
                    db.SaveChanges();
                    return Redirect("/quan-ly/quan-tri-vien");
                }
                return View(administrator);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }

        }

        // GET: Admin/Administrators/Delete/5
        public ActionResult Delete(string id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Administrator administrator = db.Administrators.Find(id);
                if (administrator == null)
                {
                    return HttpNotFound();
                }
                return View(administrator);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }

        }

        // POST: Admin/Administrators/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Administrator administrator = db.Administrators.Find(id);
            db.Administrators.Remove(administrator);
            db.SaveChanges();
            return Redirect("/quan-ly/quan-tri-vien");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public static string HashPassword(string password)
        {
            string salt = BCrypt.Net.BCrypt.GenerateSalt();
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password, salt);
            return hashedPassword;
        }
    }
}

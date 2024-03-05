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
    public class HeadersController : Controller
    {
        private TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();

        // GET: Admin/Headers
        public ActionResult Index()
        {
            return View(db.Headers.ToList());
        }

        // GET: Admin/Headers/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Header header = db.Headers.Find(id);
            if (header == null)
            {
                return HttpNotFound();
            }
            return View(header);
        }

        // GET: Admin/Headers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Headers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDHeader,TieuDe,ImgLogo,meta,hide,order,datebegin")] Header header)
        {
            if (ModelState.IsValid)
            {
                db.Headers.Add(header);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(header);
        }

        // GET: Admin/Headers/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Header header = db.Headers.Find(id);
            if (header == null)
            {
                return HttpNotFound();
            }
            return View(header);
        }

        // POST: Admin/Headers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDHeader,TieuDe,ImgLogo,meta,hide,order,datebegin")] Header header)
        {
            if (ModelState.IsValid)
            {
                db.Entry(header).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(header);
        }

        // GET: Admin/Headers/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Header header = db.Headers.Find(id);
            if (header == null)
            {
                return HttpNotFound();
            }
            return View(header);
        }

        // POST: Admin/Headers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Header header = db.Headers.Find(id);
            db.Headers.Remove(header);
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

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
    public class RecruitmentNewsController : Controller
    {
        private TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();

        // GET: Admin/RecruitmentNews
        public ActionResult Index()
        {
            var recruitmentNews = db.RecruitmentNews.Include(r => r.Enterprise);
            return View(recruitmentNews.ToList());
        }

        // GET: Admin/RecruitmentNews/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecruitmentNew recruitmentNew = db.RecruitmentNews.Find(id);
            if (recruitmentNew == null)
            {
                return HttpNotFound();
            }
            return View(recruitmentNew);
        }

        // GET: Admin/RecruitmentNews/Create
        public ActionResult Create()
        {
            ViewBag.IDEnterprise = new SelectList(db.Enterprises, "IDEnterprise", "EnterpriseName");
            return View();
        }

        // POST: Admin/RecruitmentNews/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDRecruitmentNew,Title,Describe,Content,IDEnterprise,meta,hide,order,datebegin")] RecruitmentNew recruitmentNew)
        {
            if (ModelState.IsValid)
            {
                db.RecruitmentNews.Add(recruitmentNew);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDEnterprise = new SelectList(db.Enterprises, "IDEnterprise", "EnterpriseName", recruitmentNew.IDEnterprise);
            return View(recruitmentNew);
        }

        // GET: Admin/RecruitmentNews/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecruitmentNew recruitmentNew = db.RecruitmentNews.Find(id);
            if (recruitmentNew == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDEnterprise = new SelectList(db.Enterprises, "IDEnterprise", "EnterpriseName", recruitmentNew.IDEnterprise);
            return View(recruitmentNew);
        }

        // POST: Admin/RecruitmentNews/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDRecruitmentNew,Title,Describe,Content,IDEnterprise,meta,hide,order,datebegin")] RecruitmentNew recruitmentNew)
        {
            if (ModelState.IsValid)
            {
                db.Entry(recruitmentNew).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDEnterprise = new SelectList(db.Enterprises, "IDEnterprise", "EnterpriseName", recruitmentNew.IDEnterprise);
            return View(recruitmentNew);
        }

        // GET: Admin/RecruitmentNews/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecruitmentNew recruitmentNew = db.RecruitmentNews.Find(id);
            if (recruitmentNew == null)
            {
                return HttpNotFound();
            }
            return View(recruitmentNew);
        }

        // POST: Admin/RecruitmentNews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RecruitmentNew recruitmentNew = db.RecruitmentNews.Find(id);
            db.RecruitmentNews.Remove(recruitmentNew);
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

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
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
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "IDRecruitmentNew,Title,Describe,Content,JobDescription,IDEnterprise,meta,hide,order,datebegin")] RecruitmentNew recruitmentNew, HttpPostedFileBase file)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (string.IsNullOrEmpty(recruitmentNew.Content) || file == null || file.ContentLength == 0)
                    {
                        TempData["ErrorMessage"] = "Nội dung hoặc file không được để trống";
                        ViewBag.IDEnterprise = new SelectList(db.Enterprises, "IDEnterprise", "EnterpriseName", recruitmentNew.IDEnterprise);
                        return View(recruitmentNew);
                    }
                    if (file != null && file.ContentLength > 0)
                    {
                        var path = "";
                        var filename = "";
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + file.FileName ;
                        path = Path.Combine(Server.MapPath("~/Upload/file/"), filename);
                        file.SaveAs(path);
                        recruitmentNew.JobDescription = filename; //Lưu ý
                    }
                    db.RecruitmentNews.Add(recruitmentNew);
                    db.SaveChanges();
                    return Redirect("/quan-ly/tin-tuyen-dung");
                }
                ViewBag.IDEnterprise = new SelectList(db.Enterprises, "IDEnterprise", "EnterpriseName", recruitmentNew.IDEnterprise);
                return View(recruitmentNew);
            }
            catch (Exception ex)
            {
                // Xử lý ngoại lệ ở đây, có thể ghi log hoặc thông báo cho người dùng
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi tạo tin tuyển dụng. Vui lòng thử lại sau.";
                ViewBag.IDEnterprise = new SelectList(db.Enterprises, "IDEnterprise", "EnterpriseName", recruitmentNew.IDEnterprise);
                return View(recruitmentNew);
            }
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
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "IDRecruitmentNew,Title,Describe,Content,JobDescription,IDEnterprise,meta,hide,order,datebegin")] RecruitmentNew recruitmentNew, HttpPostedFileBase file)
        {
            try
            {
                var path = "";
                var filename = "";
                RecruitmentNew temp = getById(recruitmentNew.IDRecruitmentNew);
                if (ModelState.IsValid)
                {
                    if (recruitmentNew.Content != null) // Kiểm tra nếu news.Content không phải null
                    {
                        temp.Content = recruitmentNew.Content;
                    }
                    if (file != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + Path.GetFileName(file.FileName);
                        path = Path.Combine(Server.MapPath("~/Upload/file"), filename);
                        file.SaveAs(path);
                        temp.JobDescription = filename;
                    }
                    temp.Title = recruitmentNew.Title;
                    temp.Describe = recruitmentNew.Describe;
                    temp.IDEnterprise = recruitmentNew.IDEnterprise;
                    temp.meta = recruitmentNew.meta;
                    temp.hide = recruitmentNew.hide;
                    temp.order = recruitmentNew.order;
                    temp.datebegin = DateTime.Now;
                    db.Entry(temp).State = EntityState.Modified;
                    db.SaveChanges();
                    return Redirect("/quan-ly/tin-tuyen-dung");
                }
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var validationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        Console.WriteLine("Property: {0} Error: {1}",
                            validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi cập nhật tin tức. Vui lòng kiểm tra lại thông tin.";
                return Redirect("/quan-ly/tin-tuyen-dung/chinh-sua?id="+recruitmentNew.IDEnterprise);
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
            return Redirect("/quan-ly/tin-tuyen-dung");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public RecruitmentNew getById(long id)
        {
            return db.RecruitmentNews.Where(x => x.IDRecruitmentNew == id).FirstOrDefault();
        }
    }
}

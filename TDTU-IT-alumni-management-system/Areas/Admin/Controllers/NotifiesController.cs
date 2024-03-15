using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TDTU_IT_alumni_management_system.Models;
using PagedList;
using PagedList.Mvc;

namespace TDTU_IT_alumni_management_system.Areas.Admin.Controllers
{
    public class NotifiesController : Controller
    {
        private TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();

        // GET: Admin/Notifies
        public ActionResult Index(int? page)
        {
            var pageSize = 10; // Số lượng phần tử trên mỗi trang
            var pageNumber = (page ?? 1); // Trang hiện tại, mặc định là trang 1 nếu không có

            // Lấy dữ liệu từ nguồn dữ liệu của bạn (ví dụ: database)
            var data = db.Notifies.OrderByDescending(n => n.datebegin).ToList();

            // Chuyển đổi danh sách thành đối tượng IPagedList
            var pagedData = data.ToPagedList(pageNumber, pageSize);
            ViewBag.GraduationInfoList = db.GraduationInfoes.ToList();
            // Trả về view với đối tượng IPagedList
            return View(pagedData);
        }
        // GET: Admin/Notifies/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Notify notify = db.Notifies.Find(id);
            if (notify == null)
            {
                return HttpNotFound();
            }
            ViewBag.GraduationInfoList = db.GraduationInfoes.ToList();
            return View(notify);
        }

        // GET: Admin/Notifies/Create
        public ActionResult Create()
        {
            ViewBag.GraduationInfoList = db.GraduationInfoes.ToList();
            return View();
        }

        // POST: Admin/Notifies/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "IDNotify,Title,Description,Content,TargetType,IDSender,GraduationInfoID,meta,hide,order,datebegin")] Notify notify)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    notify.IDSender = "admin1";
                    db.Notifies.Add(notify);
                    db.SaveChanges();
                    return Redirect("/quan-ly/thong-bao");
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
            }
            return View(notify);
        }

        // GET: Admin/Notifies/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Notify notify = db.Notifies.Find(id);
            if (notify == null)
            {
                return HttpNotFound();
            }
            ViewBag.GraduationInfoList = db.GraduationInfoes.ToList();
            return View(notify);
        }

        // POST: Admin/Notifies/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "IDNotify,Title,Description,Content,TargetType,IDSender,GraduationInfoID,meta,hide,order,datebegin")] Notify notify)
        {
            try
            {
                Notify temp = GetById(notify.IDNotify);
                if (ModelState.IsValid)
                {
                    if (notify.Content != null) // Kiểm tra nếu news.Content không phải null
                    {
                        temp.Content = notify.Content; // Gán giá trị của news.Content cho temp.Content
                    }
                    temp.Title = notify.Title;
                    temp.Description = notify.Description;
                    temp.TargetType = notify.TargetType;
                    temp.GraduationInfoID = notify.GraduationInfoID;
                    temp.IDSender = "Admin1";
                    temp.meta = notify.meta;
                    temp.hide = notify.hide;
                    temp.datebegin = DateTime.Now;
                    db.Entry(temp).State = EntityState.Modified;
                    db.SaveChanges();
                    return Redirect("/quan-ly/thong-bao");
                    //return RedirectToAction("Index");
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
                return Redirect("/quan-ly/thong-bao/sua-thong-bao?id=" + notify.IDNotify);
            }
            return View(notify);
        }

        // GET: Admin/Notifies/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Notify notify = db.Notifies.Find(id);
            if (notify == null)
            {
                return HttpNotFound();
            }
            return View(notify);
        }

        // POST: Admin/Notifies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int? id)
        {
            Notify notify = db.Notifies.Find(id);
            db.Notifies.Remove(notify);
            db.SaveChanges();
            return Redirect("/quan-ly/thong-bao");
            //return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public Notify GetById(long id)
        {
            return db.Notifies.Where(x => x.IDNotify == id).FirstOrDefault();
        }
        public ActionResult Search(string searchString, int? page)
        {
            var pageSize = 10; // Số lượng phần tử trên mỗi trang
            var pageNumber = (page ?? 1); // Trang hiện tại, mặc định là trang 1 nếu không có

            // Lấy dữ liệu từ nguồn dữ liệu của bạn (ví dụ: database)
            var data = db.Notifies.OrderByDescending(n => n.datebegin).ToList();

            // Nếu có chuỗi tìm kiếm, lọc dữ liệu dựa trên chuỗi đó
            if (!string.IsNullOrEmpty(searchString))
            {
                data = data.Where(n => n.Title.Contains(searchString) || n.Description.Contains(searchString)).ToList();
            }

            // Chuyển đổi danh sách thành đối tượng IPagedList
            var pagedData = data.ToPagedList(pageNumber, pageSize);
            ViewBag.GraduationInfoList = db.GraduationInfoes.ToList();

            // Trả về view với đối tượng IPagedList
            return View("Index", pagedData);
        }
    }
}

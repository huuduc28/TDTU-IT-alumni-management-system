using PagedList;
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
    public class EnterprisesController : Controller
    {
        private TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();

        // GET: Admin/Enterprises
        public ActionResult Index(int? page)
        {
            var pageSize = 10;
            var pageNumber = (page ?? 1);
            var data = db.Enterprises.OrderByDescending(n => n.datebegin).ToList();
            var pagedData = data.ToPagedList(pageNumber, pageSize);
            return View(pagedData);
        }

        // GET: Admin/Enterprises/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Enterprise enterprise = db.Enterprises.Find(id);
            if (enterprise == null)
            {
                return HttpNotFound();
            }
            return View(enterprise);
        }

        // GET: Admin/Enterprises/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Enterprises/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "IDEnterprise,EnterpriseName,EnterpriseAddress,Phone,Email,Website,ImgLogo,meta,hide,order,datebegin")] Enterprise enterprise, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                if (ModelState.IsValid)
                {
                    // Kiểm tra xem các trường bắt buộc có được nhập hay không
                    if (img == null)
                    {
                        string errorMessage = "Vui lòng nhập đầy đủ thông tin cho các trường bắt buộc.";
                        TempData["ErrorMessage"] = errorMessage;

                        // Lưu trữ dữ liệu đã nhập vào TempData để khôi phục sau khi đóng modal
                        TempData["FormData"] = enterprise;

                        return Redirect("/quan-ly/doanh-nghiep");
                    }
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Upload/images/Logo"), filename);
                        img.SaveAs(path);
                        enterprise.ImgLogo = filename; //Lưu ý
                    }
                    db.Enterprises.Add(enterprise);
                    db.SaveChanges();
                    return Redirect("/quan-ly/doanh-nghiep");
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
                TempData["FormData"] = enterprise;
                return Redirect("/quan-ly/doanh-nghiep/tao-moi");
            }
            return View(enterprise);
        }

        // GET: Admin/Enterprises/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Enterprise enterprise = db.Enterprises.Find(id);
            if (enterprise == null)
            {
                return HttpNotFound();
            }
            return View(enterprise);
        }

        // POST: Admin/Enterprises/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "IDEnterprise,EnterpriseName,EnterpriseAddress,Phone,Email,Website,ImgLogo,meta,hide,order,datebegin")] Enterprise enterprise ,HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                Enterprise temp = GetById(enterprise.IDEnterprise);
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + Path.GetFileName(img.FileName);
                        path = Path.Combine(Server.MapPath("~/Upload/images/Logo"), filename);
                        img.SaveAs(path);
                        temp.ImgLogo = filename;
                    }
                    temp.EnterpriseName = enterprise.EnterpriseName;
                    temp.EnterpriseAddress = enterprise.EnterpriseAddress;
                    temp.Phone = enterprise.Phone;
                    temp.Email = enterprise.Email;
                    temp.Website = enterprise.Website;
                    temp.meta = enterprise.meta;
                    temp.hide = enterprise.hide;
                    temp.datebegin = DateTime.Now;
                    db.Entry(temp).State = EntityState.Modified;
                    db.SaveChanges();
                    return Redirect("/quan-ly/doanh-nghiep");
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
                return Redirect("/quan-ly/doanh-nghiep/chinh-sua?id="+enterprise.IDEnterprise);
            }
            return View(enterprise);
        }

        // GET: Admin/Enterprises/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Enterprise enterprise = db.Enterprises.Find(id);
            if (enterprise == null)
            {
                return HttpNotFound();
            }
            return View(enterprise);
        }

        // POST: Admin/Enterprises/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            //Enterprise enterprise = db.Enterprises.Find(id);
            //db.Enterprises.Remove(enterprise);
            //db.SaveChanges();
            //return Redirect("/quan-ly/doanh-nghiep");
            Enterprise enterprise = db.Enterprises.Find(id);
            bool isRecumentNew= db.RecruitmentNews.Any(ad => ad.IDEnterprise == id);

            if (isRecumentNew)
            {
                TempData["ErrorMessage"] = "Không thể xóa vì dữ liệu đang được sử dụng trong các bảng khác.";
                return Redirect("/quan-ly/doanh-nghiep");
            }
            db.Enterprises.Remove(enterprise);
            db.SaveChanges();
            return Redirect("/quan-ly/doanh-nghiep");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public Enterprise GetById(long id)
        {
            return db.Enterprises.Where(x => x.IDEnterprise == id).FirstOrDefault();
        }
    }
}

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
using System.Data.SqlClient;
using System.Data.Entity.Validation;
using System.IO;
using System.Text.RegularExpressions;
using System.Xml.Linq;

namespace TDTU_IT_alumni_management_system.Areas.Admin.Controllers
{
    public class AlumniController : Controller
    {
        private TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();

        // GET: Admin/Alumni
        public ActionResult Index(int? page)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                var pageSize = 10;
                var pageNumber = (page ?? 1);
                var data = db.Alumni.Include(r => r.GraduationInfo).ToList();
                var pagedData = data.ToPagedList(pageNumber, pageSize);
                return View(pagedData);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
           
        }
        // GET: Admin/Alumni/Details/5
        public ActionResult Details(string id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
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
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
            
        }

        // GET: Admin/Alumni/Create
        public ActionResult Create()
        {

            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                ViewBag.GraduationInfoList = db.GraduationInfoes.ToList();
                return View();
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
            
        }

        // POST: Admin/Alumni/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "IDAlumni,Name,Email,Phone,Birthday,Gender,ProfilePicture,Nationality,HomeTown,PersonalWebsite,skill,GraduationType,GraduationInfoID,CurrentCompany,AcademicLevel,TimeToCompletionOfThesisDefense,Profession,jobBeginDate,Password,meta,hide,order,datebegin")] Alumnus alumnus, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                if (ModelState.IsValid)
                {
                    if (img == null)
                    {
                        string errorMessage = "Vui lòng nhập đầy đủ thông tin cho các trường bắt buộc.";
                        TempData["ErrorMessage"] = errorMessage;
                        return Redirect("/quan-ly/cuu-sinh-vien/tao-moi");
                    }
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Upload/images/Avata"), filename);
                        img.SaveAs(path);
                        alumnus.ProfilePicture = filename;
                    }
                    alumnus.Password = HashPassword(alumnus.Password);
                    alumnus.meta = "cuu-sinh-vien";
                    db.Alumni.Add(alumnus);
                    db.SaveChanges();
                    return Redirect("/quan-ly/cuu-sinh-vien");
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
                // Nếu có lỗi, thiết lập thông báo lỗi và lưu trữ dữ liệu đã nhập vào TempData
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi tạo tin tức. Vui lòng kiểm tra lại thông tin.";
                TempData["FormData"] = alumnus;
                return Redirect("/quan-ly/cuu-sinh-vien/tao-moi");
            }
            return View(alumnus);
        }

        // GET: Admin/Alumni/Edit/5
        public ActionResult Edit(string id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
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
                ViewBag.GraduationInfoList = db.GraduationInfoes.ToList();
                return View(alumnus);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
            
        }

        // POST: Admin/Alumni/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "IDAlumni,Name,Email,Phone,Birthday,Gender,ProfilePicture,Nationality,HomeTown,PersonalWebsite,skill,GraduationType,GraduationInfoID,CurrentCompany,AcademicLevel,Profession,jobBeginDate,meta,hide,datebegin")] Alumnus alumnus, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                Alumnus temp = getById(alumnus.IDAlumni);
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + Path.GetFileName(img.FileName);
                        path = Path.Combine(Server.MapPath("~/Upload/images/Avata"), filename);
                        img.SaveAs(path);
                        temp.ProfilePicture = filename;
                    }
                    temp.Name = alumnus.Name;
                    temp.Email = alumnus.Email;
                    temp.Phone = alumnus.Phone;
                    temp.Birthday = alumnus.Birthday;
                    temp.Gender = alumnus.Gender;
                    temp.Nationality = alumnus.Nationality;
                    temp.HomeTown = alumnus.HomeTown;
                    temp.PersonalWebsite = alumnus.PersonalWebsite;
                    temp.skill = alumnus.skill;
                    temp.GraduationType = alumnus.GraduationType;
                    temp.GraduationInfoID = alumnus.GraduationInfoID;
                    temp.CurrentCompany = alumnus.CurrentCompany;
                    temp.AcademicLevel = alumnus.AcademicLevel;
                    temp.Profession = alumnus.Profession;
                    temp.jobBeginDate = alumnus.jobBeginDate;
                    temp.datebegin = DateTime.Now;
                    temp.meta = alumnus.meta;
                    temp.hide = alumnus.hide;
                    db.Entry(temp).State = EntityState.Modified;
                    db.SaveChanges();
                    return Redirect("/quan-ly/cuu-sinh-vien");
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
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi cập nhật. Vui lòng kiểm tra lại thông tin.";
                return Redirect("/quan-ly/cuu-sinh-vien/chinh-sua?id="+alumnus.IDAlumni);
            }
            return View(alumnus);
        }

        // GET: Admin/Alumni/Delete/5
        public ActionResult Delete(string id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
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
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
            
        }
        // POST: Admin/Alumni/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Alumnus alumnus = db.Alumni.Find(id);
            db.Alumni.Remove(alumnus);
            db.SaveChanges();
            return Redirect("/quan-ly/cuu-sinh-vien");
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
        public Alumnus getById(string id)
        {
            return db.Alumni.Where(x => x.IDAlumni == id).FirstOrDefault();
        }
        public static string HashPassword(string password)
        {
            string salt = BCrypt.Net.BCrypt.GenerateSalt();
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password, salt);
            return hashedPassword;
        }
    }
}
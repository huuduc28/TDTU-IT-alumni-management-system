using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Xml.Linq;
using System.Security.Cryptography;
using BCrypt.Net;
using TDTU_IT_alumni_management_system.Models;

namespace TDTU_IT_alumni_management_system.Controllers
{
    public class AlumnisController : Controller
    {
        // GET: Alumnis

        TDTUAlumnisManagementSystemEntities context = new TDTUAlumnisManagementSystemEntities();

        public ActionResult Index()
        {
            if (Session["UID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Index", "Login");
            }
            else
            {
                return View();
            }
        }
        public ActionResult GetAlumniByMajor(string major, int count, string searchString)
        {
            using (var context = new TDTUAlumnisManagementSystemEntities())
            {
                ViewBag.meta = "cuu-sinh-vien";

                if (!string.IsNullOrEmpty(major))
                {
                    if (count > 0)
                    {
                        var v = from g in context.GraduationInfoes
                                join a in context.Alumni on g.ID equals a.GraduationInfoID
                                where g.Majors == major
                                orderby a.datebegin ascending
                                select new AlumnusModel
                                {
                                    IDAlumni = a.IDAlumni,
                                    Name = a.Name,
                                    Email = a.Email,
                                    Phone = a.Phone,
                                    Gender = a.Gender,
                                    ProfilePicture = a.ProfilePicture,
                                    Nationality = a.Nationality,
                                    AcademicLevel = a.AcademicLevel,
                                    GraduationInfoID = a.GraduationInfoID,
                                    Majors = g.Majors,
                                    GraduationYear = g.GraduationYear,
                                    meta = a.meta,
                                    hide = (bool)a.hide,
                                    order = (int)a.order,
                                    datebegin = (DateTime)a.datebegin
                                };
                        return PartialView(v.Take(count).ToList());
                    }
                    else
                    {
                        if (!string.IsNullOrEmpty(searchString))
                        {
                            var v = from g in context.GraduationInfoes
                                    join a in context.Alumni on g.ID equals a.GraduationInfoID
                                    where a.Name.Contains(searchString) || a.IDAlumni.Contains(searchString)
                                    orderby a.datebegin ascending
                                    select new AlumnusModel
                                    {
                                        IDAlumni = a.IDAlumni,
                                        Name = a.Name,
                                        Email = a.Email,
                                        Phone = a.Phone,
                                        Gender = a.Gender,
                                        ProfilePicture = a.ProfilePicture,
                                        Nationality = a.Nationality,
                                        GraduationInfoID = a.GraduationInfoID,
                                        Majors = g.Majors,
                                        GraduationYear = g.GraduationYear,
                                        meta = a.meta,
                                        hide = (bool)a.hide,
                                        order = (int)a.order,
                                        datebegin = (DateTime)a.datebegin
                                    };
                            return PartialView(v.ToList());
                        }
                        else
                        {
                            var v = from g in context.GraduationInfoes
                                    join a in context.Alumni on g.ID equals a.GraduationInfoID
                                    where g.Majors == major
                                    orderby a.datebegin ascending
                                    select new AlumnusModel
                                    {
                                        IDAlumni = a.IDAlumni,
                                        Name = a.Name,
                                        Email = a.Email,
                                        Phone = a.Phone,
                                        Gender = a.Gender,
                                        ProfilePicture = a.ProfilePicture,
                                        Nationality = a.Nationality,
                                        GraduationInfoID = a.GraduationInfoID,
                                        Majors = g.Majors,
                                        GraduationYear = g.GraduationYear,
                                        meta = a.meta,
                                        hide = (bool)a.hide,
                                        order = (int)a.order,
                                        datebegin = (DateTime)a.datebegin
                                    };
                            return PartialView(v.ToList());
                        }
                    }
                }
                else
                {
                    ViewData["major"] = major;
                    // Lấy danh sách sinh viên theo ngành, sắp xếp theo order tăng dần
                    var alumni = context.Alumni.OrderBy(a => a.order).ToList();
                    return PartialView(alumni);
                }
            }
        }

        public ActionResult AlumniCategory(string majorKey)
        {
            if (Session["UID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Index", "Login");
            }
            else
            {
                var major = majorKey;
                ViewBag.meta = "cuu-sinh-vien";
                ViewData["majorKey"] = major;
                return View();
            }
        }
        public ActionResult DetailAlumni(string id)
        {
            if (Session["UID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Index", "Login");
            }
            else
            {
                using (var context = new TDTUAlumnisManagementSystemEntities())
                {
                    ViewBag.meta = "cuu-sinh-vien";
                    var v = from g in context.GraduationInfoes
                            join a in context.Alumni on g.ID equals a.GraduationInfoID
                            where a.IDAlumni == id
                            orderby a.datebegin ascending
                            select new AlumnusModel
                            {
                                IDAlumni = a.IDAlumni,
                                Name = a.Name,
                                Email = a.Email,
                                Phone = a.Phone,
                                Gender = a.Gender,
                                ProfilePicture = a.ProfilePicture,
                                Nationality = a.Nationality,
                                HomeTown = a.HomeTown,
                                PersonalWebsite = a.PersonalWebsite,
                                GraduationType = a.GraduationType,
                                CurrentCompany = a.CurrentCompany,
                                Profession = a.Profession,
                                jobBeginDate = (DateTime)a.jobBeginDate,
                                skill = a.skill,
                                GraduationInfoID = a.GraduationInfoID,
                                Majors = g.Majors,
                                GraduationYear = g.GraduationYear,
                                meta = a.meta,
                                hide = (bool)a.hide,
                                order = (int)a.order,
                                datebegin = (DateTime)a.datebegin
                            };
                    return View(v.FirstOrDefault());
                }
            }
                        
        }
        public ActionResult PersonInfo(string id)
        {
            if (Session["UID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Index", "Login");
            }
            if ((int)Session["Role"] == 1)
            {
                return Redirect("/");
            }
            else
            {
                var v = from t in context.Alumni
                        where t.IDAlumni == id
                        select t;
                return View(v.FirstOrDefault());
            }
        }
        public ActionResult Edit(string id)
        {
            if (Session["UID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Index", "Login");
            }
            else
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Alumnus alumnus = context.Alumni.Find(id);
                if (alumnus == null)
                {
                    return HttpNotFound();
                }
                return View(alumnus);
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "IDAlumni,Name,Email,Phone,Birthday,Gender,ProfilePicture,Nationality,HomeTown,PersonalWebsite,skill,GraduationType,GraduationInfoID,CurrentCompany,AcademicLevel,Profession,jobBeginDate, ReceiveNews, Password,meta,hide,order,datebegin")] Alumnus alumnus, HttpPostedFileBase img)
        {
            if (Session["UID"] == null)
            {
                // Chuyển hướng đến trang đăng nhập
                return RedirectToAction("Index", "Login");
            }
            else
            {
                string id = Session["UID"].ToString();
                try
                {
                    var path = "";
                    var filename = "";
                    Alumnus temp = GetById(alumnus.IDAlumni);
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
                        temp.CurrentCompany = alumnus.CurrentCompany;
                        temp.AcademicLevel = alumnus.AcademicLevel;
                        temp.Profession = alumnus.Profession;
                        temp.jobBeginDate = alumnus.jobBeginDate;
                        temp.ReceiveNews = alumnus.ReceiveNews;
                        context.Entry(temp).State = EntityState.Modified;
                        context.SaveChanges();
                        return Redirect("/thong-tin-ca-nhan/chi-tiet/" + id);
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
                    return Redirect("/thong-tin-ca-nhan/chinh-sua/" + id);
                }
                return View(alumnus);
            }
        }

        public Alumnus GetById(string id)
        {
            return context.Alumni.Where(x => x.IDAlumni == id).FirstOrDefault();
        }
        public ActionResult Search(string searchString)
        {
            var data = context.Alumni.OrderByDescending(n => n.datebegin).ToList();

            if (!string.IsNullOrEmpty(searchString))
            {
                data = data.Where(n => n.IDAlumni.Contains(searchString) || n.Name.Contains(searchString)).ToList();
            }

            ViewBag.GraduationInfoList = context.GraduationInfoes.ToList();

            return View("GetAlumniByMajor", data);
        }
    }
}
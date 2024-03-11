using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using TDTU_IT_alumni_management_system.Models;

namespace TDTU_IT_alumni_management_system.Controllers
{
    public class AlumnisController : Controller
    {
        // GET: Alumnis

        TDTUAlumnisManagementSystemEntities context = new TDTUAlumnisManagementSystemEntities();

        public ActionResult Index(string meta)
        {
            return View();
        }
        public ActionResult GetAlumniByMajor(string major, int count)
        {
            if (major != null)
            {
                if (count > 0)
                {
                    ViewBag.meta = "cuu-sinh-vien";
                    
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
                                GraduationInfo = a.GraduationInfo,
                                meta = a.meta,
                                hide = (bool)a.hide,
                                order = (int)a.order,
                                datebegin = (DateTime)a.datebegin
                            };
                    return PartialView(v.Take(count).ToList());
                }
                else
                {
                    ViewBag.meta = "cuu-sinh-vien";
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
                                GraduationInfo = a.GraduationInfo,
                                meta = a.meta,
                                hide = (bool)a.hide,
                                order = (int)a.order,
                                datebegin = (DateTime)a.datebegin
                            };
                    return PartialView(v.ToList());
                }
            }
            else
            {
                using (var context = new TDTUAlumnisManagementSystemEntities())
                {
                    ViewBag.meta = "cuu-sinh-vien";
                    ViewData["major"] = major;
                    // Lấy danh sách sinh viên theo ngành, sắp xếp theo order tăng dần
                    var alumni = context.Alumni.OrderBy(a => a.order).ToList();
                    return PartialView(alumni);
                }
            }
            
        }


        public ActionResult AlumniCategory(string majorKey)
        {
            var major = majorKey;
            ViewBag.meta = "cuu-sinh-vien";
            ViewData["majorKey"] = major;
            return View();
        }
        public ActionResult DetailAlumni(string id)
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
                            jobBeginDate = a.jobBeginDate,
                            skill = a.skill,
                            GraduationInfoID = a.GraduationInfoID,
                            GraduationInfo = a.GraduationInfo,
                            meta = a.meta,
                            hide = (bool)a.hide,
                            order = (int)a.order,
                            datebegin = (DateTime)a.datebegin
                        };
                return View(v.FirstOrDefault());
            }            
        }
        public ActionResult PersonInfo()
        {
            return View();
        }
    }
}
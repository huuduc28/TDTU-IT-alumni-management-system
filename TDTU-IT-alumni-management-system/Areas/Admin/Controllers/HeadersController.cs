using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
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
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                return View(db.Headers.ToList());
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
        }
        // GET: Admin/Headers/Edit/5
        public ActionResult Edit(string id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
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
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
           
        }

        // POST: Admin/Headers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "IDHeader,Title,ImgLogo,meta,hide,order,datebegin")] Header header, HttpPostedFileBase img)
        {
            try
            {
                Header temp = db.Headers.Find(header.IDHeader);
                if (ModelState.IsValid)
                {
                    var path = "";
                    var filename = "";
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + Path.GetFileName(img.FileName);
                        path = Path.Combine(Server.MapPath("~/Upload/images/Logo"), filename);
                        img.SaveAs(path);
                        temp.ImgLogo = filename;
                        Console.WriteLine(temp.ImgLogo);
                    }
                    temp.Title = header.Title;
                    temp.datebegin = DateTime.Now;
                    db.Entry(temp).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
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
                return RedirectToAction("Edit", new { id = header.IDHeader });
            }
            return View(header);
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

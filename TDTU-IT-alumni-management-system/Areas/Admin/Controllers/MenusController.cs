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
    public class MenusController : Controller
    {
        private TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();

        // GET: Admin/Menus
        public ActionResult Index()
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                var items = db.Menus.ToList();
                var viewModels = new List<MenuViewModel>();
                foreach (var item in items)
                {
                    var viewModel = new MenuViewModel
                    {
                        ID = item.IDMenu,
                        Title = item.Title,
                        HasChild = (bool)item.HasChild,
                        Meta = item.meta,
                        Hide = (bool)item.hide,
                        Order = (int)item.order,
                        DateBegin = (DateTime)item.datebegin,
                    };
                    if (item.ParentID != null)
                    {
                        var parent = db.Menus.FirstOrDefault(p => p.IDMenu == item.ParentID);
                        if (parent != null)
                        {
                            viewModel.ParentName = parent.Title;
                        }
                    }

                    // Thêm ViewModel vào danh sách
                    viewModels.Add(viewModel);
                }

                // Trả về View với danh sách ViewModel
                return View(viewModels);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");

            }
        }

        // GET: Admin/Menus/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Menu menu = db.Menus.Find(id);
                if (menu == null)
                {
                    return HttpNotFound();
                }
                return View(menu);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
            
        }

        // GET: Admin/Menus/Create
        public ActionResult Create()
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                var menuItemsWithChild = db.Menus.Where(m => (bool)m.HasChild).ToList();

                var menuItemsList = menuItemsWithChild.Select(item => new SelectListItem
                {
                    Text = $"{item.IDMenu} - {item.Title}",
                    Value = item.IDMenu.ToString()
                }).ToList();
                menuItemsList.Insert(0, new SelectListItem { Text = "Không", Value = "" });

                ViewBag.ParentID = menuItemsList;

                return View();
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
        }

        // POST: Admin/Menus/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDMenu,Title,ParentID,HasChild,meta,hide,order,datebegin")] Menu menu)
        {
            if (ModelState.IsValid)
            {
                db.Menus.Add(menu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(menu);
        }

        // GET: Admin/Menus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }

                Menu menu = db.Menus.Find(id);
                if (menu == null)
                {
                    return HttpNotFound();
                }

                var menuItemsWithChild = db.Menus.Where(m => (bool)m.HasChild).ToList();

                var menuItemsList = menuItemsWithChild.Select(item => new SelectListItem
                {
                    Text = $"{item.IDMenu} - {item.Title}",
                    Value = item.IDMenu.ToString(),
                    Selected = (item.IDMenu == menu.ParentID) // Chọn mục cha hiện tại của menu
                }).ToList();
                menuItemsList.Insert(0, new SelectListItem { Text = "Không", Value = "" });

                ViewBag.ParentID = menuItemsList;

                return View(menu);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
         
        }

        // POST: Admin/Menus/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDMenu,Title,ParentID,HasChild,meta,hide,order,datebegin")] Menu menu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(menu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(menu);
        }

        // GET: Admin/Menus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Menu menu = db.Menus.Find(id);
                if (menu == null)
                {
                    return HttpNotFound();
                }
                return View(menu);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
            
        }

        // POST: Admin/Menus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int? id)
        {
            Menu menu = db.Menus.Find(id);
            db.Menus.Remove(menu);
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

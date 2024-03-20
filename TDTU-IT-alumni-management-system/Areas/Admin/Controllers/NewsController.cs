using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;
using TDTU_IT_alumni_management_system.Models;

namespace TDTU_IT_alumni_management_system.Areas.Admin.Controllers
{
    public class NewsController : Controller
    {
        private TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();

        // GET: Admin/News
        public ActionResult Index(int? page)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                var pageSize = 10; 
                var pageNumber = (page ?? 1); 
                var data = db.News.OrderByDescending(n => n.datebegin).ToList();
                var pagedData = data.ToPagedList(pageNumber, pageSize);
                return View(pagedData);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
          
        }

        // GET: Admin/News/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                News news = db.News.Find(id);
                if (news == null)
                {
                    return HttpNotFound();
                }
                return View(news);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
           
        }

        // GET: Admin/News/Create
        public ActionResult Create()
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                // Kiểm tra xem có thông báo lỗi trong TempData không
                if (TempData["ErrorMessage"] != null)
                {
                    // Lấy dữ liệu đã nhập từ TempData để hiển thị lại trên giao diện
                    var formData = TempData["FormData"] as News;

                    // Truyền dữ liệu đã lưu vào mô hình để hiển thị lại trên giao diện
                    return View(formData);
                }

                // Nếu không có thông báo lỗi, trả về trang Create bình thường
                return View();
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
           
        }

        // POST: Admin/News/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "IDNews,Title,Description,Content,ImgNews,meta,hide,order,datebegin")] News news , HttpPostedFileBase img)
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
                        TempData["FormData"] = news;

                        return Redirect("/quan-ly/tin-tuc/tao-tin-tuc");
                    }
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Upload/images/News"), filename);
                        img.SaveAs(path);
                        news.ImgNews = filename; //Lưu ý
                    }
                    db.News.Add(news);
                    db.SaveChanges();
                    return Redirect("/quan-ly/tin-tuc");
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
                TempData["FormData"] = news;
                return Redirect("/quan-ly/tin-tuc/tao-tin-tuc");
            }
            return View(news);
        }

        // GET: Admin/News/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                News news = db.News.Find(id);
                if (news == null)
                {
                    return HttpNotFound();
                }
                return View(news);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
           
        }

        // POST: Admin/News/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "IDNews,Title,Description,Content,ImgNews,meta,hide,order,datebegin")] News news, HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                News temp = getById(news.IDNews);
                if (ModelState.IsValid)
                {
                    if (news.Content != null) // Kiểm tra nếu news.Content không phải null
                    {
                        temp.Content = news.Content; // Gán giá trị của news.Content cho temp.Content
                    }
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + Path.GetFileName(img.FileName);
                        path = Path.Combine(Server.MapPath("~/Upload/images/News"), filename);
                        img.SaveAs(path);
                        temp.ImgNews = filename;
                    }
                    else
                    {
                        temp.ImgNews = temp.ImgNews;
                    }
                    temp.Title = news.Title;
                    temp.Description = news.Description;
                    temp.datebegin = DateTime.Now;
                    temp.meta = news.meta;
                    temp.hide = news.hide;
                    db.Entry(temp).State = EntityState.Modified;
                    db.SaveChanges();
                    return Redirect("/quan-ly/tin-tuc");
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

                return Redirect("/quan-ly/tin-tuc/sua-tin-tuc?id=" + news.IDNews);
            }
            return View(news);
        }

        // GET: Admin/News/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }

                News news = db.News.Find(id);
                if (news == null)
                {
                    return HttpNotFound();
                }

                return PartialView("_DeleteConfirmation", news);
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
            
        }

        // POST: Admin/News/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int? id)
        {
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }

            db.News.Remove(news);
            db.SaveChanges();
            return Redirect("/quan-ly/tin-tuc");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        // Hàm chuyển đổi dấu thành không dấu và loại bỏ các ký tự không mong muốn
        private string ConvertToUnSign(string input)
        {
            StringBuilder result = new StringBuilder();

            foreach (char c in input)
            {
                // Kiểm tra nếu ký tự là chữ cái, chữ số hoặc dấu gạch ngang
                if (char.IsLetterOrDigit(c) || c == '-')
                {
                    // Thêm ký tự vào chuỗi kết quả
                    result.Append(c);
                }
            }

            return result.ToString();
        }
        public News getById(long id)
        {
            return db.News.Where(x => x.IDNews == id).FirstOrDefault();
        }
        public ActionResult Search(string searchString, int? page)
        {
            var pageSize = 10; // Số lượng phần tử trên mỗi trang
            var pageNumber = (page ?? 1); // Trang hiện tại, mặc định là trang 1 nếu không có
            var data = db.News.OrderByDescending(n => n.datebegin).ToList();

            // Nếu có chuỗi tìm kiếm, lọc dữ liệu dựa trên chuỗi đó
            if (!string.IsNullOrEmpty(searchString))
            {
                data = data.Where(n =>
                    n.Title.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    n.Description.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) >= 0
                ).ToList();
            }
            var pagedData = data.ToPagedList(pageNumber, pageSize);
            // Trả về view với đối tượng IPagedList
            return View("Index", pagedData);
        }

    }
}

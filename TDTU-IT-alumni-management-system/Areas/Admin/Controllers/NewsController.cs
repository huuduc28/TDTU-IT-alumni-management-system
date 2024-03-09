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
        public ActionResult Index()
        {
            return View(db.News.ToList());
        }

        // GET: Admin/News/Details/5
        public ActionResult Details(int? id)
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

        // GET: Admin/News/Create
        public ActionResult Create()
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
                    if (string.IsNullOrEmpty(news.Title) || string.IsNullOrEmpty(news.Description) || string.IsNullOrEmpty(news.Content) || img == null)
                    {
                        string errorMessage = "Vui lòng nhập đầy đủ thông tin cho các trường bắt buộc.";
                        TempData["ErrorMessage"] = errorMessage;

                        // Lưu trữ dữ liệu đã nhập vào TempData để khôi phục sau khi đóng modal
                        TempData["FormData"] = news;

                        return RedirectToAction("Create");
                    }
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Upload/images/News"), filename);
                        img.SaveAs(path);
                        news.ImgNews = filename; //Lưu ý
                    }
                    else
                    {
                        news.ImgNews = "logo.png";
                    }
                    news.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    db.News.Add(news);
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
                // Nếu có lỗi, thiết lập thông báo lỗi và lưu trữ dữ liệu đã nhập vào TempData
                TempData["ErrorMessage"] = "Có lỗi xảy ra khi tạo tin tức. Vui lòng kiểm tra lại thông tin.";
                TempData["FormData"] = news;
                return RedirectToAction("Create");
            }
            return View(news);
        }

        // GET: Admin/News/Edit/5
        public ActionResult Edit(int? id)
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

        // POST: Admin/News/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "IDNews,Title,Content,ImgNews,meta,hide,order,datebegin")] News news , HttpPostedFileBase img)
        {
            try
            {
                var path = "";
                var filename = "";
                News temp = getById(news.IDNews);
                if (ModelState.IsValid)
                {
                    if (img != null)
                    {
                        filename = DateTime.Now.ToString("dd-MM-yy-hh-mm-ss-") + img.FileName;
                        path = Path.Combine(Server.MapPath("~/Upload/images/News"), filename);
                        img.SaveAs(path);
                        temp.ImgNews = filename; //Lưu ý
                    }
                    temp.Title = news.Title;
                    temp.Content = news.Content;
                    temp.Description = news.Description;
                    news.datebegin = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    temp.meta = ConvertToUnSign(news.meta); //convert Tiếng Việt không dấu
                    db.Entry(temp).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (DbEntityValidationException e)
            {
                throw e;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return View(news);
        }

        // GET: Admin/News/Delete/5
        public ActionResult Delete(int? id)
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
        //private string GetFirstWords(string input, int wordCount)
        //{
        //    // Tách chuỗi thành mảng các từ
        //    string[] words = input.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

        //    // Lấy số từ cần thiết từ mảng
        //    int numWords = Math.Min(wordCount, words.Length);

        //    // Kết hợp các từ thành chuỗi kết quả
        //    string result = string.Join(" ", words, 0, numWords);

        //    return result;
        //}
    }
}

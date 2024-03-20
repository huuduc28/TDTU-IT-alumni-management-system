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
using MailKit.Security;
using MimeKit;
using MailKit.Net.Smtp;
using System.Threading.Tasks;

namespace TDTU_IT_alumni_management_system.Areas.Admin.Controllers
{
    public class NotifiesController : Controller
    {
        private TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();

        // GET: Admin/Notifies
        public ActionResult Index(int? page)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
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
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
           
        }
        // GET: Admin/Notifies/Details/5
        public ActionResult Details(int? id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
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
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
          
        }

        // GET: Admin/Notifies/Create
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

        // POST: Admin/Notifies/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public async Task<ActionResult> Create([Bind(Include = "IDNotify,Title,Description,Content,TargetType,IDSender,GraduationInfoID,meta,hide,order,datebegin")] Notify notify)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    notify.IDSender = "admin01";
                    db.Notifies.Add(notify);
                    db.SaveChanges();
                    
                    var sendEmailList = (from n in db.Notifies
                                        join a in db.Alumni on n.GraduationInfoID equals a.GraduationInfoID
                                        where a.ReceiveNews == true
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
                                            meta = a.meta,
                                            hide = (bool)a.hide,
                                            order = (int)a.order,
                                            datebegin = (DateTime)a.datebegin
                                        }).ToList();
                    await SendEmail(notify, sendEmailList);
                    

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
            if (Session["UID"] != null && (int)Session["Role"] == 1)
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
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
            
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
            if (Session["UID"] != null && (int)Session["Role"] == 1)
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
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
           
        }

        // POST: Admin/Notifies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int? id)
        {
            if (Session["UID"] != null && (int)Session["Role"] == 1)
            {
                Notify notify = db.Notifies.Find(id);
                db.Notifies.Remove(notify);
                db.SaveChanges();
                return Redirect("/quan-ly/thong-bao"); 
            }
            else
            {
                return Redirect("/quan-ly/dang-nhap");
            }
           
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
                data = data.Where(n =>
                    n.Title.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) >= 0 ||
                    n.Description.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) >= 0
                ).ToList();
            }

            // Chuyển đổi danh sách thành đối tượng IPagedList
            var pagedData = data.ToPagedList(pageNumber, pageSize);
            ViewBag.GraduationInfoList = db.GraduationInfoes.ToList();

            // Trả về view với đối tượng IPagedList
            return View("Index", pagedData);
        }

        public static async Task SendEmail(Notify notify, List<AlumnusModel> alumniList)
        {
            // Tạo email message
            var notifyLink = "https://t.ly/bJVcr";
            //var notifyLink = "~/thong-bao/" + notify.meta + "/" + notify.IDNotify;


            var message = new MimeMessage();
            message.From.Add(new MailboxAddress("TDTUAlumnis", "swordbestking@gmail.com"));
            foreach (var item in alumniList)
            {
                message.To.Add(new MailboxAddress(item.Email, item.Email));
            }
            message.Subject = "Thông báo mới từ TDTU Alumnis:" + notify.Title;
            message.Body = new TextPart(MimeKit.Text.TextFormat.Html) { Text =  notify.Description + "<br>" + notify.Content +
                            "<br><br><a href=\"" + notifyLink + "\"><button style=\"background-color: #4CAF50; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer;\">Link thông báo</button></a>" };

            // Tạo SMTP client
            using (var client = new SmtpClient())
            {
                await client.ConnectAsync("smtp.gmail.com", 587, SecureSocketOptions.StartTls);
                await client.AuthenticateAsync("swordbestking@gmail.com", "wrux tvne fuwu eaie");
                await client.SendAsync(message);
                await client.DisconnectAsync(true);
            }
        }
    }
}

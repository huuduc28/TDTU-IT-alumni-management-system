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
using CsvHelper;
using System.Globalization;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using NPOI.HSSF.UserModel;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;

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
            TempData["SuccessMessage"] = "Sửa cựu sinh viên thành công";
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
                data = data.Where(n => n.IDAlumni.Contains(searchString) || n.Name.IndexOf(searchString, StringComparison.OrdinalIgnoreCase) >= 0).ToList();
            }
            var pagedData = data.ToPagedList(pageNumber, pageSize);
            return View("Index", pagedData);
        }
        public ActionResult DataFilter(string majorKey, int? graduationYear, string typeOfTraining)
        {
            var query = db.Alumni.Include(r => r.GraduationInfo);
            if (!string.IsNullOrEmpty(majorKey))
            {
                query = query.Where(a => a.GraduationInfo.Majors == majorKey);
            }
            if (graduationYear.HasValue)
            {
                query = query.Where(a => a.GraduationInfo.GraduationYear == graduationYear.Value);
            }

            if (!string.IsNullOrEmpty(typeOfTraining))
            {
                query = query.Where(a => a.TypeOfTraining.Contains(typeOfTraining));
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
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Import(HttpPostedFileBase excelFile)
        {
            if (excelFile != null && excelFile.ContentLength > 0)
            {
                string excelFilePath = "";
                string excelFileName = "";
                try
                {
                    excelFileName = Path.GetFileName(excelFile.FileName);
                    excelFilePath = Path.Combine(Server.MapPath("~/Upload/file"), excelFileName);
                    excelFile.SaveAs(excelFilePath);

                    // Đọc dữ liệu từ file Excel
                    using (FileStream stream = new FileStream(excelFilePath, FileMode.Open, FileAccess.Read))
                    {
                        IWorkbook workbook;
                        if (excelFileName.EndsWith(".xls"))
                        {
                            // Đối với file Excel định dạng .xls (Excel 97-2003)
                            workbook = new HSSFWorkbook(stream);
                        }
                        else if (excelFileName.EndsWith(".xlsx"))
                        {
                            // Đối với file Excel định dạng .xlsx (Excel 2007 trở lên)
                            workbook = new XSSFWorkbook(stream);
                        }
                        else
                        {
                            throw new Exception("Định dạng file Excel không được hỗ trợ.");
                        }

                        ISheet sheet = workbook.GetSheetAt(0); 

                        for (int row = 1; row <= sheet.LastRowNum; row++)
                        {
                            IRow excelRow = sheet.GetRow(row);
                            if (excelRow != null && excelRow.Cells.Any(cell => !string.IsNullOrEmpty(cell.ToString().Trim())))
                            {
                                bool hasEmptyCell = false;
                                for (int cellIndex = 0; cellIndex < 12; cellIndex++)
                                {
                                    ICell cell = excelRow.GetCell(cellIndex);
                                    if (cell == null || string.IsNullOrWhiteSpace(cell.ToString()))
                                    {
                                        hasEmptyCell = true;
                                        break;
                                    }
                                }
                                if (hasEmptyCell)
                                {
                                    // Hiển thị thông báo lỗi
                                    TempData["ErrorMessage"] = "Hàng thứ " + row + " không đủ dữ liệu. Vui lòng kiểm tra lại.";
                                    return Redirect("/quan-ly/cuu-sinh-vien/tao-moi");
                                }
                                DateTime? birthday = null;
                                string birthdayString = excelRow.GetCell(4).ToString();
                                if (!string.IsNullOrEmpty(birthdayString))
                                {
                                    
                                    string[] formats = { "dd/MM/yyyy", "d/M/yyyy", "dd/MM/yy" }; 
                                    if (DateTime.TryParseExact(birthdayString, formats, CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime tempBirthday))
                                    {
                                        birthday = tempBirthday;
                                    }
                                }
                                string major = excelRow.GetCell(9).ToString();
                                int graduationYear = Convert.ToInt32(excelRow.GetCell(10).NumericCellValue);
                                string typeOfTraining = excelRow.GetCell(11).ToString();
                                string academicLevel = excelRow.GetCell(12).ToString();
                                // Lấy GraduationInfoID dựa trên tên khóa học và năm tốt nghiệp
                                int graduationInfoID = GetGraduationInfoID(major, graduationYear);
                                Alumnus alumnus = new Alumnus
                                {
                                    IDAlumni = excelRow.GetCell(0).ToString(),
                                    Name = excelRow.GetCell(1).ToString(),
                                    Email = excelRow.GetCell(2).ToString(),
                                    Phone = excelRow.GetCell(3).ToString(),
                                    Birthday = (DateTime)birthday,
                                    Gender = excelRow.GetCell(5).ToString(),
                                    ProfilePicture = "Avata.jpg",
                                    Nationality = excelRow.GetCell(6).ToString(),
                                    HomeTown = excelRow.GetCell(7).ToString(),
                                    GraduationType = excelRow.GetCell(8).ToString(),
                                    GraduationInfoID = graduationInfoID,
                                    TypeOfTraining = excelRow.GetCell(11).ToString(),
                                    AcademicLevel = excelRow.GetCell(12).ToString(),
                                };
                                db.Alumni.Add(alumnus);
                            }
                        }
                        db.SaveChanges();
                    }

                    ViewBag.Message = "Import file Excel thành công.";
                }
                catch (Exception ex)
                {
                    ViewBag.Message = "Đã xảy ra lỗi: " + ex.Message;
                }
                finally
                {
                    // Xóa file Excel sau khi import
                    System.IO.File.Delete(excelFilePath);
                }
            }
            else
            {
                ViewBag.Message = "Vui lòng chọn một file Excel.";
            }
            TempData["SuccessMessage"] = "Thêm cựu sinh viên thành công";
            return Redirect("/quan-ly/cuu-sinh-vien");
        }
        private int GetGraduationInfoID(string major, int graduationYear)
        {
            var graduationInfo = db.GraduationInfoes.FirstOrDefault(g => g.Majors == major && g.GraduationYear == graduationYear);
            if (graduationInfo != null)
            {
                return graduationInfo.ID;
            }
            // Nếu không tìm thấy, trả về giá trị mặc định hoặc xử lý tùy ý của bạn
            return 0; // Hoặc trả về -1, null, hoặc một giá trị khác tùy vào yêu cầu của bạn
        }


    }
}

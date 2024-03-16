using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using TDTU_IT_alumni_management_system.Models;
using MailKit;
using MimeKit;
using MailKit.Security;
using MailKit.Net.Smtp;
using System.Net;
using System.Runtime.CompilerServices;
using OpenAI_API;
using OpenAI_API.Completions;
using Microsoft.Bot.Builder;
using System.Threading;
using System.Threading.Tasks;
using System.Web.WebPages;


namespace TDTU_IT_alumni_management_system.Controllers
{
    public class BotChatController : Controller
    {
        // GET: BotChat
        TDTUAlumnisManagementSystemEntities db = new TDTUAlumnisManagementSystemEntities();
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

        [HttpPost]
        public async Task<ActionResult> ResponseMsg(string prompt, int count)
        {
            if (prompt != "")
            {
                
                var result = await createMsg(prompt.ToLower());
                var uid = Session["UID"].ToString();

                var chatID = uid + "_" + db.ChatBots.Where(c => c.UsersName == uid).Count().ToString();
                var chat = new ChatBot
                {
                    IDBot = chatID,
                    UsersName = uid,
                    Prompt = prompt,
                    Result = result,
                    meta = ""
                };
                db.ChatBots.Add(chat);
                db.SaveChanges();
                return Json(new { success = true, message = prompt });



            }
            else
            {
                return Json(new { success = false, message = "Nội dung không hợp lệ"});
            }
            
        }
        public ActionResult ResponseMsgView()
        {
            var uid = Session["UID"].ToString();
            var chatList = db.ChatBots.Where(c => c.UsersName == uid).OrderByDescending(c => c.order).Take(50).OrderBy(c => c.order).ToList();
            return PartialView(chatList);

        }

        public async Task<string> createMsg(string message)
        {
            
            string replyText;
            /*Thông tin cựu học sinh*/
            if (message.StartsWith("thông tin sinh viên:"))
            {
                var id = message.Substring("thông tin sinh viên:".Length).Trim();
                var conText = string.Empty;
                if (id != null)
                {
                    if (id.ToString() == "52000092")
                    {
                        conText = "Phạm Nguyễn quá đẹp trai";
                        replyText = $"Thông tin về cựu học sinh sinh viên {id} như sau: ..." + conText;
                    }
                    else
                    {
                        replyText = getAlumnisToBot(id);
                    }
                    

                }
                else
                    replyText = "Mã số sinh viên không hợp lệ";
                
            }


            /*Thông tin doanh nghiệp*/
            else if (message.StartsWith("thông tin doanh nghiệp:"))
            {
                var id = message.Substring("thông tin doanh nghiệp:".Length).Trim().AsInt();
                if (id != null)
                {
                    var enter = db.Enterprises.Find(id);
                    replyText = $"Thông tin về doanh nghiệp mã số {id} như sau: Tên: {enter.EnterpriseName}, Số điện thoại: {enter.Phone}";
                }
                else
                    replyText = "Mã số doanh nghiệp không hợp lệ gõ lệnh 'danh sách doanh nghiệp' để rõ hơn";
            }

            /*Danh sách doanh nghiệp*/
            else if (message.StartsWith("danh sách doanh nghiệp:"))
            {
                var enterList = db.Enterprises.OrderBy(e => e.order).ToList();
                string companiesString = string.Empty ;
                foreach (var e in enterList)
                {
                    companiesString += $"Mã {e.IDEnterprise} : {e.EnterpriseName} // ";
                }
                replyText = "Danh sách doanh nghiệp bao gồm: " + companiesString;
            }

            /*Thông báo chung*/
            else if (message.StartsWith("thông báo chung:"))
            {
                var notiList = db.Notifies.OrderBy(n => n.order).ToList();
                string notiString = string.Empty;
                foreach (var n in notiList)
                {
                    notiString += $"Tiêu đề {n.Title}, Tóm tắt :{n.Description} // ";
                }
                replyText = "Thông báo chung gần đây: " + notiString;
            }


            /*Giao tiếp cơ bản*/
            else if (message.StartsWith("chào") || message.StartsWith("xin chào") || message.StartsWith("hi") || message.StartsWith("hello"))
            {

                replyText = "Chào bạn! Tôi là chatbot được tạo ra để hỗ trợ hệ thống TDTUAlumnis";
            }


            /*GPT*/
            else
            {
                try
                {
                    string api = "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";
                    var openai = new OpenAIAPI(api);
                    CompletionRequest completionRequest = new CompletionRequest();
                    completionRequest.Prompt = message;
                    completionRequest.Model = "gpt-3.5-turbo-instruct";
                    completionRequest.MaxTokens = 200;
                    completionRequest.Temperature = 0.3;

                    var response = await openai.Completions.CreateCompletionAsync(completionRequest);
                    replyText = response.ToString().Trim();
                }
                catch (Exception ex)
                {
                    replyText = $"Xin lỗi, có lỗi xảy ra khi tạo câu trả lời {ex.Message}";
                }
            }

            return replyText;
        }

        public string getAlumnisToBot(string id)
        {
            var alumnis = from g in db.GraduationInfoes
                    join a in db.Alumni on g.ID equals a.GraduationInfoID
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
                        Majors = g.Majors,
                        GraduationYear = g.GraduationYear,
                        meta = a.meta,
                        hide = (bool)a.hide,
                        order = (int)a.order,
                        datebegin = (DateTime)a.datebegin
                    };
            var alumni = alumnis.FirstOrDefault();
            return "Tên: " + alumni.Name + ", Email: " + alumni.Email +", Số điện thoại: "+ alumni.Phone +", Giới tính: " +alumni.Gender +", Ngành: " +alumni.Majors +", Năm tốt nhiệp: " +alumni.GraduationYear +
                ", Nơi làm việc hiện tại: "+ alumni.CurrentCompany + ", Nghề nghiệp: " + alumni.Profession +", Kĩ năng: "+ alumni.skill +", Quê quán: "+ alumni.HomeTown +", Quốc gia: "+ alumni.Nationality;
        }
    }
}
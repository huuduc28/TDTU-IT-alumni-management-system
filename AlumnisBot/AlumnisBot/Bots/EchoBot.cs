// Generated with Bot Builder V4 SDK Template for Visual Studio EchoBot v4.22.0

using Microsoft.Bot.Builder;
using Microsoft.Bot.Schema;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using OpenAI_API;
using System;
using OpenAI_API.Completions;
using Microsoft.Identity.Client;

namespace AlumnisBot.Bots
{
    public class EchoBot : ActivityHandler
    {
        protected override async Task OnMessageActivityAsync(ITurnContext<IMessageActivity> turnContext, CancellationToken cancellationToken)
        {
            var message = turnContext.Activity.Text.ToLower();
            string replyText;

            /*Thông tin cựu học sinh*/
            if (message.StartsWith("thông tin sinh viên"))
            {
                var id = message.Substring("thông tin sinh viên".Length).Trim();
                var conText =string.Empty;
                if (id != null && id.Length == 8)
                {
                    if (id.ToString() == "52000092")
                    {
                        conText = "Phạm Nguyễn quá đẹp trai";
                    }
                    else if (id.ToString() == "huuduc00")
                    {
                        conText = "Phạm Nguyễn quá đẹp trai";
                    }
                    replyText = $"Thông tin về cựu học sinh sinh viên {id} như sau: ..." + conText;

                }
                else
                    replyText = "Mã số sinh viên không hợp lệ";
                /*using (var db = new AlumniContext())
                {
                    var alumni = await db.Alumni.FindAsync(id);
                    if (alumni != null)
                    {
                        replyText = $"Thông tin về cựu học sinh sinh viên {id}: ..."; // Thay thế ... bằng thông tin thực sự từ đối tượng `alumni`
                    }
                    else
                    {
                        replyText = $"Không tìm thấy cựu học sinh sinh viên với mã số {id}.";
                    }
                }*/
            }


            /*Thông tin doanh nghiệp*/
            else if (message.StartsWith("thông tin doanh nghiệp")) {
                var id = message.Substring("thông tin doanh nghiệp".Length).Trim();
                if (id != null)
                {
                    replyText = $"Thông tin về cựu học sinh sinh viên {id} như sau: ...";
                }
                else
                    replyText = "Tên doanh nghiệp không hợp lệ gõ lệnh 'danh sách doanh nghiệp' để rõ hơn";
            }

            /*Danh sách doanh nghiệp*/
            else if (message.StartsWith("danh sách doanh nghiệp"))
            {
                string[] techCompanies = { "Microsoft", "Google", "Apple", "Amazon", "Facebook" };

                // Gộp các tên công ty lại thành một chuỗi, mỗi tên công ty trên một dòng riêng
                string companiesString = String.Join(Environment.NewLine, techCompanies);
                replyText = "Danh sách doanh nghiệp bao gồm: " + companiesString;
            }

            /*Thông báo chung*/
            else if (message.StartsWith("thông báo chung"))
            {
                replyText = "Thông báo chung gần đây: ";
            }

            /*Thông báo cá nhân*/
            else if (message.StartsWith("thông báo cá nhân"))
            {

                replyText = "Thông báo cá nhân gần đây";
            }


            /*Giao tiếp cơ bản*/
            else if (message.StartsWith("chào") || message.StartsWith("xin chào") || message.StartsWith("hi") || message.StartsWith("hello"))
            {

                replyText = "Chào bạn! Tôi là chatbot được tạo ra bởi Phạm Nguyễn siêu cấp vip pro";
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
                    completionRequest.Temperature = 0.2;

                    var response = await openai.Completions.CreateCompletionAsync(completionRequest);
                    replyText = response.ToString().Trim();
                }
                catch (Exception ex)
                {
                    replyText = $"Xin lỗi, có lỗi xảy ra khi tạo câu trả lời {ex.Message}";
                }
            }

            await turnContext.SendActivityAsync(MessageFactory.Text(replyText, replyText), cancellationToken);
        }

        protected override async Task OnMembersAddedAsync(IList<ChannelAccount> membersAdded, ITurnContext<IConversationUpdateActivity> turnContext, CancellationToken cancellationToken)
        {
            var welcomeText = "Chào cả nhà iu của kem!";
            foreach (var member in membersAdded)
            {
                if (member.Id != turnContext.Activity.Recipient.Id)
                {
                    await turnContext.SendActivityAsync(MessageFactory.Text(welcomeText, welcomeText), cancellationToken);
                }
            }
        }
    }
}

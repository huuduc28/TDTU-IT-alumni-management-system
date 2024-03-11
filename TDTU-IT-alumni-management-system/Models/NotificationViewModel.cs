using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDTU_IT_alumni_management_system.Models
{
    public class NotificationViewModel
    {
        public int IDNotify { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public bool TargetType { get; set; }
        public string IDSender { get; set; }
        public string Majors { get; set; }
        public int GraduationYear { get; set; }
        public string Meta { get; set; }
        public bool Hide { get; set; }
        public int Order { get; set; }
        public DateTime DateBegin { get; set; }
    }
}
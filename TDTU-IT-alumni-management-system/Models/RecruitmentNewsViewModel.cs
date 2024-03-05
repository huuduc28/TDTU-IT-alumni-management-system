using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDTU_IT_alumni_management_system.Models
{
    public class RecruitmentNewsViewModel
    {
        public string IDRecruitmentNew { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string IDEnterprise { get; set; }
        public string ImgLogo { get; set; }
        public string Meta { get; set; } 
        public bool Hide { get; set; } 
        public int Order { get; set; } 
        public DateTime DateBegin { get; set; } 
    }
}
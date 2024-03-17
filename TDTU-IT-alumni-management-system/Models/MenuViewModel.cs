using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDTU_IT_alumni_management_system.Models
{
    public class MenuViewModel
    {
        public int ID { get; set; } // Hoặc MenuID
        public string Title { get; set; }
        public string ParentName { get; set; }
        public bool HasChild { get; set; }
        public string Meta { get; set; }
        public bool Hide { get; set; }
        public int Order { get; set; }
        public DateTime DateBegin { get; set; }
    }
}
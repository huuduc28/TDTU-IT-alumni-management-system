//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TDTU_IT_alumni_management_system.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class RecruitmentNew
    {
        public string IDRecruitmentNews { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string ImgNews { get; set; }
        public string IDEnterprise { get; set; }
        public string meta { get; set; }
        public Nullable<bool> hide { get; set; }
        public Nullable<int> order { get; set; }
        public Nullable<System.DateTime> datebegin { get; set; }
    
        public virtual Enterprise Enterprise { get; set; }
    }
}

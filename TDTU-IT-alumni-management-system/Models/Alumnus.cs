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
    
    public partial class Alumnus
    {
        public string IDAlumni { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public System.DateTime Birthday { get; set; }
        public string Gender { get; set; }
        public string ProfilePicture { get; set; }
        public string Nationality { get; set; }
        public string HomeTown { get; set; }
        public string PersonalWebsite { get; set; }
        public string skill { get; set; }
        public string GraduationType { get; set; }
        public int GraduationInfoID { get; set; }
        public string CurrentCompany { get; set; }
        public string AcademicLevel { get; set; }
        public string Profession { get; set; }
        public System.DateTime jobBeginDate { get; set; }
        public Nullable<byte> role { get; set; }
        public string Password { get; set; }
        public string meta { get; set; }
        public Nullable<bool> hide { get; set; }
        public Nullable<int> order { get; set; }
        public Nullable<System.DateTime> datebegin { get; set; }
    
        public virtual GraduationInfo GraduationInfo { get; set; }
    }
}

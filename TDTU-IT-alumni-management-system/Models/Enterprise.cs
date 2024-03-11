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
    
    public partial class Enterprise
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Enterprise()
        {
            this.RecruitmentNews = new HashSet<RecruitmentNew>();
        }
    
        public string IDEnterprise { get; set; }
        public string EnterpriseName { get; set; }
        public string EnterpriseAddress { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Website { get; set; }
        public string ImgLogo { get; set; }
        public string meta { get; set; }
        public Nullable<bool> hide { get; set; }
        public Nullable<int> order { get; set; }
        public Nullable<System.DateTime> datebegin { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RecruitmentNew> RecruitmentNews { get; set; }
    }
}

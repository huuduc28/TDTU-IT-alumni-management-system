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
    
    public partial class GraduationInfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public GraduationInfo()
        {
            this.Alumni = new HashSet<Alumnus>();
            this.Notifies = new HashSet<Notify>();
        }
    
        public int ID { get; set; }
        public string Majors { get; set; }
        public int GraduationYear { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Alumnus> Alumni { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Notify> Notifies { get; set; }
    }
}

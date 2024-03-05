namespace TDTU_IT_alumni_management_system.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Alumnus
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Alumnus()
        {
            Notifies = new HashSet<Notify>();
        }

        [Key]
        [StringLength(15)]
        public string IDAlumni { get; set; }

        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [Required]
        [StringLength(15)]
        public string Phone { get; set; }

        [Column(TypeName = "date")]
        public DateTime Birthday { get; set; }

        [Required]
        [StringLength(10)]
        public string Gender { get; set; }

        [Required]
        [StringLength(50)]
        public string Nationality { get; set; }

        [Required]
        [StringLength(50)]
        public string HomeTown { get; set; }

        [StringLength(50)]
        public string PersonalWebsite { get; set; }

        [Required]
        [StringLength(50)]
        public string GraduationType { get; set; }

        [Required]
        [StringLength(50)]
        public string Majors { get; set; }

        public int GraduationYear { get; set; }

        [Required]
        [StringLength(50)]
        public string CurrentCompany { get; set; }

        [Required]
        [StringLength(50)]
        public string AcademicLevel { get; set; }

        [Column(TypeName = "date")]
        public DateTime TimeToCompletionOfThesisDefense { get; set; }

        [StringLength(50)]
        public string UsersName { get; set; }

        [Column(TypeName = "date")]
        public DateTime jobBeginDate { get; set; }

        [Required]
        [StringLength(100)]
        public string skill { get; set; }

        [StringLength(50)]
        public string meta { get; set; }

        public bool? hide { get; set; }

        public int? order { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? datebegin { get; set; }

        public virtual User User { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Notify> Notifies { get; set; }
    }
}

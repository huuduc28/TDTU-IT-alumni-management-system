namespace TDTU_IT_alumni_management_system.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Enterprise")]
    public partial class Enterprise
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Enterprise()
        {
            RecruitmentNews = new HashSet<RecruitmentNew>();
        }

        [Key]
        [StringLength(15)]
        public string IDEnterprise { get; set; }

        [Required]
        [StringLength(50)]
        public string EnterpriseName { get; set; }

        [Required]
        [StringLength(100)]
        public string EnterpriseAddress { get; set; }

        [Required]
        [StringLength(15)]
        public string Phone { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Website { get; set; }

        [StringLength(50)]
        public string meta { get; set; }

        public bool? hide { get; set; }

        public int? order { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? datebegin { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RecruitmentNew> RecruitmentNews { get; set; }
    }
}

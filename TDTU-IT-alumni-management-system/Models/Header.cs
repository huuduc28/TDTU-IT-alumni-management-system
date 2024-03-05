namespace TDTU_IT_alumni_management_system.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Header")]
    public partial class Header
    {
        [Key]
        [StringLength(15)]
        public string IDHeader { get; set; }

        [Required]
        [StringLength(100)]
        public string TieuDe { get; set; }

        [Required]
        [StringLength(100)]
        public string ImgLogo { get; set; }

        [StringLength(50)]
        public string meta { get; set; }

        public bool? hide { get; set; }

        public int? order { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? datebegin { get; set; }
    }
}

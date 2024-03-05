namespace TDTU_IT_alumni_management_system.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Notify")]
    public partial class Notify
    {
        [Key]
        [StringLength(15)]
        public string IDNotify { get; set; }

        [Required]
        [StringLength(100)]
        public string Title { get; set; }

        [Required]
        public string Content { get; set; }

        [StringLength(15)]
        public string IDSender { get; set; }

        [StringLength(15)]
        public string IDReceiver { get; set; }

        [StringLength(50)]
        public string meta { get; set; }

        public bool? hide { get; set; }

        public int? order { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? datebegin { get; set; }

        public virtual Admin Admin { get; set; }

        public virtual Alumnus Alumnus { get; set; }
    }
}

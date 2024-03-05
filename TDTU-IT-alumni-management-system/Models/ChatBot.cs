namespace TDTU_IT_alumni_management_system.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChatBot")]
    public partial class ChatBot
    {
        [Key]
        [StringLength(15)]
        public string IDBot { get; set; }

        [Required]
        public string Prompt { get; set; }

        [Required]
        public string Result { get; set; }

        [StringLength(50)]
        public string UsersName { get; set; }

        [StringLength(50)]
        public string meta { get; set; }

        public bool? hide { get; set; }

        public int? order { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? datebegin { get; set; }

        public virtual User User { get; set; }
    }
}

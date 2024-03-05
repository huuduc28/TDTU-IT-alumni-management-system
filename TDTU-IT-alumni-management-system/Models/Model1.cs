using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace TDTU_IT_alumni_management_system.Models
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Alumnus> Alumni { get; set; }
        public virtual DbSet<Banner> Banners { get; set; }
        public virtual DbSet<ChatBot> ChatBots { get; set; }
        public virtual DbSet<Enterprise> Enterprises { get; set; }
        public virtual DbSet<Header> Headers { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<News> News { get; set; }
        public virtual DbSet<Notify> Notifies { get; set; }
        public virtual DbSet<RecruitmentNew> RecruitmentNews { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin>()
                .HasMany(e => e.Notifies)
                .WithOptional(e => e.Admin)
                .HasForeignKey(e => e.IDSender);

            modelBuilder.Entity<Alumnus>()
                .HasMany(e => e.Notifies)
                .WithOptional(e => e.Alumnus)
                .HasForeignKey(e => e.IDReceiver);

            modelBuilder.Entity<Enterprise>()
                .HasMany(e => e.RecruitmentNews)
                .WithRequired(e => e.Enterprise)
                .WillCascadeOnDelete(false);
        }
    }
}

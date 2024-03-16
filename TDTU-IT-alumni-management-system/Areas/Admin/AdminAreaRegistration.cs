using ImageProcessor.Processors;
using System;
using System.Web.Mvc;

namespace TDTU_IT_alumni_management_system.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                name: "Admin_default",
                url: "Admin/{controller}/{action}/{id}",
                defaults: new { controller = "Default", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            //trang chủ
            context.MapRoute(
                name: "Admin_default_no_controller",
                url: "quan-ly",
                defaults: new { controller = "Default", action = "Index" },
                namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            //quản lý tin tức
            context.MapRoute(
               name: "News",
               url: "quan-ly/tin-tuc",
               defaults: new { controller = "News", action = "Index" },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
               name: "CreateNews",
               url: "quan-ly/tin-tuc/tao-tin-tuc",
               defaults: new { controller = "News", action = "Create"},
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }

            );
            context.MapRoute(
               name: "EditNews",
               url: "quan-ly/tin-tuc/sua-tin-tuc/{id}",
               defaults: new { controller = "News", action = "Edit", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
               name: "DetailNews",
               url: "quan-ly/tin-tuc/chi-tiet/{id}",
               defaults: new { controller = "News", action = "Details", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            // quản lý thông báo
            context.MapRoute(
            name: "Notifi",
              url: "quan-ly/thong-bao",
              defaults: new { controller = "Notifies", action = "Index" },
              namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
              name: "CreateNotifies",
              url: "quan-ly/thong-bao/tao-thong-bao",
              defaults: new { controller = "Notifies", action = "Create" },
              namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
           );
            context.MapRoute(
               name: "EditNotifies",
               url: "quan-ly/thong-bao/sua-thong-bao/{id}",
               defaults: new { controller = "Notifies", action = "Edit", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
               name: "DetailNotifies",
               url: "quan-ly/thong-bao/chi-tiet/{id}",
               defaults: new { controller = "Notifies", action = "Details", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );

            //quản lý cựu sinh viên
            context.MapRoute(
                name: "Alumi",
                url: "quan-ly/cuu-sinh-vien",
                defaults: new { controller = "Alumni", action = "Index" },
                namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
                 name: "CreateAlumni",
                 url: "quan-ly/cuu-sinh-vien/tao-moi",
                 defaults: new { controller = "Alumni", action = "Create" },
                 namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
               name: "EditAlumni",
               url: "quan-ly/cuu-sinh-vien/chinh-sua/{id}",
               defaults: new { controller = "Alumni", action = "Edit", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }

            );
            context.MapRoute(
               name: "DetailAlumni",
               url: "quan-ly/cuu-sinh-vien/chi-tiet/{id}",
               defaults: new { controller = "Alumni", action = "Details", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );

            //quản lý quản trị viên
            context.MapRoute(
               name: "Adnin",
               url: "quan-ly/quan-tri-vien",
               defaults: new { controller = "Administrators", action = "Index" },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
                 name: "CreateAdministrators",
                 url: "quan-ly/quan-tri-vien/tao-moi",
                 defaults: new { controller = "Administrators", action = "Create" },
                 namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
               name: "EditAdministrators",
               url: "quan-ly/quan-tri-vien/chinh-sua/{id}",
               defaults: new { controller = "Administrators", action = "Edit", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }

            );
            context.MapRoute(
               name: "DetailAdministrators",
               url: "quan-ly/quan-tri-vien/chi-tiet/{id}",
               defaults: new { controller = "Administrators", action = "Details", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );

            //quản lý doanh nghiệp
            context.MapRoute(
              name: "Enterprises",
              url: "quan-ly/doanh-nghiep",
              defaults: new { controller = "Enterprises", action = "Index" },
              namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
           );
            context.MapRoute(
               name: "CreateEnterprises",
               url: "quan-ly/doanh-nghiep/tao-moi",
               defaults: new { controller = "Enterprises", action = "Create" },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
               name: "EditEnterprises",
               url: "quan-ly/doanh-nghiep/chinh-sua/{id}",
               defaults: new { controller = "Enterprises", action = "Edit", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
               name: "DetailEnterprises",
               url: "quan-ly/doanh-nghiep/chi-tiet/{id}",
               defaults: new { controller = "Enterprises", action = "Details", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );

            //quản lý tin tuyển dụng
            context.MapRoute(
                 name: "RecruitmentNews",
                 url: "quan-ly/tin-tuyen-dung",
                 defaults: new { controller = "RecruitmentNews", action = "Index" },
                 namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
               name: "CreateRecruitmentNews",
               url: "quan-ly/tin-tuyen-dung/tao-moi",
               defaults: new { controller = "RecruitmentNews", action = "Create" },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
               name: "EditRecruitmentNews",
               url: "quan-ly/tin-tuyen-dung/chinh-sua/{id}",
               defaults: new { controller = "RecruitmentNews", action = "Edit", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
               name: "DetailRecruitmentNews",
               url: "quan-ly/tin-tuyen-dung/chi-tiet/{id}",
               defaults: new { controller = "RecruitmentNews", action = "Details", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            //quản lý khóa học
            context.MapRoute(
                 name: "GraduationInfoes",
                 url: "quan-ly/khoa-hoc",
                 defaults: new { controller = "GraduationInfoes", action = "Index" },
                 namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
              name: "CreateGraduationInfoes",
              url: "quan-ly/khoa-hoc/tao-moi",
              defaults: new { controller = "GraduationInfoes", action = "Create" },
              namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
           );
            context.MapRoute(
               name: "EditGraduationInfoes",
               url: "quan-ly/khoa-hoc/chinh-sua/{id}",
               defaults: new { controller = "GraduationInfoes", action = "Edit", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            context.MapRoute(
               name: "DetailGraduationInfoes",
               url: "quan-ly/khoa-hoc/chi-tiet/{id}",
               defaults: new { controller = "GraduationInfoes", action = "Details", id = UrlParameter.Optional },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
            );
            //dang nhap
            context.MapRoute(
                name: "login",
                url: "quan-ly/dang-nhap",
                defaults: new { controller = "LoginAdmin", action = "Index" },
                namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
           );
            context.MapRoute(
               name: "Change",
               url: "quan-ly/quan-tri-vien/doi-mat-khau/{id}",
               defaults: new { controller = "LoginAdmin", action = "ChangePassword" },
            namespaces: new[] { "TDTU_IT_alumni_management_system.Areas.Admin.Controllers" }
          );

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace TDTU_IT_alumni_management_system
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "DangNhap",
                url: "dang-nhap",
                defaults: new { controller = "Login", action = "Index" },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
                name: "DoiMatKhau",
                url: "doi-mat-khau",
                defaults: new { controller = "Login", action = "ChangePassword" },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
                name: "tokenResetPassword",
                url: "quen-mat-khau",
                defaults: new { controller = "Login", action = "CheckTokenView" },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
                name: "chatbot",
                url: "bot-chat",
                defaults: new { controller = "BotChat", action = "Index" },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
                name: "CuuSinhVien",
                url: "cuu-sinh-vien",
                defaults: new { controller = "Alumnis", action = "Index" },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
                name: "ChiTietSinhVien",
                url: "cuu-sinh-vien/chi-tiet/{id}",
                defaults: new { controller = "Alumnis", action = "DetailAlumni" },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
              name: "Thongtincanhan",
              url: "thong-tin-ca-nhan/chi-tiet/{id}",
              defaults: new { controller = "Alumnis", action = "PersonInfo" },
          namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
               name: "EditProfile",
               url: "thong-tin-ca-nhan/chinh-sua/{id}",
               defaults: new { controller = "Alumnis", action = "Edit" },
               namespaces: new[] { "TDTU_IT_alumni_management_system.Controllers" }
            );

            routes.MapRoute(
                name: "DanhSachSinhVien",
                url: "cuu-sinh-vien/{majorKey}",
                defaults: new { controller = "Alumnis", action = "AlumniCategory" },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
               name: "DoanhNghiep",
               url: "doanh-nghiep",
               defaults: new { controller = "Enterprise", action = "Index" },
           namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
               name: "TuyenDung",
               url: "tin-tuyen-dung",
               defaults: new { controller = "Enterprise", action = "GetRecruitmentNewList" },
           namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
               name: "ThongBao",
               url: "thong-bao",
               defaults: new { controller = "Notify", action = "GetNofity" },
           namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
               name: "ThongBaoNhom",
               url: "thong-bao-nhom",
               defaults: new { controller = "Notify", action = "GetAllListNofityByMajors", id = UrlParameter.Optional },
           namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute("New", "{type}/{meta}/{id}",
              new { Controller = "New", action = "GetNewsDetal", id = UrlParameter.Optional },
              new RouteValueDictionary
              {
                    {"type","tin-tuc" }
              },
            namespaces: new[] {"TDTU-IT-alumni-management-system.Controllers" });


            routes.MapRoute("Nofity", "{type}/{meta}/{id}",
              new { Controller = "Notify", action = "GetNofityDetal", id = UrlParameter.Optional },
              new RouteValueDictionary
              {
                    {"type","thong-bao" }
              },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute("Recruitment", "{type}/{meta}/{id}",
              new { Controller = "Enterprise", action = "GetRecruitmentNewDetal", id = UrlParameter.Optional },
              new RouteValueDictionary
              {
                    {"type","tin-tuyen-dung" }
              },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute("Enterprise", "{type}/{meta}/{id}",
              new { Controller = "Enterprise", action = "EnterpriseRecruitmentBoard", id = UrlParameter.Optional },
              new RouteValueDictionary
              {
                    {"type","doanh-nghiep" }
              },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" }
            );
          
        }
    }
}

﻿using System;
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
                name: "DanhSachSinhVien",
                url: "cuu-sinh-vien/{majorKey}",
                defaults: new { controller = "Alumnis", action = "AlumniCategory" },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
               name: "DoanhNghiep",
               url: "doanh-nghiep",
               defaults: new { controller = "Enterprises", action = "Index" },
           namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
               name: "TuyenDung",
               url: "tin-tuyen-dung",
               defaults: new { controller = "Enterprises", action = "GetRecruitmentNewList" },
           namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
               name: "ThongBao",
               url: "thong-bao",
               defaults: new { controller = "Notify", action = "GetNofity" },
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
              new { Controller = "Enterprises", action = "GetRecruitmentNewDetal", id = UrlParameter.Optional },
              new RouteValueDictionary
              {
                    {"type","tin-tuyen-dung" }
              },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute("Enterprise", "{type}/{meta}/{id}",
              new { Controller = "Enterprises", action = "EnterpriseRecruitmentBoard", id = UrlParameter.Optional },
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

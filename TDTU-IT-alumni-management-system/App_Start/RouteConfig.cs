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
                name: "CuuSinhVien",
                url: "cuu-sinh-vien",
                defaults: new { controller = "Alumnis", action = "Index" },
            namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });

            routes.MapRoute(
               name: "DoanhNghiep",
               url: "doanh-nghiep",
               defaults: new { controller = "Enterprises", action = "Index" },
           namespaces: new[] { "TDTU-IT-alumni-management-system.Controllers" });


            routes.MapRoute("New", "{type}/{meta}/{id}",
              new { Controller = "New", action = "GetNewsDetal", id = UrlParameter.Optional },
              new RouteValueDictionary
              {
                    {"type","tin-tuc" }
              },
            namespaces: new[] {"TDTU-IT-alumni-management-system.Controllers" });
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
          
        }
    }
}

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
                defaults: new { controller = "Default", action = "Index", id = UrlParameter.Optional }
            );

            context.MapRoute(
                name: "Admin_default_no_controller",
                url: "Admin/",
                defaults: new { controller = "Default", action = "Index" },
                namespaces: new[] { "Tên_Namespace_Của_Controllers_Của_Bạn" }
            );
        }
    }
}
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
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new {controller ="Default",action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
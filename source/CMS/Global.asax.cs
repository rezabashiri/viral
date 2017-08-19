using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
 
using System.Web.DynamicData;
using System.Web.Routing;
namespace CMS
{
    public class Global : System.Web.HttpApplication
    {
 
        protected void Application_Start(object sender, EventArgs e)
        {

            //WebUtility.AppStart.EntityModelHelpers.RegisterEntityModel(global::TakhteFoolad.AppStart.DynamicDataConfig.TakhteFooldModel, new global::TakhteFoolad.Model.TakhteFooladEntities());
            //WebUtility.AppStart.ConfigRoutes.RegisterModelRoutes(RouteTable.Routes, global::TakhteFoolad.AppStart.DynamicDataConfig.TakhteFooldModel);
            WebUtility.AppStart.EntityModelHelpers.RegisterEntityModel(global::AccessManagementService.AppStart.DynamicDataConfig.AccessManagementModel, new global::AccessManagementService.Model.AccessEntities());
            WebUtility.AppStart.ConfigRoutes.RegisterModelRoutes(RouteTable.Routes, global::AccessManagementService.AppStart.DynamicDataConfig.AccessManagementModel);
            RegisterRoute(RouteTable.Routes);

            CMS.Config.Description = "وایرال می به عنوان اولین پلتفرم تبلیغات محیطی در ایران شروع به کار نموده است. این پلتفرم واسط بین تبلیغ گیرنده و تبلیغ دهنده می باشد";
            CMS.Config.KeyBoard = "وایرال_می,تبلیغات";
            CMS.Config.Title = "وایرال می ، پلتفرم تبلیغات محیطی";
        }

        private void RegisterRoute(RouteCollection rc)
        {
            rc.MapPageRoute("Home", "", "~/Pages/Default.aspx");
            //rc.MapPageRoute("locale", "fa/SearchMashahir", "~/TakhteFoolad/Pages/Mashahir.aspx");
            rc.MapPageRoute("admin", "admin", "~/LoginUser.aspx");
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["CustomerID"] = "";
        }



        void Application_BeginRequest(object sender, EventArgs e)
        {
           System.Threading.Thread.CurrentThread.CurrentCulture = new tkv.Utility.CultureHelpers().GetCulture();
        }

        
        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            global::AccessManagementService.Access.Login _login = new global::AccessManagementService.Access.Login();
            _login.LogOutUser(Session[global::AccessManagementService.Access.AccessControl.UserSesion] as global::AccessManagementService.Model.User);
        }

        protected void Application_End(object sender, EventArgs e)
        {
   
            
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS
{
    public partial class LoginUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginControl.OnLoggedIn += LoginControl_OnLoggedIn;


        }

        void LoginControl_OnLoggedIn(AccessManagementService.Model.User user)
        {
            CMSLogic.SessionHelpers.SetUser(user);
        }
    }
}
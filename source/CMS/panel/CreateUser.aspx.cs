using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS.Administrator
{
    public partial class CreateUser : System.Web.UI.Page
    {
   
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }
        [System.Web.Services.WebMethod]
        public static bool CheckPolicy(string value)
        {
            global::AccessManagementService.Access.Password _ps = new global::AccessManagementService.Access.Password();
            var en = CMS.CMSLogic.SessionHelpers.GetUser();
            var policy = _ps.CheckPasswordPlocies(value, en.DepartmentID ?? 0);
            return policy;
        }
      

 

    }
}
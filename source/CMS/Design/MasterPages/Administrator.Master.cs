using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS.Design.MasterPages
{
    public partial class Administrator : System.Web.UI.MasterPage
    {
        MyClass mc = new MyClass();
        DataTable dt = new DataTable();
        string sql = "";
        PersianCalendar pc = new PersianCalendar();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SiteTitle();
                //lblDate.Text = farsicalender();
                //TablesReapeter.DataSource = global::TakhteFoolad.AppStart.DynamicDataConfig.TakhteFooldModel.VisibleTables.Where(x => x.Scaffold == true).ToList();
                //TablesReapeter.DataBind();
                if (AccessManagementService.Access.AccessControl.IsValidAccessToRight("مجوز مدیریت کاربر"))
                {
                    UserRepeater.DataSource = global::AccessManagementService.AppStart.DynamicDataConfig.AccessManagementModel.VisibleTables.Where(x => x.Scaffold == true);
                    UserRepeater.DataBind();
                }

            }
        }
        public string Title
        {
            set
            {
                ViewState["Title"] = value;
            }

            get
            {
                return ViewState["Title"] as string;
            }
        }


        protected void SiteTitle()
        {
            try
            {
                sql = "select SiteTopic from TCustomers where CustomerID=" + MyClass.CustomerId;
                mc.connect();
                string title = mc.docommandScalar(sql).ToString();
                mc.disconnect();
                //  lblTitle.Text = title;
                ViewState["Title"] = title;
            }
            catch (Exception)
            {
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            global::AccessManagementService.Access.Login _login = new global::AccessManagementService.Access.Login();
            _login.LogOutUser(Session[global::AccessManagementService.Access.AccessControl.UserSesion] as global::AccessManagementService.Model.User);
            _login.RemoveSessions();
        }
    }
}
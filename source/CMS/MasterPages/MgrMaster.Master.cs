using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

namespace CMS.masterpages
{
    public partial class MgrMaster : System.Web.UI.MasterPage
    {
        MyClass mc = new MyClass();
        DataTable dt = new DataTable();
        string sql = "";
        PersianCalendar pc = new PersianCalendar();
        public int Customer()
        {
            return MyClass.CustomerId;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SiteTitle();
                //lblDate.Text = farsicalender();
                //TablesReapeter.DataSource = global::TakhteFoolad.AppStart.DynamicDataConfig.TakhteFooldModel.VisibleTables.Where(x => x.Scaffold == true).ToList();
                //TablesReapeter.DataBind();

                UserRepeater.DataSource = global::AccessManagementService.AppStart.DynamicDataConfig.AccessManagementModel.VisibleTables.Where(x => x.Scaffold == true);
                UserRepeater.DataBind();

                 
            }
        }
        protected void SiteTitle()
        {
            try
            {
                sql = "select SiteTopic from TCustomers where CustomerID=" + Customer();
                mc.connect();
                string title = mc.docommandScalar(sql).ToString();
                mc.disconnect();
                lblTitle.Text = title;
            }
            catch (Exception)
            {
            }
        }
        public string farsicalender()
        {
            string year = pc.GetYear(DateTime.Now).ToString();
            string m = pc.GetMonth(DateTime.Now).ToString();
            string day = pc.GetDayOfMonth(DateTime.Now).ToString();
            string dw = pc.GetDayOfWeek(DateTime.Now).ToString();
            pc.Equals(dw);
            string month = "";
            switch (m)
            {
                case "1":
                    month = "فروردین";
                    break;
                case "2":
                    month = "اردیبهشت";
                    break;
                case "3":
                    month = "خرداد";
                    break;
                case "4":
                    month = "تیر";
                    break;
                case "5":
                    month = "مرداد";
                    break;
                case "6":
                    month = "شهریور";
                    break;
                case "7":
                    month = "مهر";
                    break;
                case "8":
                    month = "آبان";
                    break;
                case "9":
                    month = "آذر";
                    break;
                case "10":
                    month = "دی";
                    break;
                case "11":
                    month = "بهمن";
                    break;
                case "12":
                    month = "اسفند";
                    break;
            }
            string DayOfWeek = "";
            switch (dw)
            {

                case "Saturday":
                    DayOfWeek = "شنبه";
                    break;
                case "Sunday":
                    DayOfWeek = "یکشنبه";
                    break;
                case "Monday":
                    DayOfWeek = "دوشنبه";
                    break;
                case "Tuesday":
                    DayOfWeek = "سه شنبه";
                    break;
                case "Wednesday":
                    DayOfWeek = "چهارشنبه";
                    break;
                case "Thursday":
                    DayOfWeek = "پنجشنبه";
                    break;
                case "Friday":
                    DayOfWeek = "جمعه";
                    break;

            }
            string date = @"{0} {1} {2} {3}";
            date = string.Format(date, DayOfWeek, day, month, year);
            return date;
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            global::AccessManagementService.Access.Login _login = new global::AccessManagementService.Access.Login();
            _login.LogOutUser(Session[global::AccessManagementService.Access.AccessControl.UserSesion] as global::AccessManagementService.Model.User);
            _login.RemoveSessions();
        }
    }
}
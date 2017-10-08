using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS.Viralme.Driver
{
    public partial class SelectCampain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(Helpers.ContextHelpers.GetCampainId().ToString()))
                {
                    //ListView1.DataSource = DataSource;
                    //ListView1.DataBind();
                }
                else
                {
                    //listview2
                }
            }
        }

        public string CreateLink(int id)
        {
            if (!string.IsNullOrEmpty(id.ToString()))
            {
                string link = string.Format("?{0}", Helpers.ContextHelpers.SetCampainId(id));
                return link;
            }
            return string.Empty;
        }

        protected void lnkbtnnext_Click(object sender, EventArgs e)
        {
            //CurrentPage += 1;
            //Uscshahidsearch.SearchShahid();
            // should call search button again
        }

        protected void lnkbtnPrev_Click(object sender, EventArgs e)
        {
            //CurrentPage -= 1;
            //Uscshahidsearch.SearchShahid();
            // should call search button again   
        }

        protected void pageview_PageIndexChanged(object sender, Telerik.Web.UI.RadDataPagerPageIndexChangeEventArgs e)
        {
        }

        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            //dataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        }
    }
}
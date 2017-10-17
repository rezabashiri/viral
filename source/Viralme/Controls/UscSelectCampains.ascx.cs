using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Viralme.Controls
{
    public partial class UscSelectCampains : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Model.Campaign showList = new Model.Campaign();

                //if (string.IsNullOrEmpty(Helpers.ContextHelper.GetCampainId().ToString()))
                //{
                ListView_showlistofcampain.DataSource = showList.GetOpenCampaigns(string.Empty);
                ListView_showlistofcampain.DataBind();
                //}
                //else
                //{
                //    //listview2
                //}
            }
        }



        protected void ListView_showlistofcampain_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            Model.Campaign showList = new Model.Campaign();
            List <Model.Campaign> DataSource = showList.GetOpenCampaigns(string.Empty);

            dataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            
            ListView_showlistofcampain.DataSource = DataSource;
            ListView_showlistofcampain.DataBind();
        }

        protected void ListView_showDetainlistofcampain_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Viralme.Controls
{
    public partial class UscSelectCampain : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Model.Campaign showList = new Model.Campaign();

                if (string.IsNullOrEmpty(Helpers.ContextHelper.GetCampainId().ToString()))
                {
                    ListView_showlistofcampain.DataSource = showList.GetOpenCampaigns(string.Empty);
                    ListView_showlistofcampain.DataBind();
                }
                else
                {
                    //listview2
                }
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS.Viralme
{
    public partial class ClientCalls : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static void SaveCampagin(string statics)
        {
            global::Viralme.Logic.CampainStatistics ca = new global::Viralme.Logic.CampainStatistics();
            ca = ca.DeserializeCampaginFromJson(statics);

            global::Viralme.Model.Campaign n = new global::Viralme.Model.Campaign();
            n.EndDate = DateTime.Now;
            n.ID = 2;
            n.Name = "te";
            n.Json_Statistics = ca.SerializeCampaginIntoJson();
            n.AddCampaign(n);
        }
    }
}
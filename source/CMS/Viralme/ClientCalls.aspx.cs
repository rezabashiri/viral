﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tkv.Utility;
namespace CMS.Viralme
{
    public partial class ClientCalls : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static void SaveCampagin(string statics,string name,string startdate,string duraion)
        {
            global::Viralme.Logic.CampainStatistics ca = new global::Viralme.Logic.CampainStatistics();
            global::Viralme.Model.Campaign camp = new global::Viralme.Model.Campaign();
            
            var dc = new tkv.Utility.DateConversion();
            var date = dc.converttomiladi(startdate);
            var enddate = date.AddMonths(duraion.ToInt32());
            camp.StartDate = date;
            camp.EndDate = enddate;
            camp.UserID = AccessManagementService.Access.AccessControl.LoggedInUser.ID;
            camp.Name = name;
            camp.Json_Statistics = statics;
            camp.AddCampaign(camp);
        }
    }
}
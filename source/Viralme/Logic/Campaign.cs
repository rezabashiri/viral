using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Viralme.Model
{
    public partial class Campaign
    {
        private class MetaData
        {
            public int ID { get; set; }
            public Nullable<int> UserID { get; set; }
            public string Name { get; set; }
            public Nullable<System.DateTime> StartDate { get; set; }
            public Nullable<System.DateTime> EndDate { get; set; }
            public string Json_Statistics { get; set; }
        }
        public int AddCampaign(Campaign newcamp)
        {
            using (var en = Helpers.ContextHelper.GetContext)
            {
                try
                {

                    en.Campaigns.Add(newcamp);
                    return en.SaveChanges();
                }
                catch (Exception ex)
                {
                    WebUtility.Helpers.LogHelpers.TakeALogWithTime(ex.Message);
                    return -1;
                }
            }
        }
        public List<Campaign> SearchOnCampaign(string whereCondition)
        {
            using (var en = Helpers.ContextHelper.GetContext)
            {
                try
                {


                    return en.SearchOnCampaign(whereCondition).ToList();
                }
                catch (Exception ex)
                {
                    WebUtility.Helpers.LogHelpers.TakeALogWithTime(ex.Message);
                    return null;
                }
            }
        }
        public List<Campaign> GetLoggedInUserCampaigns(string whereCondition)
        {
            int userid = AccessManagementService.Access.AccessControl.LoggedInUser.ID;
            string where = string.Format("UserID = {0} {1}", userid, string.IsNullOrEmpty(whereCondition) != true ? string.Format(" and {0}", whereCondition) : string.Empty);
            return SearchOnCampaign(where);
        }
        public List<Campaign> GetOpenCampaigns(string whereCondition)
        {
            DateTime allowed = DateTime.Now.AddDays(14);
            string where = string.Format("StartDate >= {0} {1}", allowed.ToShortDateString(), string.IsNullOrEmpty(whereCondition) != true ? string.Format(" and {0}", whereCondition) : string.Empty);
            return SearchOnCampaign(where);
        }
    }
}

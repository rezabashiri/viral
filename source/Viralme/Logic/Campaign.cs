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
            public string Json_PackagePrices { get; set; }
            public string Json_CampainArea { get; set; }
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
                    return -1;
                }
            }
        }
    }
}
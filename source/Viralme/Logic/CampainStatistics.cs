using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Viralme.Logic
{

    [Serializable]
    public class PackagePrice
    {
        int ID { get; set; }
        double MinPrice
        {
            get;
            set;
        }
        double MaxPrice
        {
            get;
            set;
        }
    }
    [Serializable]
    public class CampainStatistics
    {
 
        public CampainStatistics()
        {
            CampainArea = new List<PolyGon>();
            PackagePrices = new List<PackagePrice>();
        }
        public string Name
        {
            get;
            set;
        }
        public DateTime StartDate
        {
            get;
            set;
        }
        public DateTime EndDate
        {
            get;
            set;
        }
        public List<PackagePrice> PackagePrices
        {
            get;
            set;
        }
        public List<PolyGon> CampainArea
        {
            get;
            set;
        }
        public string SerializeIntoJson(CampainStatistics entity)
        {
            return new WebUtility.Helpers.JsonHelpers().SerializeToJson<CampainStatistics>(entity);
        }
        public CampainStatistics DeserializeFromJson(string jsonentity)
        {
            return new WebUtility.Helpers.JsonHelpers().DeserializeFromJson<CampainStatistics>(jsonentity);            
        }
    }
}
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
            DrivingTime = new List<string>();
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
        public List<string> DrivingTime
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
        public void AddPackagePrice(PackagePrice price)
        {
            PackagePrices.Add(price);
        }
        public void AddCampainArea(PolyGon polygon)
        {
            CampainArea.Add(polygon);
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
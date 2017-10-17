using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Viralme.Logic
{

    [Serializable]
    public class PackagePrice
    {
        public int ID { get; set; }
        public double MinPrice
        {
            get;
            set;
        }
        public double MaxPrice
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
            CampainArea = new List<Point>();
            PackagePrices = new List<PackagePrice>();
             
        }
 
        public List<PackagePrice> PackagePrices
        {
            get;
            set;
        }
        public List<Point> CampainArea
        {
            get;
            set;
        }
        public string SerializeCampaginIntoJson()
        {
            return new WebUtility.Helpers.JsonHelpers().SerializeToJson<CampainStatistics>(this);
        }
        public CampainStatistics DeserializeCampaginFromJson(string json)
        {
            return new WebUtility.Helpers.JsonHelpers().DeserializeFromJson<CampainStatistics>(json);
            
        }
        public void AddPackagePrice(PackagePrice price)
        {
            PackagePrices.Add(price);
        }
        public void AddCampainArea(List<Point> points)
        {
            CampainArea =points;
        }
        public string SerializePackagePriceIntoJson()
        {
            return new WebUtility.Helpers.JsonHelpers().SerializeToJson<List<PackagePrice>>(PackagePrices);
        }
        public List<PackagePrice> DeserializePackagePriceFromJson(string jsonePackagePrice)
        {
            PackagePrices =new WebUtility.Helpers.JsonHelpers().DeserializeFromJson<List<PackagePrice>>(jsonePackagePrice);
            return PackagePrices;
        }
        //public string SerializeCampaignEreaIntoJson()
        //{
        //    return new WebUtility.Helpers.JsonHelpers().SerializeToJson<PolyGon>(CampainArea);
        //}
        //public PolyGon DeserializeCampaignEreaFromJson(string jsoneCampaignErea)
        //{
        //    CampainArea =new WebUtility.Helpers.JsonHelpers().DeserializeFromJson<PolyGon>(jsoneCampaignErea);
        //    return CampainArea;
        //}
    }
}
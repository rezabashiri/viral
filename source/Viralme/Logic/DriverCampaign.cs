using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Viralme.Logic;
namespace Viralme.Model
{

    [MetadataType(typeof(MetaData))]
    [ScaffoldTable(false)]
    public partial class DriverCampaign
    {
      
        private class MetaData
        {
             public int DriverID { get; set; }
        public int CampaignID { get; set; }
        public Nullable<int> PackageID { get; set; }
        public Nullable<System.DateTime> JoinDate { get; set; }
        public string DrivingStatistics { get; set; }
        }
        public Driver Driver
        {
            get;
            set;
        }
        //public int? AddDriverDetail(DriverDetail detail)
        //{
        //    using (var en = Helpers.ContextHelper.GetContext)
        //    {
        //        if (detail.Driver == null )
        //            throw new Exception("set drvier's detail");
        //        return en.InsertInDriverDetail(detail.DriverID, detail.Driver.SerializeToJson(), detail.Car).FirstOrDefault();
        //    }
        //}
        //public int  UpdatedDriverDetail(DriverDetail detail)
        //{
        //    using (var en = Helpers.ContextHelper.GetContext)
        //    {
        //        return en.UpdateDriverDetail(detail.DriverID, detail.DrivingStatistics, detail.Car) ;
        //    }
        //}
        //public int DeleteDriverDetail(int driverID)
        //{
        //    using (var en = Helpers.ContextHelper.GetContext)
        //    {
        //        return en.DeleteDriverDetail(driverID);
        //    }
        //}
        public int JoinCampaign(DriverCampaign drivercampaign)
        {
            using (var en = Helpers.ContextHelper.GetContext)
            {
                try
                {
                    return en.JoinCampaign(drivercampaign.DriverID, drivercampaign.CampaignID, drivercampaign.PackageID, drivercampaign.JoinDate);
                }
                catch (Exception ex)
                {
                    WebUtility.Helpers.LogHelpers.TakeALogWithTime(ex.Message);
                    return -1;
                }
            }
        }
        public int JoinCampaign( )
        {
           return JoinCampaign(this);
        }
    }
}
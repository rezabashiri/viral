﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Viralme.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class viralmeEntities : DbContext
    {
        public viralmeEntities()
            : base("name=viralmeEntities")
        {
            this.Configuration.LazyLoadingEnabled = false;
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Package> Packages { get; set; }
        public virtual DbSet<PublicRequest> PublicRequests { get; set; }
        public virtual DbSet<Campaign> Campaigns { get; set; }
        public virtual DbSet<DriverCampaign> DriverCampaigns { get; set; }
    
        public virtual int DeleteDriverDetail(Nullable<int> driverID)
        {
            var driverIDParameter = driverID.HasValue ?
                new ObjectParameter("DriverID", driverID) :
                new ObjectParameter("DriverID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("DeleteDriverDetail", driverIDParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> InsertInDriverDetail(Nullable<int> driverID, string drivingStatistics, string car)
        {
            var driverIDParameter = driverID.HasValue ?
                new ObjectParameter("DriverID", driverID) :
                new ObjectParameter("DriverID", typeof(int));
    
            var drivingStatisticsParameter = drivingStatistics != null ?
                new ObjectParameter("DrivingStatistics", drivingStatistics) :
                new ObjectParameter("DrivingStatistics", typeof(string));
    
            var carParameter = car != null ?
                new ObjectParameter("Car", car) :
                new ObjectParameter("Car", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("InsertInDriverDetail", driverIDParameter, drivingStatisticsParameter, carParameter);
        }
    
        public virtual int UpdateDriverDetail(Nullable<int> driverID, string drivingStatistics, string car)
        {
            var driverIDParameter = driverID.HasValue ?
                new ObjectParameter("DriverID", driverID) :
                new ObjectParameter("DriverID", typeof(int));
    
            var drivingStatisticsParameter = drivingStatistics != null ?
                new ObjectParameter("DrivingStatistics", drivingStatistics) :
                new ObjectParameter("DrivingStatistics", typeof(string));
    
            var carParameter = car != null ?
                new ObjectParameter("Car", car) :
                new ObjectParameter("Car", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("UpdateDriverDetail", driverIDParameter, drivingStatisticsParameter, carParameter);
        }
    
        public virtual ObjectResult<Campaign> SearchOnCampaign(string whereParameters)
        {
            var whereParametersParameter = whereParameters != null ?
                new ObjectParameter("WhereParameters", whereParameters) :
                new ObjectParameter("WhereParameters", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Campaign>("SearchOnCampaign", whereParametersParameter);
        }
    
        public virtual ObjectResult<Campaign> SearchOnCampaign(string whereParameters, MergeOption mergeOption)
        {
            var whereParametersParameter = whereParameters != null ?
                new ObjectParameter("WhereParameters", whereParameters) :
                new ObjectParameter("WhereParameters", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Campaign>("SearchOnCampaign", mergeOption, whereParametersParameter);
        }
    
        public virtual int JoinCampaign(Nullable<int> driverID, Nullable<int> campaignID, Nullable<int> packageID, Nullable<System.DateTime> joinDate)
        {
            var driverIDParameter = driverID.HasValue ?
                new ObjectParameter("DriverID", driverID) :
                new ObjectParameter("DriverID", typeof(int));
    
            var campaignIDParameter = campaignID.HasValue ?
                new ObjectParameter("CampaignID", campaignID) :
                new ObjectParameter("CampaignID", typeof(int));
    
            var packageIDParameter = packageID.HasValue ?
                new ObjectParameter("PackageID", packageID) :
                new ObjectParameter("PackageID", typeof(int));
    
            var joinDateParameter = joinDate.HasValue ?
                new ObjectParameter("JoinDate", joinDate) :
                new ObjectParameter("JoinDate", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("JoinCampaign", driverIDParameter, campaignIDParameter, packageIDParameter, joinDateParameter);
        }
    }
}

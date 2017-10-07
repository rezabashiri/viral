using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace Viralme.Logic
{
    public class DrivingTime
    {
        public string Time
        {
            get;
            set;
        }
        public string Area
        {
            get;
            set;
        }
    }
    public class DriverPackage
    {
          int ID { get; set; }
          double Price
          {
              get;
              set;
          }
    }
    public class DrivingStatistics
    {
        public DrivingStatistics()
        {
            DirivingTimes = new List<DrivingTime>();
            PackagePrices = new List<DriverPackage>();
        }
        public string Car
        {
            get;
            set;
        }
        public List<DrivingTime> DirivingTimes
        {
            get;
            set;
        }
        public List<DriverPackage> PackagePrices
        {
            get;
            set;
        }
        public string SerializeIntoJson(DrivingStatistics entity)
        {
            return string.Empty;
        }
        public DrivingStatistics DeserializeFromJson(string jsonentity)
        {
            return this;
        }
    }
}
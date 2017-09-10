using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Viralme.Logic
{
    public class Driver
    {
        public Driver()
        {
            if (DrivingArea == null)
                DrivingArea = new List<Point>();
            if (DrivingDates == null)
                DrivingDates = new List<Enums.Date>();
        }
        [Display(Name="کد راننده")]
        public int DriverID
        {
            set;
            get;
        }
        [Display(Name="تاریخ شروع")]
        public string StartTime
        {
            get;
            set;
        }
        [Display(Name="تاریخ پایان")]
        public string EndTime
        {
            get;
            set;
        }
        [Display(Name="محدوده رانندگی")]
        public List<Point> DrivingArea
        {
            get;
            set;
        }
        [Display(Name="روزهای رانندگی")]
        public List<Logic.Enums.Date> DrivingDates
        { get; set; }

        public void AddDrivingArea(Point point)
        {
            DrivingArea.Add(point);
        }
        public void DeleteDrivingArea(Point point)
        {
            DrivingArea.Remove(point);
        }
        public void AddDrivingDates(Logic.Enums.Date date)
        {
            DrivingDates.Add(date);
        }
        /// <summary>
        /// serialize into json
        /// </summary>
        /// <param name="driver">entity to serialize</param>
        /// <returns></returns>
        public string SerializeToJson(Driver driver  )
        {
            return new WebUtility.Helpers.JsonHelpers().SerializeToJson<Driver>(driver);
        }
        public string SerializeToJson( )
        {
            return new WebUtility.Helpers.JsonHelpers().SerializeToJson<Driver>(this);
        }
 
        public Driver DeSerializeFromJson(string driverjson)
        {
            return new WebUtility.Helpers.JsonHelpers().DeserializeFromJson<Driver>(driverjson);
        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Viralme.Model;
using Viralme.Logic;
namespace Viralme.Helpers
{
    public class Interface
    {
        public static string ConnectionString
        {
            get
            {
                return new Model.viralmeEntities().Database.Connection.ConnectionString;
            }
        }
        public List<Package> GetPackages()
        {
            var pack = new Package();
            return pack.GetPackages();
        }
        public string SerializeDriverDetailToJson( Driver  driver)
        {
            return driver.SerializeToJson();
        }
        public Driver DeSerializeDriverDetailFromJson(string driverJson)
        {
            return new Driver().DeSerializeFromJson(driverJson); ;
        }
        //public int? AddDriverDetail(DriverDetail Driverdetail)
        //{
        //    DriverDetail driver = new DriverDetail();
        //    return driver.AddDriverDetail(Driverdetail);
        //}
        //public int UpdatedDriverDetail(DriverDetail detail)
        //{
        //    DriverDetail driver = new DriverDetail();
        //    return driver.UpdatedDriverDetail(detail);  
        //}
        //public int DeleteDriverDetail(int driverID)
        //{
        //    DriverDetail driver = new DriverDetail();
        //    return driver.DeleteDriverDetail(driverID);
        //}
    }
}
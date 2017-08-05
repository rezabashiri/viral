using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using tkv.Utility;
namespace CMS.CMSLogic
{
    public class Group
    {
        public int GrpID { get; set; }
        public Nullable<int> PartID { get; set; }
        public string GrpName { get; set; }
        public Nullable<int> StatID { get; set; }
        public Nullable<int> CustomerID { get; set; }
        public Nullable<int> root { get; set; }
        public Nullable<int> fatherID { get; set; }
        public Nullable<int> Removeable { get; set; }
    }
    public class TGroup
    {
        public static string TableGroupName
        {
            get
            {
                return "GrpName";
            }
        }
        public static string SlideShowGroupName
        {
            get
            {
                return "اسلایدشو";
            }
        }
        public static string UnderSliderGroupName
        {
            get
            {
                return "زیر اسلایدشو";
            }
        }
        public static string ServiceGroupName
        {
            get
            {
                return "ویژگی ها";
            }
        }
        public static string DownloadGroupName
        {
            get
            {
                return "دانلود نرم افزار";
            }
        }
        public static string BrandGroupName
        {
            get
            {
                return "مزایای شرکتها";
            }
        }
        public static string DriverGroupName
        {
            get
            {
                return "مزایای راننده ها";
            }
        }
        public static string ServicesGroupName
        {
            get
            {
                return "اسلایدر ویژگی ها";
            }
        }
        public static string UpperGalleryGroupName
        {
            get
            {
                return "بالای گالری";
            }
        }
        public static string EventsGroupName
        {
            get
            {
                return "رویدادها";
            }
        }
        public static string GalleryGroupName
        {
            get
            {
                return "گالری";
            }
        }
        public static string NewsGroupName
        {
            get
            {
                return "اخبار";
            }
        }
        public static string FooterGroupName
        {
            get
            {
                return "فوتر";
            }
        }

        public static string TopFooterGroupName
        {
            get
            {
                return "بالای فوتر";
            }
        }

        public static string BannerGroupName
        {
            get
            {
                return "بنر";
            }
        }
          public List<Group > SearchGroupByParameter(string Params)
          {
              CMSLogic.DateBaseHelprs _helper=new DateBaseHelprs();
              DataTable dt=_helper.GetGroupsByParameter(Params);
              List<Group> _groups=new List<Group>();
              if (dt != null)
              {
                  foreach(DataRow dr in dt.Rows)
                  {
                      int grpid = dr["GrpID"] != null ? dr["GrpID"].ToInt32() : -1;
                      _groups.Add(new Group() { GrpID = grpid, PartID = dr["PartID"] as int?, GrpName = dr["GrpName"] != null ? dr["GrpName"].ToString() : string.Empty, StatID = dr["StatID"] as int?, CustomerID = dr["CustomerID"] as int?, root = dr["root"] as int?, fatherID = dr["fatherID"] as int?, Removeable = dr["Removeable"] as int? });
                  }
              }
              return _groups;
          }
          public List<Group> SearchGroupByName(string Name)
          {

              string param = string.Format("{0} = N'{1}'", TableGroupName, Name);
              return SearchGroupByParameter(param);
          }
          public List<Group> SearchGroupByID(int? ID)
          {

              string param = string.Format("{0} ={1}", "GrpID", ID);
              return SearchGroupByParameter(param);
          }
          public List<Group> SearchGroupByFatherID(int? FatherID)
          {

              string param = string.Format("{0} ={1}", "fatherID", FatherID);
              return SearchGroupByParameter(param);
          }
    }
}
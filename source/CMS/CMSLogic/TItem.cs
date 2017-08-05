using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using tkv.Utility;
namespace CMS.CMSLogic
{
    [Serializable]
    [System.Xml.Serialization.XmlRoot("Item")]
    public class TItem:Ititem
    {

        public static string ItemImagePath
        {
            get
            {
                return "~/files/photoItems";
            }
        }
        public static string ItemFilePath
        {
            get
            {
                return "~/files/UploadFiles";
            }
        }
        public static string ItemImageServerPath
        {
            get
            {
                return HttpContext.Current.Server.MapPath(ItemImagePath);
            }
        }
        public static string ItemFileServerPath
        {
            get
            {
                return HttpContext.Current.Server.MapPath(ItemFilePath);
            }
        }
        public static string GetImageClientPath(object path)
        {
            if (path != null && path.GetType() != typeof(System.DBNull))
            {
                string pa = path.ToString();
                return pa.Remove(0, 1);
            }
            return string.Empty;
        }
  
        [System.Xml.Serialization.XmlElement(ElementName="Items")]
        public List<TItem> Titems
        {
            get;
            set;
        }
        public DataRow[] SelectSlideShow(DataTable dt)
        {

            return dt.Select(string.Format("GrpName='{0}'",TGroup. SlideShowGroupName));
        }
        public DataRow[] SelectGroup(string GroupName,DataTable dt)
        {
            return dt.Select(string.Format("{0}='{1}'",TGroup.TableGroupName ,GroupName));
        }

        public TItem SearchItem(string topnumber, string Params)
        {
            var data = new CMS.CMSLogic.DateBaseHelprs().GetItemsByparameter(topnumber,Params);
            Titems = new List<TItem>();
            if (data != null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    string itemid = dr["ItemID"] != null ? dr["ItemID"].ToString() : "-1";
                    Titems.Add(new TItem() { ItemID = itemid.ToInt32(), ItemTopic = dr["ItemTopic"] != null ? dr["ItemTopic"].ToString() : string.Empty, SummaryTxt = dr["SummaryTxt"] != null ? dr["SummaryTxt"].ToString() : string.Empty, BodyTxt = dr["BodyTxt"] != null ? dr["BodyTxt"].ToString() : string.Empty, FileURL = dr["FileURL"] != null ? dr["FileURL"].ToString() : string.Empty, InputDate = dr["InputDate"].ToDateTime(), ShowDate = dr["InputDate"].ToDateTime(), VisitCnt = dr["VisitCnt"] .ToInt32(), EventDate = dr["EventDate"].ToDateTime(), GrpID = dr["GrpID"].ToInt32(), GrpName = dr["GrpName"] != null ? dr["GrpName"].ToString() : string.Empty, PartID = dr["PartID"].ToInt32(), PartName = dr["PartName"] != null ? dr["PartName"].ToString() : string.Empty,PhotoPath = dr["PhotoPath"] != null ? dr["PhotoPath"].ToString():string.Empty, PhotoName = dr["PhotoName"] != null ? dr["PhotoName"].ToString() : string.Empty });
                }
         
            }
            return this;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "ItemID")]
        public int ItemID
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "ItemTopic")]

        public string ItemTopic
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "PhotoName")]

        public string PhotoName
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "SummaryTxt")]

        public string SummaryTxt
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "BodyTxt")]

        public string BodyTxt
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "FileURL")]

        public string FileURL
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "InputDate")]

        public DateTime? InputDate
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "ShowDate")]

        public DateTime? ShowDate
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "FreshStat")]

        public int? FreshStat
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "CommentStat")]

        public int? CommentStat
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "VisitCnt")]

        public int? VisitCnt
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "EventDate")]

        public DateTime? EventDate
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "PubStat")]

        public int? PubStat
        {
            get;
            set;
        }

        public int GrpID
        {
            get;
            set;
        }

        public string GrpName
        {
            get;
            set;
        }

        public int? StatID
        {
            get;
            set;
        }

        public int? CustomerID
        {
            get;
            set;
        }

        public int? root
        {
            get;
            set;
        }

        public int? fatherID
        {
            get;
            set;
        }

        public int? Removeable
        {
            get;
            set;
        }

        public string PartName
        {
            get;
            set;
        }

        public int PartID
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement(ElementName = "PhotoPath")]

        public string PhotoPath
        {
            get;
            set;
        }

           [System.Xml.Serialization.XmlElement(ElementName = "ClientPhotoPath")]
        public string ClientPhotPath
        {
            get
            {
                if (!string.IsNullOrEmpty(PhotoPath))
                {
                    string cpath = PhotoPath.Remove(0, 1);
                    return cpath;
                }
                return string.Empty;
            }
          
        }
    }
}
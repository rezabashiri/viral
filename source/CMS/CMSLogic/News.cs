using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace CMS.CMSLogic
{
    [Serializable]
  
    public class News
    {
        [System.Xml.Serialization.XmlElement("id")]
        public string ID
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement("title")]
        public string Title
        {
            set;
            get;
        }
        [System.Xml.Serialization.XmlElement("imageurl")]
        public string Imageurle
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement("linkurl")]
        public string Linkurl
        {
            get;
            set;
        }
        [System.Xml.Serialization.XmlElement("summary")]
        public string Summary
        {
            get;
            set;
        }
 
  
    }
    [Serializable,System.Xml.Serialization.XmlRoot("newslist")]
  
    public class NewsList
    {
        public NewsList()
        {
            if (ListAll == null)
                ListAll = new List<News>();
        }
        [System.Xml.Serialization.XmlElement("news")]
        public List<News> ListAll
        {
            get;
            set;
        }

        [System.Xml.Serialization.XmlIgnore]
        public const string ImageUrl = "/files/photoItems/";
        [System.Xml.Serialization.XmlIgnore]
        public const string PageUrl = "/TakhteFoolad/Pages/PublicList.aspx";


        public List<News> AddToList(News _news)
        {

            if (!ListAll.Any(x => x.ID == _news.ID))
            {
                ListAll.Add(_news);
            }
            return ListAll;
        }
        public string Serialize()
        {
            var _helper =new tkv.Utility.XmlHelper();
            var _serial = _helper.SerializeEntity<NewsList>(this);
            return _serial;
        }
        public string JsonSerialize()
        {
            var _webutil =new WebUtility.Helpers.JsonHelpers();
            var _serialize = _webutil.SerializeToJson<NewsList>(this);
            return _serialize;
        }
        public void AddAllIntoList()
        {
            var data = new CMSLogic.DateBaseHelprs().GetItemsByparameter("100", string.Format("{0}=N'{1}'", TGroup.TableGroupName,TGroup.NewsGroupName));
            if (data != null)
            {
                foreach (DataRow dr in data.Rows)
                {
                    string itemid = dr["ItemID"] != null ? dr["ItemID"].ToString() : string.Empty;
                    AddToList(new News() { ID = itemid, Title = dr["ItemTopic"] != null ? dr["ItemTopic"].ToString() : string.Empty, Summary = dr["SummaryTxt"] != null ? dr["SummaryTxt"].ToString() : string.Empty, Imageurle = dr["PhotoName"] != null ? ImageUrl + dr["PhotoName"].ToString() : string.Empty, Linkurl = string.Format("{0}?{1}", PageUrl, CMS.CMSLogic.QueryStringHelpers.SetItemID ( itemid) ) });
                }
            }
        }
        public string AllItemsInXml(string partid)
        {
            AddAllIntoList();
            return Serialize();
        }
        public string AllItemsInJson(string partid)
        {
            AddAllIntoList();
            return JsonSerialize();

        }
    }
}
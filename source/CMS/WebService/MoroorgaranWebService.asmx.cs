using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using CMS.CMSLogic;
namespace CMS.WebService
{
    /// <summary>
    /// Summary description for MoroorgaranWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class MoroorgaranWebService : System.Web.Services.WebService
    {

        [WebMethod]
        public string SearchNewsInXML()
        {
            var list = new CMSLogic.NewsList();
            return list.AllItemsInXml("2");
        }

        [WebMethod]
        public string SearchNewsInJson()
        {
            var list = new CMSLogic.NewsList();
            return list.AllItemsInJson("2");
        }
        [WebMethod]
        public string GetGallery()
        {
            var logic = new TItem().SearchItem("500", string.Format("{0}=N'{1}'", TGroup.TableGroupName, TGroup.GalleryGroupName));
            var helper = new tkv.Utility.XmlHelper();
            var ser = helper.SerializeEntity<TItem>(logic);
            return ser ;
        }
        //[WebMethod]
       
        //public int AddOzv(string namefamily, string mobile, string email)
        //{
        //    var _int = new global::TakhteFoolad.Helpers.InterFace();
        //    return _int.AddOzviat(new global::TakhteFoolad.Model.Ozviat() {email=email,phone=mobile,NameFamily=namefamily });
        //}
    }
}

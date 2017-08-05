using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.DynamicData;

namespace Modiriat_Gharardadha.DynamicData.FieldTemplates
{
    public partial class PersianDate : System.Web.DynamicData.FieldTemplateUserControl
    {
    
        public string GetDate(string date)
        {
                return !string.IsNullOrEmpty(date) ? new tkv.Utility.DateConversion().ConvertoSolar(date) : string.Empty; 
        }
    }
}

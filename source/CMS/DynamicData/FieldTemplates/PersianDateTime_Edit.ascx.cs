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

namespace CMS.DynamicData.FieldTemplates
{
    public partial class PersianDateTime_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        
      
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = ucsDateTime.DateTime;
        }
        protected override void OnDataBinding(EventArgs e)
        {
             string selectedvalue = FieldValueEditString;
            if (!string.IsNullOrEmpty(selectedvalue))
            {
                DateTime con = new DateTime();
                if (DateTime.TryParse(selectedvalue, out con))
                {
                    ucsDateTime.DateTime = con;
                }
                else
                {
                    ucsDateTime.DateTime = DateTime.Now;

                }
            }
            else
            {
                ucsDateTime.DateTime = DateTime.Now;
            }

        }
        public override Control DataControl
        {
            get
            {
                return ucsDateTime;
            }
        }
    }
}

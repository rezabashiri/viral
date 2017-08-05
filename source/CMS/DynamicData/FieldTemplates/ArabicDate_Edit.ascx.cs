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
    public partial class ArabicDate_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DatePicker1.ToolTip = Column.Description;
            DatePicker1.DateFormat = JQControls.DateFormat.YMD;
            DatePicker1.YearRange = "500:1500";
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] =  DatePicker1.Date ;
        }

        public override Control DataControl
        {
            get
            {
                return DatePicker1;
            }
        }
        protected override void OnDataBinding(EventArgs e)
        {
            string selectedvalue = FieldValueEditString;
            if (!string.IsNullOrEmpty(selectedvalue))
            {
                DateTime con = new DateTime();
                if (DateTime.TryParse(selectedvalue, out con))
                {
                    DatePicker1.Date = con;
                }
                else
                {
                    DatePicker1.Date = DateTime.Now;

                }
            }
            else
            {
                DatePicker1.Date = DateTime.Now;
            }

        }
    }
}

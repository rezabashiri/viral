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
    public partial class GoogleMap : System.Web.DynamicData.FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get
            {
                return plhMap;
            }
        }
        public string X
        {
            get;
            set;
        }
        public string Y
        {
            get;
            set;
        }
        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            MetaColumn mc = Table.Columns.Where(x => x.Name == "X").FirstOrDefault();
            if (mc != null)
            {
                 object val = GetColumnValue(mc);
                 if (val != null)
                 {
                     X = val.ToString();
                 }
            }
            mc = Table.Columns.Where(x => x.Name == "Y").FirstOrDefault();
            if (mc != null)
            {
                object val = GetColumnValue(mc);
                if (val != null)
                {
                    Y = val.ToString();
                }
            }
        }
    }
}

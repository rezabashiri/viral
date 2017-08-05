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
    public partial class QRCode : System.Web.DynamicData.FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get
            {
                return Image1;
            }
        }
        public string GetImagePath(string val)
        {
            string url= string.Format("data:image/png;base64,{0}", val);
            return url;
        }
    }
}

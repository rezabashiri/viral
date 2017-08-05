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
    public partial class HtmlEdittor : System.Web.DynamicData.FieldTemplateUserControl
    {
        //protected override void OnDataBinding(EventArgs e)
        //{
        //    editor.Value = FieldValueString;
        //}
        public override Control DataControl
        {
            get
            {
                return editor;
            }
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CMS.Controls
{
    public partial class UscBoundedImageShow : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string CssClass
        {
            get;
            set;
        }
        public Control Container
        {
            get;
            set;
        }
        public string  Float
        {
            get;
            set;
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Viralme.Controls
{
    public partial class UscCampains : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dteStartDate.Date = DateTime.Now;

        }
       
    }
}
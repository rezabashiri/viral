using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CMS.CMSLogic;
namespace CMS.Controls
{
    public partial class UscFooterGenerator : System.Web.UI.UserControl
    {
        MyClass mc = new MyClass();
        DataTable dt = new DataTable();
        CMS.CMSLogic.TItem _item = new CMSLogic.TItem();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt = new CMSLogic.DateBaseHelprs().GetItemsByparameter("4", string.Format("{0} = N'{1}'",TGroup.TableGroupName,TGroup.FooterGroupName));
                FillFooter();
            }
        }
        private void FillFooter()
        {
            var rows = _item.SelectGroup(TGroup.FooterGroupName, dt);
            FooterRepeater.DataSource = mc.GetRowsDefaultView(rows, dt);
            FooterRepeater.DataBind();
        }
    }
}
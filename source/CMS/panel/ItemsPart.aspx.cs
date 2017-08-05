using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMS.CMSLogic;
namespace CMS.panel
{
    public partial class ItemsPart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        private void Rebind()
        {
           
            GridView1.DataBind();

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            TPart _tpart = new TPart();
            var res =  _tpart.Insert(new TPart() { PartName = txtName.Text });
            if (res > 0)
            {
                lblOK.Text = "اطلاعات با موفقی ثبت شد";
                Rebind();
            }
            else
                lblOK.Text = "خطا در ثبت اطلاعات";
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void partSource_Init(object sender, EventArgs e)
        {
            partSource.ConnectionString = MyClass.ConnectionString;
        }
    }
}
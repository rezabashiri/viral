using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CMS.panel
{
    public partial class menuitem : System.Web.UI.Page
    {
        MyClass mc = new MyClass();
        DataTable dt = new DataTable();
        string sql = "";
        public int Customer()
        {
            return MyClass.CustomerId;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                FirstGroup();
                BindGrv();
                GetItem();
                ViewState["Edit"] = 0;
                ViewState["Menufather"] = 0;
            }
        }

        protected void FirstGroup()
        {
            try
            {
                sql = "select count(*) from TMenu";
                sql = string.Format(sql, Customer());
                mc.connect();
                int itemNo = Convert.ToInt32(mc.docommandScalar(sql));
                if (itemNo == 0)
                {
                    string name = "صفحه نخست";
                    sql = "insert into TMenu (MenuTitle,LinkAddress,Root,FatherID,CustomerID) values (N'{0}',N'{1}',{2},{3},{4})";
                    sql = string.Format(sql, name, "/", 0, 0, Customer());
                    mc.docommand(sql);
                }
            }
            catch
            {

            }
            finally
            {
                mc.disconnect();
            }
        }
        public void GetItem()
        {
          
            drpItem.DataSource = new CMS.CMSLogic.DateBaseHelprs().GetItems();
            drpItem.DataBind();
        }
        protected void AddMenuItem()
        {
            int fatherID = Convert.ToInt32(ViewState["Menufather"]);
            int root = BackRoot(fatherID);
            sql = "insert into TMenu (MenuTitle,LinkAddress,Root,FatherID,CustomerID) values (N'{0}',N'{1}',{2},{3},{4})";
            sql = string.Format(sql, txtTopic.Text, txtAddress.Text, root, fatherID, Customer());
            mc.connect();
            mc.docommand(sql);
            mc.disconnect();
            BindGrv();
            errorDiv.Visible = false;
            confirmDiv.Visible = true;
            lblOk.Text = "منو جدید با موفقیت ایجاد گردید";
        }
        protected int BackRoot(int fatherID)
        {
            if (fatherID != 0)
            {
                sql = "select FatherID,Root from TMenu where MenuItemID=" + fatherID;
                mc.connect();
                dt = mc.select(sql);
                int fid = Convert.ToInt32(dt.Rows[0]["FatherID"]);
                mc.disconnect();
                if (fid == 0)
                    return 1;
                else
                {
                    int Lastroot = Convert.ToInt32(dt.Rows[0]["Root"]) + 1;
                    return Lastroot;
                }
            }
            else return 0;
        }

        protected void BindGrv()
        {
            //int fatherID = Convert.ToInt32(ViewState["Menufather"]);
            //sql = "SELECT        dbo.TMenu.MenuItemID, dbo.TMenu.MenuTitle, dbo.TMenu.LinkAddress, TMenu_1.MenuTitle AS FatherName "+
            //    " FROM            dbo.TMenu LEFT OUTER JOIN  dbo.TMenu AS TMenu_1 ON dbo.TMenu.FatherID = TMenu_1.MenuItemID "+
            //    " WHERE        (dbo.TMenu.CustomerID = {0}) AND (dbo.TMenu.FatherID = {1})";
            sql = "SELECT        dbo.TMenu.MenuItemID, dbo.TMenu.MenuTitle, dbo.TMenu.LinkAddress, TMenu_1.MenuTitle AS FatherName " +
              " FROM            dbo.TMenu LEFT OUTER JOIN  dbo.TMenu AS TMenu_1 ON dbo.TMenu.FatherID = TMenu_1.MenuItemID ";
            try
            {
                mc.connect();
                dt = mc.select(sql);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch
            {
            }
            finally
            {
                mc.disconnect();
            }
        }
        protected void EditMenuItem(int mnID)
        {
            sql = "update TMenu set MenuTitle=N'{0}',LinkAddress=N'{1}' where MenuItemID={2}";
            sql = string.Format(sql, txtTopic.Text, txtAddress.Text, mnID);
            mc.connect();
            mc.docommand(sql);
            mc.disconnect();
            errorDiv.Visible = false;
            confirmDiv.Visible = true;
            lblOk.Text = "مشخصات منو با موفقیت ویرایش گردید";
            BindGrv();
            btnOK.Text = "ثبت";
            ViewState["Edit"] = 0;
        }

        protected void Filling(int mnID, int type)
        {
            sql = "select MenuTitle,LinkAddress from TMenu where MenuItemID=" + mnID;
            mc.connect();
            dt = mc.select(sql);
            mc.disconnect();
            if (type == 1)
            {
                lblbranch.Text = dt.Rows[0]["MenuTitle"].ToString();
                errorDiv.Visible = false;
                confirmDiv.Visible = false;
            }
            else
            {
                txtTopic.Text = dt.Rows[0]["MenuTitle"].ToString();
                txtAddress.Text = dt.Rows[0]["LinkAddress"].ToString();
                btnOK.Text = "ویرایش";
                errorDiv.Visible = false;
                confirmDiv.Visible = false;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddSubC")
            {
                ViewState["Menufather"] = e.CommandArgument;
                //BindGrv();
                Filling(Convert.ToInt32(e.CommandArgument), 1);
            }
            if (e.CommandName == "EditC")
            {
                Filling(Convert.ToInt32(e.CommandArgument), 0);
                ViewState["Edit"] = e.CommandArgument;
            }
            if (e.CommandName == "DelC")
            {
                try
                {
                    sql = "select count(*) from TMenu where FatherID=" + e.CommandArgument;
                    mc.connect();
                    int cntChek = Convert.ToInt32(mc.docommandScalar(sql));
                    mc.disconnect();
                    if (cntChek == 0)
                    {
                        sql = "delete TMenu where MenuItemID=" + e.CommandArgument;
                        mc.connect();
                        mc.docommand(sql);
                        mc.disconnect();
                        errorDiv.Visible = false;
                        confirmDiv.Visible = true;
                        lblOk.Text = "شاخه مورد نظر از منو حذف گردید";
                        BindGrv();
                    }
                    else
                    {
                        confirmDiv.Visible = false;
                        errorDiv.Visible = true;
                        lblError.Text = "خطا 101: پیش تر زیرشاخه(هایی) برای این منو ایجاد شده اند بنابراین امکان حذف شاخه مورد نظر وجود ندارد";
                    }
                }
                catch (Exception)
                {
                    confirmDiv.Visible = false;
                    errorDiv.Visible = true;
                    lblError.Text = "حذف انجام نشد";
                }
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            try
            {
                int Mnid = Convert.ToInt32(ViewState["Edit"]);
                if (Mnid != 0)
                    EditMenuItem(Mnid);
                else AddMenuItem();
                txtTopic.Text = "";
                txtAddress.Text = "";
            }
            catch (Exception)
            {
                confirmDiv.Visible = false;
                errorDiv.Visible = true;
                lblError.Text = "خطا 100: عملیات انجام نشد، لطفا دوباره تلاش نمایید";
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ImageButton del = (ImageButton)e.Row.FindControl("imgbtnDel");
                del.Attributes.Add("onclick", "javascript:return " +
                "confirm('آیا از حذف شاخه مورد نظر از منو اطمینان دارید؟') ");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtTopic.Text = "";
            txtAddress.Text = "";
            ViewState["Edit"] = 0;
            ViewState["Menufather"] = 0;
            lblbranch.Text = "اصلی";
            btnOK.Text = "ثبت";
        }

        protected void drpItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(drpItem.SelectedValue))
            {
                string prefix = new tkv.Utility.WebConfigurationHelper().GetAppSettingValue("ItemPrefix");
                string url;
                if (!string.IsNullOrEmpty(prefix))
                    url = string.Format("{0}?{1}", prefix, CMS.CMSLogic.QueryStringHelpers.SetItemID(drpItem.SelectedValue));
                else
                    url = CMS.CMSLogic.QueryStringHelpers.SetItemID(drpItem.SelectedValue);
                txtAddress.Text = url;
            }
        }
    }
}
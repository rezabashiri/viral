using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using System.Text;

namespace CMS.panel
{
    public partial class CommentMgr : System.Web.UI.Page
    {
        MyClass mc = new MyClass();
        DataTable dt = new DataTable();
        string sql = "";
        int del = 1;
        public int Customer()
        {
            return MyClass.CustomerId;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckCustomer();
                BindDrpStat();
                Search();
            }
        }

        protected void CheckCustomer()
        {
            try
            {
                int CustomerID = Convert.ToInt32(Session["CustomerID"]);
                string sql = "select Count(*) from TCustomers where CustomerID={0} and Enable=1";
                sql = string.Format(sql, CustomerID);
                mc.connect();
                int Cnt = Convert.ToInt32(mc.docommandScalar(sql));
                mc.disconnect();
                if (Cnt != 1)
                {
                    Session["CustomerID"] = "";
                    Response.Redirect("MgrLogin.aspx");
                }
            }
            catch (Exception)
            {
                Response.Redirect("MgrLogin.aspx");
            }
        }
        protected void BindDrpStat()
        {
            try
            {
                sql = "select StatID,StatName from TStat where StatGrp=7";
                mc.connect();
                dt = mc.select(sql);
                mc.disconnect();
                drpStat.DataSource = dt;
                drpStat.DataValueField = "StatID";
                drpStat.DataTextField = "StatName";
                drpStat.DataBind();

                drpStat.Items.Add("همه وضعیت ها");
                drpStat.Items.FindByText("همه وضعیت ها").Value = "0";
                drpStat.SelectedValue = "0";
            }
            catch (Exception)
            {
            }
        }
        protected void Search()
        {
            string ID = null;
            if (txtId.Text != "")
                ID = txtId.Text;

            string StatID = null;
            if (drpStat.SelectedValue != "0")
                StatID = drpStat.SelectedValue;

            mc.connect();
            dt = mc.SpComment(ID, StatID);
            mc.disconnect();

            lblCountCmt.Text = "( " + dt.Rows.Count.ToString() + " )";
            lstVCmt.DataSource = dt;
            lstVCmt.DataBind();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                Search();
            }
            catch (Exception)
            {
            }
        }
        protected void Activity(int stat)
        {
            StringBuilder ChlID = new StringBuilder();
            foreach (ListViewDataItem ItemRow in lstVCmt.Items)
            {
                CheckBox cb = (CheckBox)ItemRow.FindControl("chkselect");
                if (cb.Checked)
                {
                    Label lb = (Label)ItemRow.FindControl("lblCmtID");
                    ChlID.Append(lb.Text);
                    ChlID.Append(",");
                }
            }
            if (ChlID.ToString() != "")
            {
                sql = "update TComments set StatID={0} where CmtID in (select * from dbo.split(N'{1}',',')) ";
                sql = string.Format(sql, stat, ChlID);
                mc.connect();
                mc.docommand(sql);
                mc.disconnect();
                confirmDiv.Visible = true;
                errorDiv.Visible = false;
                lblOk.Text = "عملیات با موفقیت انجام شد";
                Search();
            }
            else
            {
                confirmDiv.Visible = false;
                errorDiv.Visible = true;
                lblError.Text = "هیچ موردی انتخاب نشده است";
            }
        }
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Activity(17);
        }
        protected void btnReject_Click(object sender, EventArgs e)
        {
            Activity(16);
        }
        protected void lstVCmt_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            del = 0;
            lstVCmt.EditIndex = e.NewEditIndex;
            Search();
        }
        protected void lstVCmt_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            try
            {
                Label lblcmtID = (lstVCmt.Items[e.ItemIndex].FindControl("lblCmtID")) as Label;
                TextBox txtCmtBody = (lstVCmt.Items[e.ItemIndex].FindControl("txtComment")) as TextBox;
                TextBox txtEmail = (lstVCmt.Items[e.ItemIndex].FindControl("txtEmailWriter")) as TextBox;
                TextBox txtName = (lstVCmt.Items[e.ItemIndex].FindControl("txtWriter")) as TextBox;

                int CmtID = Convert.ToInt32(lblcmtID.Text);
                string BodyCmt = txtCmtBody.Text;
                string EmailWriter = txtEmail.Text;
                string NameWriter = txtName.Text;
                sql = "update TComments set CmtTxt=N'{0}',WrittenBy=N'{1}',WriterEmail=N'{2}' where CmtID={3}";
                sql = string.Format(sql, BodyCmt, NameWriter, EmailWriter, CmtID);
                mc.connect();
                mc.docommand(sql);
                mc.disconnect();
                lstVCmt.EditIndex = -1;
                Search();
                Label lblmsg = (lstVCmt.Items[e.ItemIndex].FindControl("lblmsg")) as Label;
                lblmsg.ForeColor = System.Drawing.Color.Green;
                lblmsg.Text = "ویرایش با موفقیت انجام شد";
            }
            catch (Exception)
            {
                Label lblmsg = (lstVCmt.Items[e.ItemIndex].FindControl("lblmsg")) as Label;
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Text = "ویرایش دیدگاه انجام نشد، لطفا دوباره تلاش نمایید";
            }
        }
        protected void lstVCmt_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lstVCmt.EditIndex = -1;
            Search();
        }
        protected void lstVCmt_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            try
            {
                Label lblcmtID = (lstVCmt.Items[e.ItemIndex].FindControl("lblCmtID")) as Label;
                int CmtID = Convert.ToInt32(lblcmtID.Text);
                sql = "delete TComments where CmtID=" + CmtID;
                mc.connect();
                mc.docommand(sql);
                mc.disconnect();
                Search();
            }
            catch (Exception)
            {
            }
        }
        protected void lstVCmt_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem && del == 1)
            {
                Button delete = (Button)e.Item.FindControl("btnDelCmt");
                delete.Attributes.Add("onclick", "javascript:return " +
                "confirm('آیا از حذف دیدگاه مورد نظر اطمینان دارید؟') ");
            }
        }
        private void ToggleCheckState(bool checkState)
        {
            foreach (ListViewDataItem ItemRow in lstVCmt.Items)
            {
                CheckBox cb = (CheckBox)ItemRow.FindControl("chkselect");
                if (cb != null)
                    cb.Checked = checkState;
            }
        }
        protected void lnkbtnAll_Click(object sender, EventArgs e)
        {
            ToggleCheckState(true);
        }
        protected void lnkbtnNone_Click(object sender, EventArgs e)
        {
            ToggleCheckState(false);
        }
    }
}
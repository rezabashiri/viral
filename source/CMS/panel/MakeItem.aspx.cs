using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using tkv.Utility; 
public partial class panel_MakeItem : System.Web.UI.Page
{
    MyClass mc = new MyClass();
    DataTable dt = new DataTable();
    string sql = "";
    PersianCalendar pc = new PersianCalendar();
    public int Customer()
    {
        return MyClass.CustomerId;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Bind();
        }
    }

    private void Bind()
    {
        //FillTitle();
        BindGrp();
        BindFreshStat();
        BindCommentStat();
        BindPubStat();
        FillDate();
        FromGroupList();
        Session["Edit"] = 0;
        CheckEdit();
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
    protected void FromGroupList()
    {
        try
        {
            string grp = CMS.CMSLogic.QueryStringHelpers.GetGroupID() ;
            drpGrpNews.SelectedValue = grp;
        }
        catch (Exception)
        {
        }
    }
    protected void BindGrp()
    {
        sql = "SELECT     dbo.TGroups.GrpID, dbo.TGroups.GrpName, dbo.TParts.PartName,dbo.TParts.PartName + ' -- ' + dbo.TGroups.GrpName AS name " +
            " FROM         dbo.TGroups INNER JOIN " +
            " dbo.TParts ON dbo.TGroups.PartID = dbo.TParts.PartID " +
            " WHERE     (dbo.TGroups.CustomerID = {0}) AND (dbo.TGroups.StatID = {1})";
        sql = string.Format(sql, Customer(), 1);
        mc.connect();
        dt = mc.select(sql);
        mc.disconnect();
        drpGrpNews.DataSource = dt;
        drpGrpNews.DataValueField = "GrpID";
        drpGrpNews.DataTextField = "name";
        drpGrpNews.DataBind();
    }
    protected void BindFreshStat()
    {
        sql = "select StatID,StatName from TStat where StatGrp=2";
        mc.connect();
        dt = mc.select(sql);
        mc.disconnect();
        drpFreshStat.DataSource = dt;
        drpFreshStat.DataValueField = "StatID";
        drpFreshStat.DataTextField = "StatName";
        drpFreshStat.DataBind();
    }
    protected void BindCommentStat()
    {
        sql = "select StatID,StatName from TStat where StatGrp=3";
        mc.connect();
        dt = mc.select(sql);
        mc.disconnect();
        drpCommentStat.DataSource = dt;
        drpCommentStat.DataValueField = "StatID";
        drpCommentStat.DataTextField = "StatName";
        drpCommentStat.DataBind();
        drpCommentStat.SelectedValue = "7";
    }
    protected void BindPubStat()
    {
        sql = "select StatID,StatName from TStat where StatGrp=4";
        mc.connect();
        dt = mc.select(sql);
        mc.disconnect();
        drpPubStat.DataSource = dt;
        drpPubStat.DataValueField = "StatID";
        drpPubStat.DataTextField = "StatName";
        drpPubStat.DataBind();
    }
    protected void FillDate()
    {
        //txtYearPub.Text = pc.GetYear(DateTime.Now).ToString();
        //txtmonthPub.Text = pc.GetMonth(DateTime.Now).ToString();
        //txtDayPub.Text = pc.GetDayOfMonth(DateTime.Now).ToString();
        datPub.DateTime = DateTime.Now;
    }
    protected bool CheckImgSize()
    {
        if (AsyncFileUpload1.UploadedFiles.Count != 0)
        {
            long  size = AsyncFileUpload1.UploadedFiles[0].ContentLength;
            if (size <= 150000)
                return true;
            else return false;
        }
        else return true;
    }
    //protected bool CheckFileURL()
    //{
    //    int EditThis = Convert.ToInt32(Session["Edit"]);
    //    if (Part() == 2 && AsyncFileUpload2.FileName.Length != 0)
    //        return true;
    //    else if (Part() != 2)
    //        return true;
    //    else if (Part() == 2 && EditThis != 0)
    //        return true;
    //    else return false;
    //}
    public string RandomName()
    {
        Random rnd = new Random();
        string dateNow = mc.DateShamsi(DateTime.Now).Replace("/", "");
        string num = rnd.Next().ToString();
        return dateNow + num;
    }
    protected void AddEdit()
    {

        if (CheckImgSize())
        {
            try
            {
                int EditThis = Convert.ToInt32(Session["Edit"]);
                string photoName = "";
                string FileName = "-";
                if (EditThis != 0)
                {
                    photoName = Session["photo"].ToString();
                    FileName = Session["file"].ToString();
                }

                string topic = txtTopic.Text.Trim();
                int grp = Convert.ToInt32(drpGrpNews.SelectedValue);
                //image
                string ImgSaveLocation = "";
                if (AsyncFileUpload1.UploadedFiles.Count > 0)
                {
                    photoName = System.IO.Path.GetFileName(AsyncFileUpload1.UploadedFiles[0].FileName);
                    string format = photoName.Split('.').Last();
                    //photoName = RandomName() + "." + format;
                    
                    ImgSaveLocation = CMS.CMSLogic.TItem.ItemImageServerPath+ "\\" + photoName;
                    if (System.IO.File.Exists(ImgSaveLocation))
                    {
                        photoName = photoName.Insert(0, string.Format("{0}-",new Random().Next(500)));
                    }
                    ImgSaveLocation = CMS.CMSLogic.TItem.ItemImageServerPath + "\\" + photoName;
                    AsyncFileUpload1.UploadedFiles[0].SaveAs(ImgSaveLocation);
                }

                string summary = txtSummary.Text;
                string BodyTxt = editor.Text;

                //File
                string FileSaveLocation = "";
                if (AsyncFileUpload2.UploadedFiles.Count > 0)
                {
                    FileName = System.IO.Path.GetFileName(AsyncFileUpload2.UploadedFiles[0].FileName);
                    string format = FileName.Split('.').Last();
                    FileName = RandomName() + "." + format;
                    FileSaveLocation = CMS.CMSLogic.TItem.ItemFileServerPath + "\\" + FileName;
                    AsyncFileUpload2.UploadedFiles[0].SaveAs(FileSaveLocation);
                    FileName = CMS.CMSLogic.TItem.ItemFilePath + "/" + FileName; ;//we need save file url not just it's name
                }

                int FreshStat = Convert.ToInt32(drpFreshStat.SelectedValue);
                int CommentStat = Convert.ToInt32(drpCommentStat.SelectedValue);

                //int yearPub = Convert.ToInt32(txtYearPub.Text);
                //int monthPub = Convert.ToInt32(txtmonthPub.Text);
                //int dayPub = Convert.ToInt32(txtDayPub.Text);
                //int hourPub = Convert.ToInt32(TimeSelector1.Hour);
                //int MinPub = Convert.ToInt32(TimeSelector1.Minute);
                DateTime ShowDate = datPub.DateTime;
              //  DateTime dt = new DateTime(yearPub, monthPub, dayPub, hourPub, MinPub, 0, 0);
                int PubStat = Convert.ToInt32(drpPubStat.SelectedValue);

                string msg = "";
                if (EditThis == 0)
                {
                    sql = "insert into TItems (GrpID,ItemTopic,PhotoName,SummaryTxt,BodyTxt,FileURL,InputDate,ShowDate,FreshStat,CommentStat,PubStat,VisitCnt,EventDate,PhotoPath,AttachID) " +
                        " values ({0},N'{1}',N'{2}',N'{3}',N'{4}','{5}','{6}','{7}',{8},{9},{10},0,'{11}',N'{12}','{13}')";
                    msg = "مطلب جدید با موفقیت ثبت گردید";
                }
                else if (EditThis != 0)
                {
                    sql = "update TItems set GrpID={0},ItemTopic=N'{1}',PhotoName=N'{2}',SummaryTxt=N'{3}',BodyTxt=N'{4}' " +
                    " ,FileURL='{5}',InputDate='{6}',ShowDate='{7}',FreshStat={8},CommentStat={9},PubStat={10},EventDate='{11}',PhotoPath=N'{12}',AttachID='{13}' where ItemId=" + EditThis;
                    msg = "مطلب با موفقیت ویرایش گردید";
                }
                sql = string.Format(sql, grp, topic, photoName, summary, BodyTxt.Replace("'","''"), FileName, DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"), ShowDate.ToString("yyyy/MM/dd HH:mm:ss"), FreshStat, CommentStat, PubStat, ucsDateTime.DateTime.ToString("yyyy/MM/dd HH:mm:ss"),string.Format("{0}/{1}",CMS.CMSLogic.TItem.ItemImagePath,photoName),uscUpload.AttachId ?? Guid.NewGuid());
                mc.connect();
                mc.docommand(sql);

                if (EditThis == 0)
                {
                    cleaner();  // just in insert mode
                }
                errorDiv.Visible = false;
                confirmDiv.Visible = true;
                lblOk.Text = msg;
                msg = string.Empty;
                Bind(); 
            }
            catch (Exception ex)
            {
                var mes = tkv.Utility.ExceptionHandel.HandelSqlException(ex);
                tkv.Utility.Log _log = new Log();
                _log.TakeLogWithPersian(mes.MessaeContent, Server.MapPath("~/log.txt"));
                lblOk.Text = mes.MessaeContent;
            }
            finally
            {  
                mc.disconnect();
            }

        }
        else if (!CheckImgSize())
        {
            confirmDiv.Visible = false;
            errorDiv.Visible = true;
            lblError.Text = "خطا 102: حداکثر حجم تصویر 150 کیلو بایت می باشد ";
        }
        else
        {
            confirmDiv.Visible = false;
            errorDiv.Visible = true;
            lblError.Text = "خظا 103: لطفا فایل مورد نظر را جهت دانلود از طریق گزینه Choose File انتخاب نمایید";
        }
    }
    protected void cleaner()
    {
        txtTopic.Text = "";
        txtSummary.Text = "";
        editor.Text = "";
        FillDate();
        Session["Edit"] = 0;
        DivPhoto.Visible = false;
        DivExFile.Visible = false;
        btnSubmit.Text = "درج مطلب";
        lblFile.Text = "فایل جهت دانلود:";
        lblPhoto.Text = "تصویر مطلب:";
    }
    protected void CheckEdit()
    {
        try
        {
            int itemID = CMS.CMSLogic.QueryStringHelpers.GetItemId().ToInt32();
            if (itemID == int.MinValue)
                return;
            sql = "select * from TItems where ItemID=" + itemID;
            mc.connect();
            dt = mc.select(sql);
            mc.disconnect();
            if (dt.Rows.Count == 0)
                return;
            txtTopic.Text = dt.Rows[0]["ItemTopic"].ToString();
            drpGrpNews.SelectedValue = dt.Rows[0]["GrpID"].ToString();

            DivPhoto.Visible = true;
            string photoName = dt.Rows[0]["PhotoName"].ToString();
            Session["photo"] = photoName;
            imgItem.ImageUrl = "..\\files\\photoItems\\" + photoName;
            lblPhoto.Text = "تصویر جایگزین:";

            txtSummary.Text = dt.Rows[0]["SummaryTxt"].ToString();
            editor.Text = dt.Rows[0]["BodyTxt"].ToString();

            string fName = dt.Rows[0]["FileURL"].ToString();
            Session["file"] = fName;

            lnkBtnExFile.Text = fName;
            lblFile.Text = "فایل جایگزین:";

            drpFreshStat.SelectedValue = dt.Rows[0]["FreshStat"].ToString();
            drpCommentStat.SelectedValue = dt.Rows[0]["CommentStat"].ToString();
            drpPubStat.SelectedValue = dt.Rows[0]["PubStat"].ToString();

            DateTime ShDate = Convert.ToDateTime(dt.Rows[0]["ShowDate"]);
            //txtYearPub.Text = pc.GetYear(ShDate).ToString();
            //txtmonthPub.Text = pc.GetMonth(ShDate).ToString();
            //txtDayPub.Text = pc.GetDayOfMonth(ShDate).ToString();
            datPub.DateTime = ShDate;
            //TimeSelector1.Hour = pc.GetHour(ShDate);
            //TimeSelector1.Minute = pc.GetMinute(ShDate);
            ucsDateTime.DateTime = dt.Rows[0]["EventDate"].ToDateTime();
            uscUpload.AttachId = dt.Rows[0]["AttachID"] as Nullable< Guid>;
            btnSubmit.Text = "ویرایش مطلب";
            Session["Edit"] = itemID;
            errorDiv.Visible = false;
            confirmDiv.Visible = true;
            lblOk.Text = "اطلاعات فعلی مطلب را در زیر مشاهده می نمایید، در صورت نیاز آنها را ویرایش و دکمه ویرایش مطالب را کلیک نمایید.";
        }
        catch (Exception)
        {
        }
    }
    protected void lnkBtnExFile_Click(object sender, EventArgs e)
    {
        string filename = lnkBtnExFile.Text;
        string Path = "..\\files\\UploadFiles\\" + filename;
        if (Path != "")
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
            Response.WriteFile(Path);
            Response.End();
        }
        Response.Redirect(Path);
    }
    protected void btnSubmit_Click1(object sender, EventArgs e)
    {
        AddEdit();
    }
}
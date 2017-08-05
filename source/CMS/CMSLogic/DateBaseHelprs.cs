using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace CMS.CMSLogic
{
    public class DateBaseHelprs
    {
        public static string SqlInsertString
        {
            get
            {
                return "insert into {0} ({1}) values ({2})";
            }
        }
        public DataTable GetItemsByparameter(string topnumber,string Params)
        {
            
            MyClass mc = new MyClass();
            try
            {
                
                DataTable dt = new DataTable();
                string sql = string.Format("SELECT     TOP ({0})   ItemTopic,  PhotoName,  SummaryTxt, ItemID,  ShowDate,BodyTxt,GrpName ,PartID , DATEDIFF(day, GETDATE(), EventDate) as dayE, DATEDIFF(day, DATEPART(HOUR, GETDATE()), DATEPART(HOUR, EventDate)) as HourE , " +
" abs( DATEDIFF(day, DATEPART(minute, GETDATE()), DATEPART(minute, EventDate))) as minE ,EventDate ,PhotoPath,FileURL,InputDate,VisitCnt,GrpID,PartName,AttachID FROM  dbo.ViewItemPart " +
                            "WHERE FreshStat = 3 AND PubStat = 9 AND GETDATE() >= ShowDate  {1} " +
                            "ORDER BY  ShowDate DESC", topnumber, string.IsNullOrEmpty(Params) == false ? " and " + Params : string.Empty);
                mc.connect();
                dt = mc.select(sql);
                return dt;
            }
            catch (Exception ex)
            {
                var log = new tkv.Utility.Log();
                log.TakeLogWithPersian(ex.Message, HttpContext.Current.Server.MapPath("~/log.txt"));
                return null;
            }
            finally
            {
                mc.disconnect();    
            }
        }
        public DataTable GetItems( )
        {
            MyClass mc = new MyClass();
            try
            {

                DataTable dt = new DataTable();
                string sql = string.Format("select ItemID ,GrpID,ItemTopic,[PhotoName],[SummaryTxt],[BodyTxt],[FileURL],[InputDate],[ShowDate],[FreshStat],[CommentStat],[PubStat],[VisitCnt],[EventDate] FROM [dbo].[TItems] " +
                            " ORDER BY  ShowDate DESC");
                mc.connect();
                dt = mc.select(sql);
                return dt;
            }
            catch (Exception ex)
            {
                var log = new tkv.Utility.Log();
                log.TakeLogWithPersian(ex.Message, HttpContext.Current.Server.MapPath("~/log.txt"));
                return null;
            }
            finally
            {
                mc.disconnect();
            }
        }
        public DataTable GetGroupsByParameter(string Parameter)
        {
            MyClass mc = new MyClass();
            try
            {

                DataTable dt = new DataTable();
                string sql = string.Format("select * FROM [dbo].[TGroups] "  );
                if (!string.IsNullOrEmpty(Parameter))
                {
                    sql = sql + " where " + Parameter;
                }
                mc.connect();
                dt = mc.select(sql);
                return dt;
            }
            catch (Exception ex)
            {
                var log = new tkv.Utility.Log();
                log.TakeLogWithPersian(ex.Message, HttpContext.Current.Server.MapPath("~/log.txt"));
                return null;
            }
            finally
            {
                mc.disconnect();
            }
        }
    }
}
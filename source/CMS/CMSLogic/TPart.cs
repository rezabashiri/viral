using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace CMS.CMSLogic
{
    public class TPart
    {
        public int PartID
        {
            get;
            set;
        }
        public string PartName
        {
            get;
            set;
        }
        public int CustomerID
        {
            get;
            set;
        }
        public DataTable GetParts()
        {
            MyClass mc = new MyClass();
            try
            {
                DataTable dt = new DataTable();
                string sql = string.Format("select * from TParts where CustomerID={0}", CMSLogic.SessionHelpers.GetUser().ID);

                mc.connect();
                dt = mc.select(sql);
                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                mc.disconnect();
            }
        }
        public int Insert(TPart ent)
        {
            string sql = string.Format(DateBaseHelprs.SqlInsertString, "TParts", "PartName,CustomerID", string.Format("N'{0}',{1}", ent.PartName, CMSLogic.SessionHelpers.GetUser().ID));
            MyClass mc = new MyClass();
            try
            {
                mc.connect();
                return mc.docommand(sql);
            }
            catch (Exception ex)
            {
                return -1;
            }
            finally
            {
                mc.disconnect();
            }

        }
    }
}
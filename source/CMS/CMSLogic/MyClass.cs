using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.Security.Cryptography;
using System.IO;
using System.Data.SqlClient;
using System.Globalization;
using System.Collections.Generic;



/// <summary>
/// Summary description for MyClass
/// </summary>
public class MyClass
{

    PersianCalendar pc = new PersianCalendar();
    public string sql = "";

    public string server = "";
    public string database = "";
    public string user = "";
    public string pass = "";

    // CustomerID:

    // 1. saeed
    // 2. professor 
    // 3. -----


    public int dbID = 2;

    public void SpecifyingDB()
    {
        switch (dbID)
        {
            case 1:
                {
                    server = ".";
                    database = "GolestanShohada";
                    user = "sa";
                    pass = "1";
                } break;
            case 2:
                {
                    server = ".";
                    database = "GolestanShohada";
                    user = "sa";
                    pass = "946744";

                } break;
            case 3:
                {
                    server = ".";
                    database = "GolestanShohada";
                    user = "golestan";
                    pass = "golestan95";

                } break;
        }
    }

    public int GetCustomer()
    {
        int customerID = 1;
        return customerID;
    }

    SqlConnection cn;
    SqlCommand cm;
    SqlDataAdapter da;
    SqlDataAdapter daB;


    public MyClass()
    {
        cn = new SqlConnection();
        cm = new SqlCommand();
        da = new SqlDataAdapter();
        daB = new SqlDataAdapter();
        cm.Connection = cn;
        da.SelectCommand = cm;
        daB.SelectCommand = cm;
        SpecifyingDB();
    }


    public static string ConnectionString
    {
        get
        {
            return Viralme.Helpers.Interface.ConnectionString;
        }
    }
    public void connect()
    {
        cn.Close();
      
 
        cn.ConnectionString = ConnectionString;
        cn.Open();
    }

    public void disconnect()
    {
        cn.Close();
    }

    public DataTable select(string strsql)
    {
        DataTable dt = new DataTable();
        cm.CommandType = CommandType.Text;
        cm.CommandText = strsql;
        dt.Clear();
        da.Fill(dt);
        return dt;
    }

    public DataSet selectDataSet(string strsql)
    {
        DataSet ds = new DataSet();
        cm.CommandType = CommandType.Text;
        cm.CommandText = strsql;
        ds.Clear();
        da.Fill(ds);
        return ds;
    }

    public DataView vselect(string Sqlstr)
    {
        DataView dv = new DataView();
        DataSet ds = new DataSet();

        cm.CommandType = CommandType.Text;
        cm.CommandText = Sqlstr;
        da.Fill(ds);
        dv = ds.Tables[0].DefaultView;

        return dv;
    }

    public SqlDataReader DoCommanddr(string strsql)
    {
        cm.CommandText = strsql;
        SqlDataReader dr = cm.ExecuteReader();
        return dr;
    }

    public int docommand(string strsql)
    {
        cm.CommandText = strsql;
        return cm.ExecuteNonQuery();
    }


    public void docommandB(string strsql, DataTable dt)
    {
        daB.SelectCommand = new SqlCommand(strsql, cn);
        SqlCommandBuilder SQLcb = new SqlCommandBuilder(daB);
        daB.Update(dt);

    }

    public string docommandScalar(string strsql)
    {
        cm.CommandText = strsql;
        var ret = cm.ExecuteScalar();
        if (ret != null)
        {
            return ret.ToString();
        }
        else
            return string.Empty;
      
    }

    //-----------------------------------------------------------------


    public string DecryptText(string SourceString, string Key)
    {
        string text1;
        byte[] buffer1 = new byte[0];
        byte[] buffer3 = new byte[] { 0x12, 0x34, 0x56, 120, 0x90, 0xab, 0xcd, 0xef };
        byte[] buffer2 = new byte[SourceString.Length + 1];
        try
        {
            buffer1 = Encoding.UTF8.GetBytes(Key.Substring(0, 8));
            DESCryptoServiceProvider provider1 = new DESCryptoServiceProvider();
            buffer2 = Convert.FromBase64String(SourceString);
            MemoryStream stream2 = new MemoryStream();
            CryptoStream stream1 = new CryptoStream(stream2, provider1.CreateDecryptor(buffer1, buffer3), CryptoStreamMode.Write);
            stream1.Write(buffer2, 0, buffer2.Length);
            stream1.FlushFinalBlock();
            text1 = Encoding.UTF8.GetString(stream2.ToArray());
        }
        catch (Exception exception2)
        {
            Exception exception1 = exception2;
            text1 = exception1.Message;
        }
        return text1;
    }


    public string EncryptText(string SourceString, string Key)
    {
        string text1;
        byte[] buffer1 = new byte[0];
        byte[] buffer2 = new byte[] { 0x12, 0x34, 0x56, 120, 0x90, 0xab, 0xcd, 0xef };
        try
        {
            buffer1 = Encoding.UTF8.GetBytes(Key.Substring(0, 8));
            DESCryptoServiceProvider provider1 = new DESCryptoServiceProvider();
            byte[] buffer3 = Encoding.UTF8.GetBytes(SourceString);
            MemoryStream stream2 = new MemoryStream();
            CryptoStream stream1 = new CryptoStream(stream2, provider1.CreateEncryptor(buffer1, buffer2), CryptoStreamMode.Write);
            stream1.Write(buffer3, 0, buffer3.Length);
            stream1.FlushFinalBlock();
            text1 = Convert.ToBase64String(stream2.ToArray());
        }
        catch (Exception exception2)
        {
            Exception exception1 = exception2;
            text1 = exception1.Message;
        }
        return text1;
    }

    public string InsertChar(string SourceText, string insertedString, int interval, Boolean BeginFromEndOfString)
    {
        string returnValue = "";
        char[] chr = SourceText.ToCharArray();

        if (BeginFromEndOfString)
        {
            int j = SourceText.Length - 1;
            for (decimal i = 0; i <= SourceText.Length - 1; i++)
            {
                if (((i % interval) == 0) && (i != 0))
                    returnValue = insertedString + returnValue;
                returnValue = chr[j] + returnValue;
                j -= 1;

            }
        }
        else
        {
            for (int i = 0; i <= SourceText.Length - 1; i++)
            {
                if (((i % interval) == 0) && (i != 0))
                    returnValue += insertedString;
                returnValue += chr[i];
            }
        }

        return returnValue;
    }


    public string ReportCnStr()
    {
        string cnStr = "Server='{0}';Database='{1}';User id ='{2}' ;password ='{3}'";
        cnStr = string.Format(cnStr, server, database, user, pass);
        return cnStr;
    }

    public string DateShamsi(DateTime day) // تبدیل میلادی به خورشیدی
    {
        string year = pc.GetYear(day).ToString().Substring(2, 2);
        string month = pc.GetMonth(day).ToString();
        if (month.Length == 1) month = "0" + month;
        string days = pc.GetDayOfMonth(day).ToString();
        if (days.Length == 1) days = "0" + days;
        string d = year + "/" + month + "/" + days;
        return d;

    }
    public string DateStyle(string date)
    {
        //13890202
        string year = date.Substring(0, 4);
        string month = date.Substring(4, 2);
        string day = date.Substring(6, 2);
        date = year + "/" + month + "/" + day;
        return date;
    }
    public DateTime DateMiladi(string date) //تبدیل خورشیدی به میلادی
    {
        //1391/01/01
        int year = Convert.ToInt32(date.Substring(0, 4));
        int month = Convert.ToInt32(date.Substring(5, 2));
        int day = Convert.ToInt32(date.Substring(8, 2));
        DateTime Mdate = pc.ToDateTime(year, month, day, 0, 0, 0, 0);
        return Mdate;

    }
    public static string GetFarsiDate(object dd)
    {
        PersianCalendar pc = new PersianCalendar();
        DateTime InputDate ;
        if (dd == null)
            return string.Empty;
        if (!DateTime.TryParse(dd.ToString(), out InputDate))
            return string.Empty;
        if (InputDate == DateTime.MinValue)
            return string.Empty;
        string year = pc.GetYear(InputDate).ToString();
        string m = pc.GetMonth(InputDate).ToString();
        string day = pc.GetDayOfMonth(InputDate).ToString();
        string dw = pc.GetDayOfWeek(InputDate).ToString();
        pc.Equals(dw);
        string month = "";
        switch (m)
        {
            case "1":
                month = "فروردین";
                break;
            case "2":
                month = "اردیبهشت";
                break;
            case "3":
                month = "خرداد";
                break;
            case "4":
                month = "تیر";
                break;
            case "5":
                month = "مرداد";
                break;
            case "6":
                month = "شهریور";
                break;
            case "7":
                month = "مهر";
                break;
            case "8":
                month = "آبان";
                break;
            case "9":
                month = "آذر";
                break;
            case "10":
                month = "دی";
                break;
            case "11":
                month = "بهمن";
                break;
            case "12":
                month = "اسفند";
                break;
        }
        string DayOfWeek = "";
        switch (dw)
        {

            case "Saturday":
                DayOfWeek = "شنبه";
                break;
            case "Sunday":
                DayOfWeek = "یکشنبه";
                break;
            case "Monday":
                DayOfWeek = "دوشنبه";
                break;
            case "Tuesday":
                DayOfWeek = "سه شنبه";
                break;
            case "Wednesday":
                DayOfWeek = "چهارشنبه";
                break;
            case "Thursday":
                DayOfWeek = "پنجشنبه";
                break;
            case "Friday":
                DayOfWeek = "جمعه";
                break;

        }
        string date = @"{0} {1} {2} {3}";
        date = string.Format(date, DayOfWeek, day, month, year);
        return date;
    }
    public enum DateType
    {
        Full=0,
        DayesOfWeek,
        Day,
        Month,
        Year,
        DayAndMoth
    }
    public string GetFarsiDate2(object dd, DateType kind)
    {
        return GetFarsiDate2(dd, (int)kind);
    }
    public  string GetFarsiDate2(object dd, int kind)
    {
        PersianCalendar pc = new PersianCalendar();
        DateTime InputDate;
        if (dd == null)
            return string.Empty;
        if (!DateTime.TryParse(dd.ToString(), out InputDate))
            return string.Empty;
        if (InputDate == DateTime.MinValue)
            return string.Empty;
        string year = pc.GetYear(InputDate).ToString();
        string m = pc.GetMonth(InputDate).ToString();
        string day = pc.GetDayOfMonth(InputDate).ToString();
        string dw = pc.GetDayOfWeek(InputDate).ToString();
        pc.Equals(dw);
        string month = "";
        switch (m)
        {
            case "1":
                month = "فروردین";
                break;
            case "2":
                month = "اردیبهشت";
                break;
            case "3":
                month = "خرداد";
                break;
            case "4":
                month = "تیر";
                break;
            case "5":
                month = "مرداد";
                break;
            case "6":
                month = "شهریور";
                break;
            case "7":
                month = "مهر";
                break;
            case "8":
                month = "آبان";
                break;
            case "9":
                month = "آذر";
                break;
            case "10":
                month = "دی";
                break;
            case "11":
                month = "بهمن";
                break;
            case "12":
                month = "اسفند";
                break;
        }
        string DayOfWeek = "";
        switch (dw)
        {

            case "Saturday":
                DayOfWeek = "شنبه";
                break;
            case "Sunday":
                DayOfWeek = "یکشنبه";
                break;
            case "Monday":
                DayOfWeek = "دوشنبه";
                break;
            case "Tuesday":
                DayOfWeek = "سه شنبه";
                break;
            case "Wednesday":
                DayOfWeek = "چهارشنبه";
                break;
            case "Thursday":
                DayOfWeek = "پنجشنبه";
                break;
            case "Friday":
                DayOfWeek = "جمعه";
                break;

        }
        switch (kind)
        {
            
             
             default:
            case 0:
                {
                    string date = @"{0} {1} {2} {3}";
                    date = string.Format(date, DayOfWeek, day, month, year);
                    return date;
                }
                break;
            case 1:
                {
                    return DayOfWeek;
                } break;
            case 2:
                {
                    return day;
                } break;
            case 3:
                {
                    return month;
                } break;
            case 4:
                {
                    return year;
                } break;
            case 5:
                {
                    string date = @"{0} {1} ";
                    date = string.Format(date, day, month);
                    return date;
                    break;
                }
        }
    }
    public DataView SpSearch(string PartID, string itemtopic, string GroupID, string FromDate, string ToDate, string Customer)
    {
        DataView dv = new DataView();
        DataSet ds = new DataSet();

        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "SpListItems";
        cm.Parameters.Clear();
        cm.Parameters.Add("@Pid", SqlDbType.NVarChar);
        cm.Parameters.Add("@topic", SqlDbType.NVarChar);
        cm.Parameters.Add("@Gid", SqlDbType.NVarChar);
        cm.Parameters.Add("@From", SqlDbType.NVarChar);
        cm.Parameters.Add("@To", SqlDbType.NVarChar);
        cm.Parameters.Add("@Customer", SqlDbType.NVarChar);


        cm.Parameters["@Pid"].Value = PartID;
        cm.Parameters["@topic"].Value = itemtopic;
        cm.Parameters["@Gid"].Value = GroupID;
        cm.Parameters["@From"].Value = FromDate;
        cm.Parameters["@To"].Value = ToDate;
        cm.Parameters["@Customer"].Value = Customer;


        da.SelectCommand = cm;
        da.Fill(ds);

        dv = ds.Tables[0].DefaultView;

        return dv;

    }
    public static int CustomerId
    {
        get
        {
            var user = global::AccessManagementService.Access.AccessControl.LoggedInUser;
            if (user == null)
                new AccessManagementService.Access.Login().RemoveSessions();
            return user.ID;
        }
    }
    public static string BackIconTag(object cntType)
    {
        string format = cntType.ToString();
        if (format.Contains("audio"))
            return "fa fa-play";
        else if (format.Contains("video"))
            return "fa fa-video-camera";
        else return "fa fa-file";
    }
    public List<DataRowView> GetRowsDefaultView(DataRow[] rows, DataTable dt)
    {
        if (rows == null)
            return null;
        List<DataRowView> dev = new List<DataRowView>();
        int i = 0;
        foreach (DataRow dr in rows)
        {
            dev.Add(dt.DefaultView[dt.Rows.IndexOf(dr)]);
            i++;
        }
        return dev;
    }
    public DataTable SpComment(string MyId, string Stat)
    {
        DataSet ds = new DataSet();

        cm.CommandType = CommandType.StoredProcedure;
        cm.CommandText = "SpCommentList";
        cm.Parameters.Clear();
        cm.Parameters.Add("@ID", SqlDbType.NVarChar);
        cm.Parameters.Add("@Stat", SqlDbType.NVarChar);

        cm.Parameters["@ID"].Value = MyId;
        cm.Parameters["@Stat"].Value = Stat;

        da.SelectCommand = cm;
        da.Fill(ds);

        DataTable dt = ds.Tables[0];
        return dt;
    }

}



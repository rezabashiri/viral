using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMS.CMSLogic
{
    public class StringHeplers
    {
        public static string GetSummaryString(string value, int len)
        {
            if (!string.IsNullOrEmpty(value))
            {
                return value.Substring(0, len <= value.Length ? len : value.Length);
            }
            return string.Empty;
        }
        public static string GetSummaryString(object value,int len)
        {
            if (value == null)
                return string.Empty;
            string str = value.ToString();
            return GetSummaryString(str, len);
        }
        public static string GetOppositeSummaryString(object value, int len)
        {
            if (value == null)
                return string.Empty;
            string str = value.ToString();
            return GetOppositeSummaryString(str, len);
        }
        public static string GetOppositeSummaryString(string value, int len)
        {
            if (!string.IsNullOrEmpty(value))
            {
                if (value.Length > len)
                {
                    return value.Substring(len,  value.Length - len);

                }
                return string.Empty;
            }
            return string.Empty;
        }
        public static string RemoveExtension(object value)
        {
            if (value != null)
            {
                string _str = value.ToString();
                string pure = System.IO.Path.GetFileNameWithoutExtension(_str);
                return pure;
            }
            return string.Empty;
        }
    }
}
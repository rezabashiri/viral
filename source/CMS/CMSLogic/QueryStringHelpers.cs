using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMS.CMSLogic
{
    public class QueryStringHelpers
    {
        public enum ViewMode
        {
            Normal,
            Popup,
            Events,
            News,
            Item
        }
        public enum QueryStrings
        {
            GrpID,
            ItemId,
            ViewMode
        }
        public static String GetValue(QueryStrings querystring)
        {
            return WebUtility.Helpers.QuerStringHelpers.GetQueryStringValue<QueryStrings>(HttpContext.Current, querystring);
        }
        public static string SetValue(QueryStrings querystring, string value)
        {
            return WebUtility.Helpers.QuerStringHelpers.SetQueryStringValue (querystring, value);
        }
        public static string SetItemID(string itemid)
        {
            return SetValue(QueryStrings.ItemId, itemid);
        }
        public static string GetItemId()
        {
            return GetValue(QueryStrings.ItemId);
        }
        public static string SetGroupID(string GRPId)
        {
            return SetValue(QueryStrings.GrpID, GRPId);
        }
        public static string GetGroupID( )
        {
            return GetValue(QueryStrings.GrpID);
        }
        public static string SetViewMode(ViewMode Mode)
        {
            return SetValue(QueryStrings.ViewMode, Enum.GetName(typeof(ViewMode), Mode));
        }
        public static ViewMode GetViewMode()
        {
            var mode = GetValue(QueryStrings.ViewMode);
            ViewMode _mode=ViewMode.Normal;
            if (Enum.TryParse(mode, out _mode))
                return _mode;
            else
                return ViewMode.Normal;

        }
    }
}
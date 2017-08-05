using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CMS.CMSLogic
{
    public class SessionHelpers
    {
        public enum Sessions
        {
            user
        }
        public static void Set<T>(T obj,Sessions key)
        {
            HttpContext.Current.Session[Enum.GetName(typeof(Sessions), key)] = obj;
        }
        public static T Get<T>(Sessions key)
        {
            object obj = HttpContext.Current.Session[Enum.GetName(typeof(Sessions), key)];
            if (obj == null)
                return default(T);
            else
                return (T)obj;
        }
        public static AccessManagementService.Model.User GetUser()
        {
            return Get<AccessManagementService.Model.User>(Sessions.user);
        }
        public static void SetUser(AccessManagementService.Model.User _user)
        {
            Set<AccessManagementService.Model.User>(_user, Sessions.user);
        }
    }
}
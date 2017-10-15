using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Viralme.Helpers
{
    public static class ExtensionHelprs
    {
        public static int ToInt32(this object s)
        {
            int i;
            if (s != null)
            {
                if (Int32.TryParse(s.ToString(), out i))
                {
                    return i;
                }
            }
            return int.MinValue;
        }
        public static Int64 ToInt64(this object s)
        {
            Int64 i;
            if (s != null)
            {
                if (Int64.TryParse(s.ToString(), out i))
                {
                    return i;
                }
            }
            return int.MinValue;
        }

        public static T GetAttributeOfType<T>(this Enum enumVal) where T : System.Attribute
        {
            var type = enumVal.GetType();
            var memInfo = type.GetMember(enumVal.ToString());
            var attributes = memInfo[0].GetCustomAttributes(typeof(T), false);
            return (attributes.Length > 0) ? (T)attributes[0] : null;
        }
    }
}
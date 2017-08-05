using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Viralme.Helpers
{
    public class Interface
    {
        public static string ConnectionString
        {
            get
            {
                return new Model.viralmeEntities().Database.Connection.ConnectionString;
            }
        }
    }
}
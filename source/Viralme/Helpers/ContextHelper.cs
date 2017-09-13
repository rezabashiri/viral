using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Viralme.Model;
namespace Viralme.Helpers
{
    public class ContextHelper
    {
        public static viralmeEntities GetContext
        {
            get
            {
                return new viralmeEntities();
            }
        }
    }
}
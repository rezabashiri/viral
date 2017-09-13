using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Viralme.Model
{

    [MetadataType(typeof(MetaData))]
    [ScaffoldTable(false)]
    public partial class DriverPrice
    {
        private class MetaData
        {
            public int DriverID { get; set; }
            public int PackageID { get; set; }
            public Nullable<int> Price { get; set; }

            public virtual Package Package { get; set; }
        }
    }
}
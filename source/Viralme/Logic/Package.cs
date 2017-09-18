using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Viralme.Model
{

    [MetadataType(typeof(MetaData))]

    public partial class Package
    {
        private class MetaData
        {
            [Display(Name="نام پکیج")]
            public string Name { get; set; }
            [Display(Name="واحد")]
            public string Unit { get; set; }
            [ScaffoldColumn(false)]
            
        }
        public List<Package> GetPackages()
        {
            using (var en = Helpers.ContextHelper.GetContext)
            {
                return en.Packages.ToList();
            }
        }
    }
}
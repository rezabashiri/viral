using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
namespace GIS.AppStart
{
    public class DynamicDataConfig
    {
        private static MetaModel _model = new MetaModel();
        public static MetaModel ViralMeModel
        {
            get
            {
                return _model ?? new MetaModel();
            }
        }
    }
}
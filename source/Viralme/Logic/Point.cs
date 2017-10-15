using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Viralme.Logic
{
    public class Point
    {
        public string Lat
        {
            get;
            set;
        }
        public string Lng
        {
            set;
            get;
        }
    }
    public class PolyGon
    {
        public PolyGon()
        {
            Points = new List<Point>();
        }
        public PolyGon(List<Point> _point)
        {
            Points = _point;
        }
        public List<Point> Points;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CMS.CMSLogic
{
    
   public interface Ititem
    {
         int ItemID { get; set; }
         string ItemTopic { get; set; }
         string PhotoName { get; set; }
         string SummaryTxt { get; set; }
         string BodyTxt { get; set; }
         string FileURL { get; set; }
         Nullable<System.DateTime> InputDate { get; set; }
         Nullable<System.DateTime> ShowDate { get; set; }
         Nullable<int> FreshStat { get; set; }
         Nullable<int> CommentStat { get; set; }
         Nullable<int> VisitCnt { get; set; }
         Nullable<System.DateTime> EventDate { get; set; }
         Nullable<int> PubStat { get; set; }
         int GrpID { get; set; }
         string GrpName { get; set; }
         Nullable<int> StatID { get; set; }
         Nullable<int> CustomerID { get; set; }
         Nullable<int> root { get; set; }
         Nullable<int> fatherID { get; set; }
         Nullable<int> Removeable { get; set; }
         string PartName { get; set; }
         int PartID { get; set; }
         string PhotoPath { get; set; }
         string ClientPhotPath { get;  }
    }
}

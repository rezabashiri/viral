//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Viralme.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class PublicRequest
    {
        public int ID { get; set; }
        public Nullable<int> CampaignID { get; set; }
        public string Criteria { get; set; }
    
        public virtual Campaign Campaign { get; set; }
    }
}
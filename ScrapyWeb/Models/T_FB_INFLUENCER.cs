//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ScrapyWeb.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class T_FB_INFLUENCER
    {
        [Key, Column(Order = 0)]
        public string id { get; set; }
        [Key, Column(Order = 1)]
        public string fk_theme { get; set; }
        public string name { get; set; }
        public string url_name { get; set; }
        public string pro_or_anti { get; set; }
        public int fan_count { get; set; }
        public System.DateTime date_last_update { get; set; }
        public bool AutoRetrieveFBPostAndComments { get; set; }
        public string TargetEntities { get; set; }
        public string category { get; set; }
    }
}

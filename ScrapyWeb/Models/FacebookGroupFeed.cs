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
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("FacebookGroupFeed")]
    public partial class FacebookGroupFeed
    {
        [Key]
        public string GroupPostId { get; set; }
        public string PostText { get; set; }
        public DateTime UpdatedTime { get; set; }
        public DateTime? EntryDate { get; set; }
    }
}

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

    [Table("FBFeedComments")]
    public partial class FBFeedComment
    {
        [Key]
        public string Id { get; set; }
        [Column(TypeName = "NVARCHAR")]
        [StringLength(849)]
        public string message { get; set; }
        [Column(TypeName = "NVARCHAR")]
        [StringLength(849)]
        public string translated_message { get; set; }
        public DateTime created_time { get; set; }
        public string feedId { get; set; }
        public DateTime? EntryDate { get; set; }
        public int likes_count { get; set; }
        public int comments_count { get; set; }
        [Column(TypeName = "VARCHAR")]
        [StringLength(150)]
        public string parentId { get; set; }
    }
}

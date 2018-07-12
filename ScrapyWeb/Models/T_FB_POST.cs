﻿//------------------------------------------------------------------------------
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

    public partial class T_FB_POST
    {
        [Key]
        public string id { get; set; }
        public string fk_influencer { get; set; }
        public string post_text { get; set; }
        public string translated_text { get; set; }
        public int likes_count { get; set; }
        public int comments_count { get; set; }
        public int sharedposts_count { get; set; }
        public DateTime date_publishing { get; set; }
        public bool newCommentsWaiting { get; set; }
        public string MailBody { get; set; }
        public int? NoOfTimeMailSend { get; set; }
        public DateTime? LastMailSendOn { get; set; }
        public DateTime? EntryDate { get; set; }

        [Column(TypeName = "VARCHAR")]
        [StringLength(150)]
        public string from_id { get; set; }
    }
}

﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OADRJNLPCommon.Models
{
    [Table("T_FB_POST")]
    public partial class FB_POST
    {
        [Key]
        public string id { get; set; }
        public string fk_influencer { get; set; }
        public string post_text { get; set; }
        public string translated_text { get; set; }
        public int likes_count { get; set; }
        public int comments_count { get; set; }
        public int sharedposts_count { get; set; }
        public bool newCommentsWaiting { get; set; }
        public DateTime date_publishing { get; set; }
        public string MailBody { get; set; }
        public int? NoOfTimeMailSend { get; set; }
        public DateTime? LastMailSendOn { get; set; }
        public DateTime? EntryDate { get; set; }

        [Column(TypeName = "VARCHAR")]
        [StringLength(150)]
        public string from_id { get; set; }
    }

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

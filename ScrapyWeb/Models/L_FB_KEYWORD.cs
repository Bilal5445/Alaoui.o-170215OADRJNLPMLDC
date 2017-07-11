using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ScrapyWeb.Models
{
    public class L_FB_KEYWORD
    {
        public List<FB_KEYWORD> list;
    }

    public class FB_KEYWORD
    {
        public String keyword;
        public int matched_posts_count;
        public int matched_comments_count;
        public int matched_total_count;
        public int social_stats_likes;
        public int social_stats_comments;
        public int social_stats_shares;
        public int matched_posts_count_ma;
        public int matched_comments_count_ma;
        public int matched_total_count_ma;
        public int social_stats_likes_ma;
        public int social_stats_comments_ma;
        public int social_stats_shares_ma;
        public DateTime date_latest_retrieve;
        public DateTime date_oldest_retrieve;
    }
}
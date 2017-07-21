using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OADRJNLPCommon.Models
{
    public partial class FB_POST
    {
        public string id { get; set; }
        public string fk_influencer { get; set; }
        public string post_text { get; set; }
        public int likes_count { get; set; }
        public int comments_count { get; set; }
        public System.DateTime date_publishing { get; set; }
    }
}

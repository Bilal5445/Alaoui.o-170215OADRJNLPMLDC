using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OADRJNLPCommon.Models
{
   public partial class T_FB_INFLUENCER
    {
        [Key]
        public string id { get; set; }
        public string name { get; set; }
        public string url_name { get; set; }
        public string pro_or_anti { get; set; }
        public int fan_count { get; set; }
        public System.DateTime date_last_update { get; set; }
        public string fk_theme { get; set; }
    }
}

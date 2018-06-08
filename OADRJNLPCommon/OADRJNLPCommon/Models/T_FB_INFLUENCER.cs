using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace OADRJNLPCommon.Models
{
    [Table("T_FB_INFLUENCER")]
    public partial class T_FB_INFLUENCER
    {
        [Key]
        public string id { get; set; }
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

    public class LM_CountPerTheme
    {
        public String fk_theme { get; set; }
        public int CountPerTheme { get; set; }
    }

    public class LM_CountPerInfluencer
    {
        public String id { get; set; }
        public int CountPerInfluencer { get; set; }
    }

    public class LM_CountPerNamedInfluencer
    {
        public String id { get; set; }
        public String name { get; set; }
        public int CountPerInfluencer { get; set; }
    }

    public class LM_CountPerUser
    {
        public String UserID { get; set; }
        public int CountPerUser { get; set; }
    }

    public class LM_CountPerThemePerUser
    {
        public String UserID { get; set; }
        public Guid ID_XTRCTTHEME { get; set; }
        public int CountPerThemePerUser { get; set; }
    }

    public class LM_CountPerKeyword
    {
        public String Keyword { get; set; }
        public int CountPerKeyword { get; set; }
    }

    public class LM_CountPerKeywordPerTheme
    {
        public Guid ID_XTRCTTHEME { get; set; }
        public String Keyword { get; set; }
        public int CountPerKeyword { get; set; }
    }

    public class FBPageToThemeToUserViewModel
    {
        public string name { get; set; }    // FB page name
        public string ThemeName { get; set; }
        public string CurrentActive { get; set; }
        public string UserName { get; set; }
        public bool AutoRetrieveFBPostAndComments { get; set; }
    }
}
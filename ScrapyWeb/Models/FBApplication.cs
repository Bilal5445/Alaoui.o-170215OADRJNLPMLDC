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

    public partial class FBApplication
    {
        [Key]
        public int ApplicationId { get; set; }
        public string ApplicationName { get; set; }
        public string FbAppId { get; set; }
        public string FbAppSecret { get; set; }
    }
}

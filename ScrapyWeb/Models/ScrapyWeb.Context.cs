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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ScrapyWebEntities : DbContext
    {
        public ScrapyWebEntities()
            : base("name=ScrapyWebEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            // throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<TweetSet> TweetSets { get; set; }
        public DbSet<TwitterApplication> TwitterApplications { get; set; }
        public DbSet<FacebookGroupFeed> FacebookGroupFeeds { get; set; }
        public DbSet<FBGroup> FBGroups { get; set; }
        public DbSet<FBApplication> FBApplications { get; set; }
        public DbSet<FBFeedComment> FBFeedComments { get; set; }
        public DbSet<T_FB_INFLUENCER> T_FB_INFLUENCER { get; set; }
        public DbSet<T_FB_POST> T_FB_POST { get; set; }
        public DbSet<T_FB_USER> T_FB_USER { get; set; }
    }
}

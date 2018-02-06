namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class entryDate : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.FacebookGroupFeed", "EntryDate", c => c.DateTime());
            AddColumn("dbo.FBFeedComments", "EntryDate", c => c.DateTime());
            AddColumn("dbo.T_FB_POST", "EntryDate", c => c.DateTime());
        }
        
        public override void Down()
        {
            DropColumn("dbo.T_FB_POST", "EntryDate");
            DropColumn("dbo.FBFeedComments", "EntryDate");
            DropColumn("dbo.FacebookGroupFeed", "EntryDate");
        }
    }
}

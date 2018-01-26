namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class commentFeedId : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.FBFeedComments", "feedId", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.FBFeedComments", "feedId");
        }
    }
}

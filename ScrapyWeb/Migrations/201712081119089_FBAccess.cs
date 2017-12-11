namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class FBAccess : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.FBFeedComments", "translated_message", c => c.String());
            AddColumn("dbo.T_FB_INFLUENCER", "fk_theme", c => c.String());
            AddColumn("dbo.T_FB_POST", "translated_text", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.T_FB_POST", "translated_text");
            DropColumn("dbo.T_FB_INFLUENCER", "fk_theme");
            DropColumn("dbo.FBFeedComments", "translated_message");
        }
    }
}

namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class pageCategory : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.T_FB_INFLUENCER", "category", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.T_FB_INFLUENCER", "category");
        }
    }
}

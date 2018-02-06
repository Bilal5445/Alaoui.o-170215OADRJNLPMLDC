namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class targetEntities : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.T_FB_INFLUENCER", "TargetEntities", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.T_FB_INFLUENCER", "TargetEntities");
        }
    }
}

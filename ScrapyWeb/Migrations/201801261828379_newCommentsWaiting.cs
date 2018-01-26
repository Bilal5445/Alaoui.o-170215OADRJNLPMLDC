namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class newCommentsWaiting : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.T_FB_POST", "newCommentsWaiting", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.T_FB_POST", "newCommentsWaiting");
        }
    }
}

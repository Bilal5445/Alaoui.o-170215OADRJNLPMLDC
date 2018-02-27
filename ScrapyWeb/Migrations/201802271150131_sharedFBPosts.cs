namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class sharedFBPosts : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.T_FB_POST", "sharedposts_count", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.T_FB_POST", "sharedposts_count");
        }
    }
}

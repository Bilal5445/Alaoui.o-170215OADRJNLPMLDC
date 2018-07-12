namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class postFromId : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.T_FB_POST", "from_id", c => c.String(maxLength: 150, unicode: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.T_FB_POST", "from_id");
        }
    }
}

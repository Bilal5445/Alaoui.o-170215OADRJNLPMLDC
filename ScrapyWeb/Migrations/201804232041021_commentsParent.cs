namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class commentsParent : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.FBFeedComments", "parentId", c => c.String(maxLength: 150, unicode: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.FBFeedComments", "parentId");
        }
    }
}

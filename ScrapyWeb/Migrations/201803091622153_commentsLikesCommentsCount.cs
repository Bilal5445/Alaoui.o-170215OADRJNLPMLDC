namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class commentsLikesCommentsCount : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.FBFeedComments", "likes_count", c => c.Int(nullable: false));
            AddColumn("dbo.FBFeedComments", "comments_count", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.FBFeedComments", "comments_count");
            DropColumn("dbo.FBFeedComments", "likes_count");
        }
    }
}

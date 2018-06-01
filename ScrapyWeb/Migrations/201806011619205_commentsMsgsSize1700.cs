namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class commentsMsgsSize1700 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.FBFeedComments", "message", c => c.String(maxLength: 1700));
            AlterColumn("dbo.FBFeedComments", "translated_message", c => c.String(maxLength: 1700));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.FBFeedComments", "translated_message", c => c.String(maxLength: 4000));
            AlterColumn("dbo.FBFeedComments", "message", c => c.String(maxLength: 4000));
        }
    }
}

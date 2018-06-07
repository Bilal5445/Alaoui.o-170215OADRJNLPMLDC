namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class commentsMsgsSize849 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.FBFeedComments", "message", c => c.String(maxLength: 849));
            AlterColumn("dbo.FBFeedComments", "translated_message", c => c.String(maxLength: 849));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.FBFeedComments", "translated_message", c => c.String(maxLength: 1700));
            AlterColumn("dbo.FBFeedComments", "message", c => c.String(maxLength: 1700));
        }
    }
}

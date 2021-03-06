namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class commentsMsgsSize : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.FBFeedComments", "message", c => c.String(maxLength: 4000));
            AlterColumn("dbo.FBFeedComments", "translated_message", c => c.String(maxLength: 4000));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.FBFeedComments", "translated_message", c => c.String());
            AlterColumn("dbo.FBFeedComments", "message", c => c.String());
        }
    }
}

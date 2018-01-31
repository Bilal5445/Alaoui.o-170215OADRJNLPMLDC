namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class mailFBPosts : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.T_FB_POST", "MailBody", c => c.String());
            AddColumn("dbo.T_FB_POST", "NoOfTimeMailSend", c => c.Int());
            AddColumn("dbo.T_FB_POST", "LastMailSendOn", c => c.DateTime());
        }
        
        public override void Down()
        {
            DropColumn("dbo.T_FB_POST", "LastMailSendOn");
            DropColumn("dbo.T_FB_POST", "NoOfTimeMailSend");
            DropColumn("dbo.T_FB_POST", "MailBody");
        }
    }
}

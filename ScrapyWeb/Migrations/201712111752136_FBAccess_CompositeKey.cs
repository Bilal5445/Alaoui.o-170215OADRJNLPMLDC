namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class FBAccess_CompositeKey : DbMigration
    {
        public override void Up()
        {
            // for null fk_theme, fill with any guid
            Sql("UPDATE T_FB_INFLUENCER SET fk_theme = '" + Guid.NewGuid() + "' WHERE fk_theme IS NULL");

            // migration
            AlterColumn("dbo.T_FB_INFLUENCER", "fk_theme", c => c.String(nullable: false, maxLength: 128));
            // MC111217 commented the ef-generated DropPrimaryKey because he expects another naming for the PK
            // DropPrimaryKey("dbo.T_FB_INFLUENCER", new[] { "id" });
            Sql("ALTER TABLE dbo.T_FB_INFLUENCER DROP CONSTRAINT PK_T_FB_INFLUENCER");
            AddPrimaryKey("dbo.T_FB_INFLUENCER", new[] { "id", "fk_theme" });
        }
        
        public override void Down()
        {
            DropPrimaryKey("dbo.T_FB_INFLUENCER", new[] { "id", "fk_theme" });
            AddPrimaryKey("dbo.T_FB_INFLUENCER", "id");
            AlterColumn("dbo.T_FB_INFLUENCER", "fk_theme", c => c.String());
        }
    }
}

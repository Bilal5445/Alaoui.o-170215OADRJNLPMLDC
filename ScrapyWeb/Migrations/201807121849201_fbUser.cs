namespace ScrapyWeb.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class fbUser : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.T_FB_USER",
                c => new
                    {
                        from_id = c.String(nullable: false, maxLength: 150, unicode: false),
                        name = c.String(maxLength: 150),
                    })
                .PrimaryKey(t => t.from_id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.T_FB_USER");
        }
    }
}

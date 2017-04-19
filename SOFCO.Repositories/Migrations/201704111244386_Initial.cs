/*namespace SOFCO.Repositories.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.BillingMilestones",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        ScheduledDate = c.DateTime(nullable: false),
                        IdCustomer = c.Int(nullable: false),
                        CustomerDescription = c.String(),
                        CustomerContact = c.String(),
                        CustomerPhone = c.String(),
                        IdProject = c.Int(nullable: false),
                        ProjectName = c.String(),
                        ContractNumber = c.Int(nullable: false),
                        IdDocumentType = c.Int(),
                        IdPaymentMethod = c.Int(),
                        PaymentMethodDescription = c.String(),
                        Plazo = c.Int(nullable: false, defaultValue: 0),
                        Comments = c.String(),
                        Status = c.String(),
                        ApplicantName = c.String(),
                        ImporteBruto = c.Decimal(nullable: false, precision: 18, scale: 2, defaultValue: 0),
                        Iva21 = c.Decimal(nullable: false, precision: 18, scale: 2, defaultValue: 0),
                        ImporteBrutoMasIva21 = c.Decimal(nullable: false, precision: 18, scale: 2, defaultValue: 0),
                        Total = c.Decimal(nullable: false, precision: 18, scale: 2, defaultValue: 0),
                        ImpCapital = c.Decimal(nullable: false, precision: 18, scale: 2, defaultValue: 0),
                        ImpProvBsAs = c.Decimal(nullable: false, precision: 18, scale: 2, defaultValue: 0),
                        ImpOtrasProv_1 = c.Decimal(nullable: false, precision: 18, scale: 2, defaultValue: 0),
                        IdImpProv_1 = c.Int(),
                        ImpOtrasProv_2 = c.Decimal(nullable: false, precision: 18, scale: 2, defaultValue: 0),
                        IdImpProv_2 = c.Int(),
                        ImpOtrasProv_3 = c.Decimal(nullable: false, precision: 18, scale: 2, defaultValue: 0),
                        IdImpProv_3 = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Customers", t => t.IdCustomer, cascadeDelete: true)
                .ForeignKey("dbo.DocumentTypes", t => t.IdDocumentType)
                .ForeignKey("dbo.Provinces", t => t.IdImpProv_1, false)
                .ForeignKey("dbo.Provinces", t => t.IdImpProv_2, false)
                .ForeignKey("dbo.Provinces", t => t.IdImpProv_3, false)
                .ForeignKey("dbo.PaymentMethods", t => t.IdPaymentMethod)
                .ForeignKey("dbo.Projects", t => t.IdProject, cascadeDelete: true)
                .Index(t => t.IdCustomer)
                .Index(t => t.IdProject)
                .Index(t => t.IdDocumentType)
                .Index(t => t.IdPaymentMethod)
                .Index(t => t.IdImpProv_1)
                .Index(t => t.IdImpProv_2)
                .Index(t => t.IdImpProv_3);
            
            CreateTable(
                "dbo.BillingMilestoneDetails",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        IdBillingMilestone = c.Int(nullable: false),
                        Name = c.String(),
                        Order = c.Int(nullable: false),
                        Detail = c.String(),
                        IdCurrencySign = c.Int(nullable: false),
                        CurrencySignName = c.String(),
                        Quantity = c.Int(nullable: false),
                        UnitPrice = c.Decimal(nullable: false, precision: 18, scale: 2),
                        SubTotal = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.BillingMilestones", t => t.IdBillingMilestone, cascadeDelete: true)
                .ForeignKey("dbo.CurrencySigns", t => t.IdCurrencySign, cascadeDelete: true)
                .Index(t => t.IdBillingMilestone)
                .Index(t => t.IdCurrencySign);
            
            CreateTable(
                "dbo.CurrencySigns",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Customers",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.DocumentTypes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Provinces",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.PaymentMethods",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Projects",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        IdCustomer = c.Int(nullable: false),
                        Description = c.String(),
                        StartDate = c.DateTime(nullable: false),
                        EndDate = c.DateTime(nullable: false),
                        ProjectManager = c.String(),
                        IdTypeService = c.Int(nullable: false),
                        IdTypeSolution = c.Int(nullable: false),
                        IdTypeTecnology = c.Int(nullable: false),
                        EstimatedEarnings = c.Int(),
                        Analytics = c.String(),
                        PurchaseOrder = c.String(),
                        Link = c.String(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Customers", t => t.IdCustomer, cascadeDelete: false)
                .Index(t => t.IdCustomer);
            
            CreateTable(
                "dbo.CustomerServices",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        IdStatus = c.Int(nullable: false),
                        IdCustomer = c.Int(nullable: false),
                        Description = c.String(),
                        StartDate = c.DateTime(nullable: false),
                        EndDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Customers", t => t.IdCustomer, cascadeDelete: true)
                .ForeignKey("dbo.Status", t => t.IdStatus, cascadeDelete: true)
                .Index(t => t.IdStatus)
                .Index(t => t.IdCustomer);
            
            CreateTable(
                "dbo.Status",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.CustomerServices", "IdStatus", "dbo.Status");
            DropForeignKey("dbo.CustomerServices", "IdCustomer", "dbo.Customers");
            DropForeignKey("dbo.BillingMilestones", "IdProject", "dbo.Projects");
            DropForeignKey("dbo.Projects", "IdCustomer", "dbo.Customers");
            DropForeignKey("dbo.BillingMilestones", "IdPaymentMethod", "dbo.PaymentMethods");
            DropForeignKey("dbo.BillingMilestones", "IdImpProv_3", "dbo.Provinces");
            DropForeignKey("dbo.BillingMilestones", "IdImpProv_2", "dbo.Provinces");
            DropForeignKey("dbo.BillingMilestones", "IdImpProv_1", "dbo.Provinces");
            DropForeignKey("dbo.BillingMilestones", "IdDocumentType", "dbo.DocumentTypes");
            DropForeignKey("dbo.BillingMilestones", "IdCustomer", "dbo.Customers");
            DropForeignKey("dbo.BillingMilestoneDetails", "IdCurrencySign", "dbo.CurrencySigns");
            DropForeignKey("dbo.BillingMilestoneDetails", "IdBillingMilestone", "dbo.BillingMilestones");
            DropIndex("dbo.CustomerServices", new[] { "IdCustomer" });
            DropIndex("dbo.CustomerServices", new[] { "IdStatus" });
            DropIndex("dbo.Projects", new[] { "IdCustomer" });
            DropIndex("dbo.BillingMilestoneDetails", new[] { "IdCurrencySign" });
            DropIndex("dbo.BillingMilestoneDetails", new[] { "IdBillingMilestone" });
            DropIndex("dbo.BillingMilestones", new[] { "IdImpProv_3" });
            DropIndex("dbo.BillingMilestones", new[] { "IdImpProv_2" });
            DropIndex("dbo.BillingMilestones", new[] { "IdImpProv_1" });
            DropIndex("dbo.BillingMilestones", new[] { "IdPaymentMethod" });
            DropIndex("dbo.BillingMilestones", new[] { "IdDocumentType" });
            DropIndex("dbo.BillingMilestones", new[] { "IdProject" });
            DropIndex("dbo.BillingMilestones", new[] { "IdCustomer" });
            DropTable("dbo.Status");
            DropTable("dbo.CustomerServices");
            DropTable("dbo.Projects");
            DropTable("dbo.PaymentMethods");
            DropTable("dbo.Provinces");
            DropTable("dbo.DocumentTypes");
            DropTable("dbo.Customers");
            DropTable("dbo.CurrencySigns");
            DropTable("dbo.BillingMilestoneDetails");
            DropTable("dbo.BillingMilestones");
        }
    }
}
*/
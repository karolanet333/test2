


GO
CREATE TABLE [dbo].[BillingMilestoneDetails] (
    [Id]                 INT             IDENTITY (1, 1) NOT NULL,
    [IdBillingMilestone] INT             NOT NULL,
    [Name]               NVARCHAR (MAX)  NULL,
    [Order]              INT             NOT NULL,
    [Detail]             NVARCHAR (MAX)  NULL,
    [IdCurrencySign]     INT             NOT NULL,
    [Quantity]           INT             NOT NULL,
    [UnitPrice]          DECIMAL (18, 2) NOT NULL,
    [SubTotal]           DECIMAL (18, 2) NOT NULL,
    [CurrencySignName]   NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_dbo.BillingMilestoneDetails] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_IdBillingMilestone]
    ON [dbo].[BillingMilestoneDetails]([IdBillingMilestone] ASC);



GO
CREATE NONCLUSTERED INDEX [IX_IdCurrencySign]
    ON [dbo].[BillingMilestoneDetails]([IdCurrencySign] ASC);



GO
CREATE TABLE [dbo].[BillingMilestones] (
    [Id]                       INT             IDENTITY (1, 1) NOT NULL,
    [IdProject]                INT             NOT NULL,
    [IdCustomer]               INT             NOT NULL,
    [ScheduledDate]            DATETIME        NOT NULL,
    [Status]                   NVARCHAR (MAX)  NULL,
    [CustomerDescription]      NVARCHAR (MAX)  NULL,
    [CustomerContact]          NVARCHAR (MAX)  NULL,
    [CustomerPhone]            NVARCHAR (MAX)  NULL,
    [ProjectName]              NVARCHAR (MAX)  NULL,
    [Plazo]                    INT             NOT NULL,
    [PaymentMethodDescription] NVARCHAR (MAX)  NULL,
    [ImporteBruto]             DECIMAL (18, 2) NOT NULL,
    [Iva21]                    DECIMAL (18, 2) NOT NULL,
    [ImporteBrutoMasIva21]     DECIMAL (18, 2) NOT NULL,
    [Total]                    DECIMAL (18, 2) NOT NULL,
    [comments]                 NVARCHAR (MAX)  NULL,
    [ImpCapital]               DECIMAL (18, 2) NOT NULL,
    [ImpProvBsAs]              DECIMAL (18, 2) NOT NULL,
    [ImpOtrasProv_1]           DECIMAL (18, 2) NOT NULL,
    [ImpOtrasProv_2]           DECIMAL (18, 2) NOT NULL,
    [ImpOtrasProv_3]           DECIMAL (18, 2) NOT NULL,
    [IdImpProv_1]              INT             NULL,
    [IdImpProv_2]              INT             NULL,
    [IdImpProv_3]              INT             NULL,
    [IdPaymentMethod]          INT             NOT NULL,
    [Name]                     NVARCHAR (MAX)  NULL,
    [ContractNumber]           INT             NOT NULL,
    [IdDocumentType]           INT             NOT NULL,
    [ApplicantName]            NVARCHAR (MAX)  NULL,
    [Monto]                    DECIMAL (18, 2) NOT NULL,
    [IdService]                INT             NULL,
    [CurrState]                NVARCHAR (50)   NULL,
    [IdSolFacState]            INT             NULL,
    CONSTRAINT [PK_dbo.BillingMilestones] PRIMARY KEY CLUSTERED ([Id] ASC)
);




GO
CREATE NONCLUSTERED INDEX [IX_IdProject]
    ON [dbo].[BillingMilestones]([IdProject] ASC);



GO
CREATE NONCLUSTERED INDEX [IX_IdCustomer]
    ON [dbo].[BillingMilestones]([IdCustomer] ASC);



GO
CREATE NONCLUSTERED INDEX [IX_IdPaymentMethod]
    ON [dbo].[BillingMilestones]([IdPaymentMethod] ASC);




GO
CREATE NONCLUSTERED INDEX [IX_IdImpProv_1]
    ON [dbo].[BillingMilestones]([IdImpProv_1] ASC);



GO
CREATE NONCLUSTERED INDEX [IX_IdImpProv_2]
    ON [dbo].[BillingMilestones]([IdImpProv_2] ASC);



GO
CREATE NONCLUSTERED INDEX [IX_IdImpProv_3]
    ON [dbo].[BillingMilestones]([IdImpProv_3] ASC);



GO
CREATE NONCLUSTERED INDEX [IX_IdDocumentType]
    ON [dbo].[BillingMilestones]([IdDocumentType] ASC);


GO
PRINT N'Creando [dbo].[CurrencySigns]...';


GO
CREATE TABLE [dbo].[CurrencySigns] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.CurrencySigns] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Customers]...';


GO
CREATE TABLE [dbo].[Customers] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.Customers] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[CustomerServices]...';


GO
CREATE TABLE [dbo].[CustomerServices] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (MAX) NULL,
    [IdStatus]    INT            NOT NULL,
    [IdCustomer]  INT            NOT NULL,
    [Description] NVARCHAR (MAX) NULL,
    [StartDate]   DATETIME       NOT NULL,
    [EndDate]     DATETIME       NOT NULL,
    CONSTRAINT [PK_dbo.CustomerServices] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[CustomerServices].[IX_IdStatus]...';


GO
CREATE NONCLUSTERED INDEX [IX_IdStatus]
    ON [dbo].[CustomerServices]([IdStatus] ASC);


GO
PRINT N'Creando [dbo].[CustomerServices].[IX_IdCustomer]...';


GO
CREATE NONCLUSTERED INDEX [IX_IdCustomer]
    ON [dbo].[CustomerServices]([IdCustomer] ASC);


GO
PRINT N'Creando [dbo].[DocumentTypes]...';


GO
CREATE TABLE [dbo].[DocumentTypes] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.DocumentTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[PaymentMethods]...';


GO
CREATE TABLE [dbo].[PaymentMethods] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.PaymentMethods] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Profiles]...';


GO
CREATE TABLE [dbo].[Profiles] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Code] NVARCHAR (50) NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Projects]...';


GO
CREATE TABLE [dbo].[Projects] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [Name]              NVARCHAR (MAX) NULL,
    [IdCustomer]        INT            NOT NULL,
    [Description]       NVARCHAR (MAX) NULL,
    [StartDate]         DATETIME       NOT NULL,
    [EndDate]           DATETIME       NOT NULL,
    [ProjectManager]    NVARCHAR (MAX) NULL,
    [IdTypeService]     INT            NOT NULL,
    [IdTypeSolution]    INT            NOT NULL,
    [IdTypeTecnology]   INT            NOT NULL,
    [EstimatedEarnings] INT            NULL,
    [Analytics]         NVARCHAR (MAX) NULL,
    [PurchaseOrder]     NVARCHAR (MAX) NULL,
    [Link]              NVARCHAR (MAX) NULL,
    [IdService]         INT            NULL,
    CONSTRAINT [PK_dbo.Projects] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Projects].[IX_IdCustomer]...';


GO
CREATE NONCLUSTERED INDEX [IX_IdCustomer]
    ON [dbo].[Projects]([IdCustomer] ASC);


GO
PRINT N'Creando [dbo].[Provinces]...';


GO
CREATE TABLE [dbo].[Provinces] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.Provinces] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[SolFacHists]...';


GO
CREATE TABLE [dbo].[SolFacHists] (
    [Id]                 INT      IDENTITY (1, 1) NOT NULL,
    [IdBillingMilestone] INT      NOT NULL,
    [IdSolFacState]      INT      NOT NULL,
    [Date]               DATETIME NOT NULL,
    [IdUser]             INT      NOT NULL,
    [Canceled]           BIT      NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[SolFacStates]...';


GO
CREATE TABLE [dbo].[SolFacStates] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [Name]           NVARCHAR (50) NOT NULL,
    [Code]           NVARCHAR (50) NOT NULL,
    [ProfileAllowed] NVARCHAR (50) NULL,
    [NextState]      NVARCHAR (50) NULL,
    [PrevState]      NVARCHAR (50) NULL,
    [ShortName]      NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Status]...';


GO
CREATE TABLE [dbo].[Status] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.Status] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Table]...';


GO
CREATE TABLE [dbo].[Table] (
    [Id] INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[UserProfiles]...';


GO
CREATE TABLE [dbo].[UserProfiles] (
    [Id]         INT IDENTITY (1, 1) NOT NULL,
    [Profile_Id] INT NOT NULL,
    [User_Id]    INT NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando [dbo].[Users]...';


GO
CREATE TABLE [dbo].[Users] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (50) NOT NULL,
    [IdProfile] INT           NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando restricción sin nombre en [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones]
    ADD DEFAULT ((0)) FOR [Plazo];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones]
    ADD DEFAULT ((0)) FOR [ImporteBruto];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones]
    ADD DEFAULT ((0)) FOR [Iva21];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones]
    ADD DEFAULT ((0)) FOR [ImporteBrutoMasIva21];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones]
    ADD DEFAULT ((0)) FOR [Total];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones]
    ADD DEFAULT ((0)) FOR [ImpCapital];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones]
    ADD DEFAULT ((0)) FOR [ImpProvBsAs];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones]
    ADD DEFAULT ((0)) FOR [ImpOtrasProv_1];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones]
    ADD DEFAULT ((0)) FOR [ImpOtrasProv_2];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones]
    ADD DEFAULT ((0)) FOR [ImpOtrasProv_3];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones]
    ADD DEFAULT ((0)) FOR [ContractNumber];


GO
PRINT N'Creando restricción sin nombre en [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones]
    ADD DEFAULT ((0)) FOR [IdDocumentType];


GO
PRINT N'Creando restricción sin nombre en [dbo].[SolFacHists]...';


GO
ALTER TABLE [dbo].[SolFacHists]
    ADD DEFAULT (getdate()) FOR [Date];


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestoneDetails_dbo.CurrencySigns_IdCurrencySign]...';


GO
ALTER TABLE [dbo].[BillingMilestoneDetails] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestoneDetails_dbo.CurrencySigns_IdCurrencySign] FOREIGN KEY ([IdCurrencySign]) REFERENCES [dbo].[CurrencySigns] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestoneDetails_dbo.BillingMilestones_IdBillingMilestone]...';


GO
ALTER TABLE [dbo].[BillingMilestoneDetails] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestoneDetails_dbo.BillingMilestones_IdBillingMilestone] FOREIGN KEY ([IdBillingMilestone]) REFERENCES [dbo].[BillingMilestones] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestones_dbo.CustomerServices_IdService]...';


GO
ALTER TABLE [dbo].[BillingMilestones] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.CustomerServices_IdService] FOREIGN KEY ([IdService]) REFERENCES [dbo].[CustomerServices] ([Id]);


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestones_dbo.Customers_IdCustomer]...';


GO
ALTER TABLE [dbo].[BillingMilestones] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Customers_IdCustomer] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customers] ([Id]);


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestones_dbo.DocumentTypes_IdDocumentType]...';


GO
ALTER TABLE [dbo].[BillingMilestones] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.DocumentTypes_IdDocumentType] FOREIGN KEY ([IdDocumentType]) REFERENCES [dbo].[DocumentTypes] ([Id]);


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestones_dbo.PaymentMethods_IdPaymentMethod]...';


GO
ALTER TABLE [dbo].[BillingMilestones] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.PaymentMethods_IdPaymentMethod] FOREIGN KEY ([IdPaymentMethod]) REFERENCES [dbo].[PaymentMethods] ([Id]);


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestones_dbo.Projects_IdProject]...';


GO
ALTER TABLE [dbo].[BillingMilestones] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Projects_IdProject] FOREIGN KEY ([IdProject]) REFERENCES [dbo].[Projects] ([Id]);


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_1]...';


GO
ALTER TABLE [dbo].[BillingMilestones] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_1] FOREIGN KEY ([IdImpProv_1]) REFERENCES [dbo].[Provinces] ([Id]);


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_2]...';


GO
ALTER TABLE [dbo].[BillingMilestones] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_2] FOREIGN KEY ([IdImpProv_2]) REFERENCES [dbo].[Provinces] ([Id]);


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_3]...';


GO
ALTER TABLE [dbo].[BillingMilestones] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_3] FOREIGN KEY ([IdImpProv_3]) REFERENCES [dbo].[Provinces] ([Id]);


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestones_dbo.SolFacStates]...';


GO
ALTER TABLE [dbo].[BillingMilestones] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.SolFacStates] FOREIGN KEY ([IdSolFacState]) REFERENCES [dbo].[SolFacStates] ([Id]);


GO
PRINT N'Creando [dbo].[FK_dbo.CustomerServices_dbo.Customers_IdCustomer]...';


GO
ALTER TABLE [dbo].[CustomerServices] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.CustomerServices_dbo.Customers_IdCustomer] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customers] ([Id]);


GO
PRINT N'Creando [dbo].[FK_dbo.CustomerServices_dbo.Status_IdStatus]...';


GO
ALTER TABLE [dbo].[CustomerServices] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.CustomerServices_dbo.Status_IdStatus] FOREIGN KEY ([IdStatus]) REFERENCES [dbo].[Status] ([Id]);


GO
PRINT N'Creando [dbo].[FK_dbo.Projects_dbo.Customers_IdCustomer]...';


GO
ALTER TABLE [dbo].[Projects] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Projects_dbo.Customers_IdCustomer] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customers] ([Id]);


GO
PRINT N'Creando [dbo].[FK_dbo.Projects_dbo.CustomerServices_IdService]...';


GO
ALTER TABLE [dbo].[Projects] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Projects_dbo.CustomerServices_IdService] FOREIGN KEY ([IdService]) REFERENCES [dbo].[CustomerServices] ([Id]);


GO
PRINT N'Creando [dbo].[SolFacState_State_IdSolFacState]...';


GO
ALTER TABLE [dbo].[SolFacHists] WITH NOCHECK
    ADD CONSTRAINT [SolFacState_State_IdSolFacState] FOREIGN KEY ([IdSolFacState]) REFERENCES [dbo].[SolFacStates] ([Id]);


GO
PRINT N'Creando [dbo].[SolFacState_User_IdUser]...';


GO
ALTER TABLE [dbo].[SolFacHists] WITH NOCHECK
    ADD CONSTRAINT [SolFacState_User_IdUser] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[Users] ([Id]);


GO
PRINT N'Creando [dbo].[SolFacState_BillingMilestones_IdBillingMilestone]...';


GO
ALTER TABLE [dbo].[SolFacHists] WITH NOCHECK
    ADD CONSTRAINT [SolFacState_BillingMilestones_IdBillingMilestone] FOREIGN KEY ([IdBillingMilestone]) REFERENCES [dbo].[BillingMilestones] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creando [dbo].[UserProfile_IdProfile]...';


GO
ALTER TABLE [dbo].[UserProfiles] WITH NOCHECK
    ADD CONSTRAINT [UserProfile_IdProfile] FOREIGN KEY ([Profile_Id]) REFERENCES [dbo].[Profiles] ([Id]);


GO
PRINT N'Creando [dbo].[UserProfile_IdUser]...';


GO
ALTER TABLE [dbo].[UserProfiles] WITH NOCHECK
    ADD CONSTRAINT [UserProfile_IdUser] FOREIGN KEY ([User_Id]) REFERENCES [dbo].[Users] ([Id]);


GO
PRINT N'Creando [dbo].[fk_users_profiles_idProfile]...';


GO
ALTER TABLE [dbo].[Users] WITH NOCHECK
    ADD CONSTRAINT [fk_users_profiles_idProfile] FOREIGN KEY ([Id]) REFERENCES [dbo].[Profiles] ([Id]);


GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
ALTER TABLE [dbo].[BillingMilestoneDetails] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestoneDetails_dbo.CurrencySigns_IdCurrencySign];

ALTER TABLE [dbo].[BillingMilestoneDetails] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestoneDetails_dbo.BillingMilestones_IdBillingMilestone];

ALTER TABLE [dbo].[BillingMilestones] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestones_dbo.CustomerServices_IdService];

ALTER TABLE [dbo].[BillingMilestones] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestones_dbo.Customers_IdCustomer];

ALTER TABLE [dbo].[BillingMilestones] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestones_dbo.DocumentTypes_IdDocumentType];

ALTER TABLE [dbo].[BillingMilestones] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestones_dbo.PaymentMethods_IdPaymentMethod];

ALTER TABLE [dbo].[BillingMilestones] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestones_dbo.Projects_IdProject];

ALTER TABLE [dbo].[BillingMilestones] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_1];

ALTER TABLE [dbo].[BillingMilestones] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_2];

ALTER TABLE [dbo].[BillingMilestones] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_3];

ALTER TABLE [dbo].[BillingMilestones] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestones_dbo.SolFacStates];

ALTER TABLE [dbo].[CustomerServices] WITH CHECK CHECK CONSTRAINT [FK_dbo.CustomerServices_dbo.Customers_IdCustomer];

ALTER TABLE [dbo].[CustomerServices] WITH CHECK CHECK CONSTRAINT [FK_dbo.CustomerServices_dbo.Status_IdStatus];

ALTER TABLE [dbo].[Projects] WITH CHECK CHECK CONSTRAINT [FK_dbo.Projects_dbo.Customers_IdCustomer];

ALTER TABLE [dbo].[Projects] WITH CHECK CHECK CONSTRAINT [FK_dbo.Projects_dbo.CustomerServices_IdService];

ALTER TABLE [dbo].[SolFacHists] WITH CHECK CHECK CONSTRAINT [SolFacState_State_IdSolFacState];

ALTER TABLE [dbo].[SolFacHists] WITH CHECK CHECK CONSTRAINT [SolFacState_User_IdUser];

ALTER TABLE [dbo].[SolFacHists] WITH CHECK CHECK CONSTRAINT [SolFacState_BillingMilestones_IdBillingMilestone];

ALTER TABLE [dbo].[UserProfiles] WITH CHECK CHECK CONSTRAINT [UserProfile_IdProfile];

ALTER TABLE [dbo].[UserProfiles] WITH CHECK CHECK CONSTRAINT [UserProfile_IdUser];

ALTER TABLE [dbo].[Users] WITH CHECK CHECK CONSTRAINT [fk_users_profiles_idProfile];


GO
PRINT N'Actualización completada.';


GO

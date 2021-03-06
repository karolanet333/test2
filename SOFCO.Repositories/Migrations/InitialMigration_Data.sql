/*
Este script se creó con Visual Studio el 11/04/2017 a las 9:54.
Ejecute el script en (localdb)\MSSQLLocalDB.SOFCOAR (SOFRECOM\CFaedo) para que sea igual que sofrelab-sql1.cloudapp.net.SOFCO (materiales).
Este script realiza las acciones en el siguiente orden:
1. Deshabilita las restricciones de clave externa.
2. Ejecuta los comandos DELETE. 
3. Ejecuta los comandos UPDATE.
4. Ejecuta los comandos INSERT.
5. Habilita de nuevo las restricciones de clave externa.
Realice una copia de seguridad de la base de datos de destino antes de ejecutar este script.
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*Puntero usado para actualizaciones de texto o imágenes. Puede que no sea necesario, pero se declara aquí por si lo fuera*/
DECLARE @pv binary(16)
BEGIN TRANSACTION
ALTER TABLE [dbo].[CustomerServices] DROP CONSTRAINT [FK_dbo.CustomerServices_dbo.Customers_IdCustomer]
ALTER TABLE [dbo].[CustomerServices] DROP CONSTRAINT [FK_dbo.CustomerServices_dbo.Status_IdStatus]
ALTER TABLE [dbo].[BillingMilestoneDetails] DROP CONSTRAINT [FK_dbo.BillingMilestoneDetails_dbo.BillingMilestones_IdBillingMilestone]
ALTER TABLE [dbo].[BillingMilestoneDetails] DROP CONSTRAINT [FK_dbo.BillingMilestoneDetails_dbo.CurrencySigns_IdCurrencySign]
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_dbo.Projects_dbo.Customers_IdCustomer]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Customers_IdCustomer]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.DocumentTypes_IdDocumentType]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_1]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_2]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_3]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.PaymentMethods_IdPaymentMethod]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Projects_IdProject]
SET IDENTITY_INSERT [dbo].[Provinces] ON
INSERT INTO [dbo].[Provinces] ([Id], [Name]) VALUES (1, N'Buenos Aires')
INSERT INTO [dbo].[Provinces] ([Id], [Name]) VALUES (2, N'CABA')
INSERT INTO [dbo].[Provinces] ([Id], [Name]) VALUES (3, N'Mendoza')
INSERT INTO [dbo].[Provinces] ([Id], [Name]) VALUES (4, N'Cordoba')
SET IDENTITY_INSERT [dbo].[Provinces] OFF
SET IDENTITY_INSERT [dbo].[BillingMilestones] ON
INSERT INTO [dbo].[BillingMilestones] ([Id], [IdProject], [IdCustomer], [ScheduledDate], [Status], [CustomerDescription], [CustomerContact], [CustomerPhone], [ProjectName], [Plazo], [PaymentMethodDescription], [ImporteBruto], [Iva21], [ImporteBrutoMasIva21], [Total], [ImpCapital], [ImpProvBsAs], [ImpOtrasProv_1], [ImpOtrasProv_2], [ImpOtrasProv_3], [IdImpProv_1], [IdImpProv_2], [IdImpProv_3], [IdPaymentMethod], [Name], [ContractNumber], [IdDocumentType], [ApplicantName]) VALUES (1, 1, 1, '20170403 17:59:45.533', N'Activo', N'Cust Descrip', N'Juan Perez 15-4494-3323', N'4202-5589', N'Proj Name', 500, N'2', 800.00, 2100.00, 502100.00, 600000.00, 20.00, 10.00, 5.00, 0.00, 1.00, 4, 2, 3, 1, N'Proj Name333444', 333444, 2, N'Ana María Zunino.-')
SET IDENTITY_INSERT [dbo].[BillingMilestones] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT INTO [dbo].[Customers] ([Id], [Name]) VALUES (1, N'Techint')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Projects] ON
INSERT INTO [dbo].[Projects] ([Id], [Name], [IdCustomer], [Description], [StartDate], [EndDate], [ProjectManager], [IdTypeService], [IdTypeSolution], [IdTypeTecnology], [EstimatedEarnings], [Analytics], [PurchaseOrder], [Link]) VALUES (1, N'testing', 1, N'', '20170403 17:58:06.770', '20170403 17:58:06.770', N'ezequiel', 1, 2, 2, 1, N'', N'', N'')
SET IDENTITY_INSERT [dbo].[Projects] OFF
SET IDENTITY_INSERT [dbo].[CurrencySigns] ON
INSERT INTO [dbo].[CurrencySigns] ([Id], [Name]) VALUES (1, N'$')
INSERT INTO [dbo].[CurrencySigns] ([Id], [Name]) VALUES (2, N'U$S')
INSERT INTO [dbo].[CurrencySigns] ([Id], [Name]) VALUES (3, N'EUR')
SET IDENTITY_INSERT [dbo].[CurrencySigns] OFF
SET IDENTITY_INSERT [dbo].[BillingMilestoneDetails] ON
INSERT INTO [dbo].[BillingMilestoneDetails] ([Id], [IdBillingMilestone], [Name], [Order], [Detail], [IdCurrencySign], [Quantity], [UnitPrice], [SubTotal], [CurrencySignName]) VALUES (1, 1, N'01-Detalle 1', 1, N'Detalle 1', 1, 1, 200.00, 200.00, NULL)
INSERT INTO [dbo].[BillingMilestoneDetails] ([Id], [IdBillingMilestone], [Name], [Order], [Detail], [IdCurrencySign], [Quantity], [UnitPrice], [SubTotal], [CurrencySignName]) VALUES (2, 1, N'02-Detalle 2', 2, N'Detalle 2', 1, 2, 300.00, 600.00, NULL)
SET IDENTITY_INSERT [dbo].[BillingMilestoneDetails] OFF
SET IDENTITY_INSERT [dbo].[CustomerServices] ON
INSERT INTO [dbo].[CustomerServices] ([Id], [Name], [IdStatus], [IdCustomer], [Description], [StartDate], [EndDate]) VALUES (1, N'testing', 1, 1, N'', '20170403 17:00:54.500', '20170403 17:00:54.500')
INSERT INTO [dbo].[CustomerServices] ([Id], [Name], [IdStatus], [IdCustomer], [Description], [StartDate], [EndDate]) VALUES (2, N'servicio 1', 1, 1, N'servicio 1 descrip', '20170405 12:35:20.707', '20170405 12:35:20.707')
SET IDENTITY_INSERT [dbo].[CustomerServices] OFF
SET IDENTITY_INSERT [dbo].[Status] ON
INSERT INTO [dbo].[Status] ([Id], [Name]) VALUES (1, N'Activo')
INSERT INTO [dbo].[Status] ([Id], [Name]) VALUES (2, N'Inactivo')
SET IDENTITY_INSERT [dbo].[Status] OFF
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON
INSERT INTO [dbo].[PaymentMethods] ([Id], [Name]) VALUES (1, N'Efectivo')
INSERT INTO [dbo].[PaymentMethods] ([Id], [Name]) VALUES (2, N'Transferencia')
INSERT INTO [dbo].[PaymentMethods] ([Id], [Name]) VALUES (3, N'Cheque')
INSERT INTO [dbo].[PaymentMethods] ([Id], [Name]) VALUES (4, N'Tarjeta de Credito')
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
SET IDENTITY_INSERT [dbo].[DocumentTypes] ON
INSERT INTO [dbo].[DocumentTypes] ([Id], [Name]) VALUES (1, N'Nota de Crédito')
INSERT INTO [dbo].[DocumentTypes] ([Id], [Name]) VALUES (2, N'Factura')
INSERT INTO [dbo].[DocumentTypes] ([Id], [Name]) VALUES (3, N'Nota de Débito')
SET IDENTITY_INSERT [dbo].[DocumentTypes] OFF
ALTER TABLE [dbo].[CustomerServices]
    ADD CONSTRAINT [FK_dbo.CustomerServices_dbo.Customers_IdCustomer] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customers] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[CustomerServices]
    ADD CONSTRAINT [FK_dbo.CustomerServices_dbo.Status_IdStatus] FOREIGN KEY ([IdStatus]) REFERENCES [dbo].[Status] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[BillingMilestoneDetails]
    ADD CONSTRAINT [FK_dbo.BillingMilestoneDetails_dbo.BillingMilestones_IdBillingMilestone] FOREIGN KEY ([IdBillingMilestone]) REFERENCES [dbo].[BillingMilestones] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[BillingMilestoneDetails]
    ADD CONSTRAINT [FK_dbo.BillingMilestoneDetails_dbo.CurrencySigns_IdCurrencySign] FOREIGN KEY ([IdCurrencySign]) REFERENCES [dbo].[CurrencySigns] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[Projects]
    ADD CONSTRAINT [FK_dbo.Projects_dbo.Customers_IdCustomer] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customers] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Customers_IdCustomer] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customers] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.DocumentTypes_IdDocumentType] FOREIGN KEY ([IdDocumentType]) REFERENCES [dbo].[DocumentTypes] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_1] FOREIGN KEY ([IdImpProv_1]) REFERENCES [dbo].[Provinces] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_2] FOREIGN KEY ([IdImpProv_2]) REFERENCES [dbo].[Provinces] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_3] FOREIGN KEY ([IdImpProv_3]) REFERENCES [dbo].[Provinces] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.PaymentMethods_IdPaymentMethod] FOREIGN KEY ([IdPaymentMethod]) REFERENCES [dbo].[PaymentMethods] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Projects_IdProject] FOREIGN KEY ([IdProject]) REFERENCES [dbo].[Projects] ([Id]) ON DELETE CASCADE
COMMIT TRANSACTION

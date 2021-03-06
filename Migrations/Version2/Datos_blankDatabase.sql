/*
Este script se creó con Visual Studio el 25/04/2017 a las 10:43.
Ejecute el script en (localdb)\MSSQLLocalDB.Blank (SOFRECOM\CFaedo) para que sea igual que (localdb)\MSSQLLocalDB.SOFCO (SOFRECOM\CFaedo).
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
ALTER TABLE [dbo].[UserProfiles] DROP CONSTRAINT [UserProfile_IdProfile]
ALTER TABLE [dbo].[UserProfiles] DROP CONSTRAINT [UserProfile_IdUser]
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [fk_users_profiles_idProfile]
ALTER TABLE [dbo].[BillingMilestoneDetails] DROP CONSTRAINT [FK_dbo.BillingMilestoneDetails_dbo.CurrencySigns_IdCurrencySign]
ALTER TABLE [dbo].[BillingMilestoneDetails] DROP CONSTRAINT [FK_dbo.BillingMilestoneDetails_dbo.BillingMilestones_IdBillingMilestone]
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_dbo.Projects_dbo.Customers_IdCustomer]
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_dbo.Projects_dbo.CustomerServices_IdService]
ALTER TABLE [dbo].[CustomerServices] DROP CONSTRAINT [FK_dbo.CustomerServices_dbo.Customers_IdCustomer]
ALTER TABLE [dbo].[CustomerServices] DROP CONSTRAINT [FK_dbo.CustomerServices_dbo.Status_IdStatus]
ALTER TABLE [dbo].[SolFacHists] DROP CONSTRAINT [SolFacState_State_IdSolFacState]
ALTER TABLE [dbo].[SolFacHists] DROP CONSTRAINT [SolFacState_User_IdUser]
ALTER TABLE [dbo].[SolFacHists] DROP CONSTRAINT [SolFacState_BillingMilestones_IdBillingMilestone]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.CustomerServices_IdService]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Customers_IdCustomer]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.DocumentTypes_IdDocumentType]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.PaymentMethods_IdPaymentMethod]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Projects_IdProject]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_1]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_2]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_3]
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.SolFacStates]
SET IDENTITY_INSERT [dbo].[BillingMilestones] ON
INSERT INTO [dbo].[BillingMilestones] ([Id], [IdProject], [IdCustomer], [ScheduledDate], [Status], [CustomerDescription], [CustomerContact], [CustomerPhone], [ProjectName], [Plazo], [PaymentMethodDescription], [ImporteBruto], [Iva21], [ImporteBrutoMasIva21], [Total], [comments], [ImpCapital], [ImpProvBsAs], [ImpOtrasProv_1], [ImpOtrasProv_2], [ImpOtrasProv_3], [IdImpProv_1], [IdImpProv_2], [IdImpProv_3], [IdPaymentMethod], [Name], [ContractNumber], [IdDocumentType], [ApplicantName], [Monto], [IdService], [CurrState], [IdSolFacState]) VALUES (5007, 1, 1, '20170424 14:27:40.603', N'Activo', NULL, NULL, NULL, NULL, 0, NULL, 12000.00, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, N'Serv1 Proj1 Hito1.-', 0, 1, NULL, 42000.00, 1, N'FIN', 5)
INSERT INTO [dbo].[BillingMilestones] ([Id], [IdProject], [IdCustomer], [ScheduledDate], [Status], [CustomerDescription], [CustomerContact], [CustomerPhone], [ProjectName], [Plazo], [PaymentMethodDescription], [ImporteBruto], [Iva21], [ImporteBrutoMasIva21], [Total], [comments], [ImpCapital], [ImpProvBsAs], [ImpOtrasProv_1], [ImpOtrasProv_2], [ImpOtrasProv_3], [IdImpProv_1], [IdImpProv_2], [IdImpProv_3], [IdPaymentMethod], [Name], [ContractNumber], [IdDocumentType], [ApplicantName], [Monto], [IdService], [CurrState], [IdSolFacState]) VALUES (5008, 1, 1, '20170424 14:49:42.817', N'Activo', NULL, NULL, NULL, NULL, 0, NULL, 0.00, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, N'Serv1 Proj1 Hito2', 0, 1, NULL, 3000.00, 1, N'REV_FINAN', 3)
INSERT INTO [dbo].[BillingMilestones] ([Id], [IdProject], [IdCustomer], [ScheduledDate], [Status], [CustomerDescription], [CustomerContact], [CustomerPhone], [ProjectName], [Plazo], [PaymentMethodDescription], [ImporteBruto], [Iva21], [ImporteBrutoMasIva21], [Total], [comments], [ImpCapital], [ImpProvBsAs], [ImpOtrasProv_1], [ImpOtrasProv_2], [ImpOtrasProv_3], [IdImpProv_1], [IdImpProv_2], [IdImpProv_3], [IdPaymentMethod], [Name], [ContractNumber], [IdDocumentType], [ApplicantName], [Monto], [IdService], [CurrState], [IdSolFacState]) VALUES (5009, 1002, 1, '20170425 12:35:04.607', N'Activo', NULL, NULL, NULL, NULL, 0, NULL, 50.00, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, N'Cli1 Serv 1003 Proj 1002 - Hito 1.-', 0, 1, NULL, 6555.00, 1003, N'REV_PRESUP', 2)
INSERT INTO [dbo].[BillingMilestones] ([Id], [IdProject], [IdCustomer], [ScheduledDate], [Status], [CustomerDescription], [CustomerContact], [CustomerPhone], [ProjectName], [Plazo], [PaymentMethodDescription], [ImporteBruto], [Iva21], [ImporteBrutoMasIva21], [Total], [comments], [ImpCapital], [ImpProvBsAs], [ImpOtrasProv_1], [ImpOtrasProv_2], [ImpOtrasProv_3], [IdImpProv_1], [IdImpProv_2], [IdImpProv_3], [IdPaymentMethod], [Name], [ContractNumber], [IdDocumentType], [ApplicantName], [Monto], [IdService], [CurrState], [IdSolFacState]) VALUES (5010, 1002, 1, '20170425 13:11:46.320', N'Activo', NULL, NULL, NULL, NULL, 0, NULL, 3000.00, 0.00, 0.00, 0.00, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, 1, N'Cli1 Serv 1003 Proj 1002 Hito 2', 0, 1, NULL, 555.00, 1003, N'FACT', 4)
SET IDENTITY_INSERT [dbo].[BillingMilestones] OFF
SET IDENTITY_INSERT [dbo].[SolFacHists] ON
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2005, 5007, 1, '20170424 11:28:27.330', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2006, 5007, 1, '20170424 11:28:45.043', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2007, 5007, 2, '20170424 11:29:58.553', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2008, 5007, 3, '20170424 11:30:17.800', 2, 1)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2009, 5007, 2, '20170424 11:30:27.987', 3, 1)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2010, 5007, 1, '20170424 11:31:31.600', 2, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2011, 5007, 2, '20170424 11:31:39.517', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2012, 5007, 3, '20170424 11:31:54.980', 2, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2013, 5007, 4, '20170424 11:32:06.320', 3, 1)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2014, 5007, 3, '20170424 11:32:13.310', 4, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2015, 5007, 4, '20170424 11:32:19.713', 3, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2016, 5007, 5, '20170424 11:32:23.803', 4, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2017, 5008, 1, '20170424 11:52:57.000', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2018, 5008, 2, '20170424 13:34:53.070', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2019, 5008, 3, '20170424 13:39:07.907', 2, 1)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2020, 5008, 2, '20170424 13:42:56.617', 3, 1)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2021, 5008, 1, '20170424 13:44:07.813', 2, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2022, 5008, 2, '20170424 13:50:06.513', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2023, 5008, 3, '20170424 13:50:36.157', 2, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2024, 5009, 1, '20170425 09:35:45.163', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2025, 5009, 1, '20170425 09:36:00.207', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2026, 5009, 2, '20170425 09:36:29.457', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2027, 5009, 1, '20170425 09:36:55.340', 2, 1)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2028, 5009, 2, '20170425 09:37:42.147', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2029, 5010, 1, '20170425 10:15:19.980', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2030, 5010, 2, '20170425 10:15:39.843', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2031, 5010, 1, '20170425 10:16:08.753', 2, 1)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2032, 5010, 2, '20170425 10:16:45.353', 1, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2033, 5010, 3, '20170425 10:16:53.593', 2, 0)
INSERT INTO [dbo].[SolFacHists] ([Id], [IdBillingMilestone], [IdSolFacState], [Date], [IdUser], [Canceled]) VALUES (2034, 5010, 4, '20170425 10:18:11.950', 3, 0)
SET IDENTITY_INSERT [dbo].[SolFacHists] OFF
SET IDENTITY_INSERT [dbo].[SolFacStates] ON
INSERT INTO [dbo].[SolFacStates] ([Id], [Name], [Code], [ProfileAllowed], [NextState], [PrevState], [ShortName]) VALUES (1, N'Pendiente', N'PEND', N'SOLFAC_GEN', N'REV_PRESUP', NULL, N'Pendiente')
INSERT INTO [dbo].[SolFacStates] ([Id], [Name], [Code], [ProfileAllowed], [NextState], [PrevState], [ShortName]) VALUES (2, N'En Revisión Control Presupuestario', N'REV_PRESUP', N'CONTROL_PRESUP', N'REV_FINAN', N'PEND', N'Rev Ctrl Presup')
INSERT INTO [dbo].[SolFacStates] ([Id], [Name], [Code], [ProfileAllowed], [NextState], [PrevState], [ShortName]) VALUES (3, N'En Revisión Finanzas', N'REV_FINAN', N'REVISION_FINANZAS', N'FACT', N'REV_PRESUP', N'Rev Ctrl Finanzas')
INSERT INTO [dbo].[SolFacStates] ([Id], [Name], [Code], [ProfileAllowed], [NextState], [PrevState], [ShortName]) VALUES (4, N'Facturación', N'FACT', N'FACTURACION', N'FIN', N'REV_FINAN', N'Facturación')
INSERT INTO [dbo].[SolFacStates] ([Id], [Name], [Code], [ProfileAllowed], [NextState], [PrevState], [ShortName]) VALUES (5, N'Finalizado', N'FIN', NULL, NULL, N'FACT', N'Finalizado')
SET IDENTITY_INSERT [dbo].[SolFacStates] OFF
SET IDENTITY_INSERT [dbo].[CustomerServices] ON
INSERT INTO [dbo].[CustomerServices] ([Id], [Name], [IdStatus], [IdCustomer], [Description], [StartDate], [EndDate]) VALUES (1, N'servicio 1', 1, 1, N'', '20170403 17:00:54.500', '20170403 17:00:54.500')
INSERT INTO [dbo].[CustomerServices] ([Id], [Name], [IdStatus], [IdCustomer], [Description], [StartDate], [EndDate]) VALUES (2, N'servicio 2', 1, 1, N'servicio 1 descrip', '20170405 12:35:20.707', '20170405 12:35:20.707')
INSERT INTO [dbo].[CustomerServices] ([Id], [Name], [IdStatus], [IdCustomer], [Description], [StartDate], [EndDate]) VALUES (3, N'servicio 3', 1, 1, N'descrip del servicio 2', '20170418 13:53:18.817', '20170418 13:53:18.817')
INSERT INTO [dbo].[CustomerServices] ([Id], [Name], [IdStatus], [IdCustomer], [Description], [StartDate], [EndDate]) VALUES (1003, N'Servicio 1003', 1, 1, N'descrip serv 3', '20170418 14:41:45.030', '20170418 14:41:45.030')
SET IDENTITY_INSERT [dbo].[CustomerServices] OFF
SET IDENTITY_INSERT [dbo].[Projects] ON
INSERT INTO [dbo].[Projects] ([Id], [Name], [IdCustomer], [Description], [StartDate], [EndDate], [ProjectManager], [IdTypeService], [IdTypeSolution], [IdTypeTecnology], [EstimatedEarnings], [Analytics], [PurchaseOrder], [Link], [IdService]) VALUES (1, N'serv1 proj 1', 1, N'', '20170403 17:58:06.770', '20170403 17:58:06.770', N'ezequiel', 1, 2, 2, 1, N'', N'', N'', 1)
INSERT INTO [dbo].[Projects] ([Id], [Name], [IdCustomer], [Description], [StartDate], [EndDate], [ProjectManager], [IdTypeService], [IdTypeSolution], [IdTypeTecnology], [EstimatedEarnings], [Analytics], [PurchaseOrder], [Link], [IdService]) VALUES (5, N'serv2 proj 2', 1, N'descrip 2', '20170418 15:00:22.337', '20170418 15:00:22.337', N'gerente 2', 1, 2, 2, 6000, N'2233', N'23422', N'fffsdgfsdgfsd', 2)
INSERT INTO [dbo].[Projects] ([Id], [Name], [IdCustomer], [Description], [StartDate], [EndDate], [ProjectManager], [IdTypeService], [IdTypeSolution], [IdTypeTecnology], [EstimatedEarnings], [Analytics], [PurchaseOrder], [Link], [IdService]) VALUES (6, N'serv3 proj 3', 1, N'Descrip 1', '20170418 15:22:08.333', '20170418 15:22:08.333', N'gerente 1', 1, 2, 2, 3000, N'3044', N'3455', N'kjfdsakjfsalk', 3)
INSERT INTO [dbo].[Projects] ([Id], [Name], [IdCustomer], [Description], [StartDate], [EndDate], [ProjectManager], [IdTypeService], [IdTypeSolution], [IdTypeTecnology], [EstimatedEarnings], [Analytics], [PurchaseOrder], [Link], [IdService]) VALUES (1002, N'Cli 1 serv 2 proj x', 1, N'Cli 1 serv 1003 proj x Descrip', '20170418 20:42:59.323', '20170418 20:42:59.323', N'Gerente x', 1, 2, 2, 5555, N'4444', N'33333', N'dfsdfgsdf', 1003)
SET IDENTITY_INSERT [dbo].[Projects] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT INTO [dbo].[Customers] ([Id], [Name]) VALUES (1, N'Techint')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[DocumentTypes] ON
INSERT INTO [dbo].[DocumentTypes] ([Id], [Name]) VALUES (1, N'Nota de Crédito')
INSERT INTO [dbo].[DocumentTypes] ([Id], [Name]) VALUES (2, N'Factura')
INSERT INTO [dbo].[DocumentTypes] ([Id], [Name]) VALUES (3, N'Nota de Débito')
SET IDENTITY_INSERT [dbo].[DocumentTypes] OFF
SET IDENTITY_INSERT [dbo].[CurrencySigns] ON
INSERT INTO [dbo].[CurrencySigns] ([Id], [Name]) VALUES (1, N'$')
INSERT INTO [dbo].[CurrencySigns] ([Id], [Name]) VALUES (2, N'U$S')
INSERT INTO [dbo].[CurrencySigns] ([Id], [Name]) VALUES (3, N'EUR')
SET IDENTITY_INSERT [dbo].[CurrencySigns] OFF
SET IDENTITY_INSERT [dbo].[BillingMilestoneDetails] ON
INSERT INTO [dbo].[BillingMilestoneDetails] ([Id], [IdBillingMilestone], [Name], [Order], [Detail], [IdCurrencySign], [Quantity], [UnitPrice], [SubTotal], [CurrencySignName]) VALUES (2003, 5007, NULL, 0, N'Detalle 2 5007', 1, 1, 6000.00, 6000.00, NULL)
INSERT INTO [dbo].[BillingMilestoneDetails] ([Id], [IdBillingMilestone], [Name], [Order], [Detail], [IdCurrencySign], [Quantity], [UnitPrice], [SubTotal], [CurrencySignName]) VALUES (2004, 5009, NULL, 0, N'Detalle 1', 1, 50, 1.00, 50.00, NULL)
INSERT INTO [dbo].[BillingMilestoneDetails] ([Id], [IdBillingMilestone], [Name], [Order], [Detail], [IdCurrencySign], [Quantity], [UnitPrice], [SubTotal], [CurrencySignName]) VALUES (2005, 5010, NULL, 0, N'Analisis', 1, 1, 3000.00, 3000.00, NULL)
SET IDENTITY_INSERT [dbo].[BillingMilestoneDetails] OFF
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON
INSERT INTO [dbo].[PaymentMethods] ([Id], [Name]) VALUES (1, N'Efectivo')
INSERT INTO [dbo].[PaymentMethods] ([Id], [Name]) VALUES (2, N'Transferencia')
INSERT INTO [dbo].[PaymentMethods] ([Id], [Name]) VALUES (3, N'Cheque')
INSERT INTO [dbo].[PaymentMethods] ([Id], [Name]) VALUES (4, N'Tarjeta de Credito')
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT INTO [dbo].[Users] ([Id], [Name], [IdProfile]) VALUES (1, N'Generador de SolFac', 2)
INSERT INTO [dbo].[Users] ([Id], [Name], [IdProfile]) VALUES (2, N'Revision Control Presup', 3)
INSERT INTO [dbo].[Users] ([Id], [Name], [IdProfile]) VALUES (3, N'Revision Finanzas', 4)
INSERT INTO [dbo].[Users] ([Id], [Name], [IdProfile]) VALUES (4, N'Facturacion', 5)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserProfiles] ON
INSERT INTO [dbo].[UserProfiles] ([Id], [Profile_Id], [User_Id]) VALUES (1, 1, 1)
INSERT INTO [dbo].[UserProfiles] ([Id], [Profile_Id], [User_Id]) VALUES (2, 2, 2)
INSERT INTO [dbo].[UserProfiles] ([Id], [Profile_Id], [User_Id]) VALUES (3, 3, 3)
SET IDENTITY_INSERT [dbo].[UserProfiles] OFF
SET IDENTITY_INSERT [dbo].[Provinces] ON
INSERT INTO [dbo].[Provinces] ([Id], [Name]) VALUES (1, N'Buenos Aires')
INSERT INTO [dbo].[Provinces] ([Id], [Name]) VALUES (2, N'CABA')
INSERT INTO [dbo].[Provinces] ([Id], [Name]) VALUES (3, N'Mendoza')
INSERT INTO [dbo].[Provinces] ([Id], [Name]) VALUES (4, N'Cordoba')
SET IDENTITY_INSERT [dbo].[Provinces] OFF
SET IDENTITY_INSERT [dbo].[Profiles] ON
INSERT INTO [dbo].[Profiles] ([Id], [Code], [Name]) VALUES (1, N'ADMIN', N'Administrador')
INSERT INTO [dbo].[Profiles] ([Id], [Code], [Name]) VALUES (2, N'SOLFAC_GEN', N'Generador de SolFac')
INSERT INTO [dbo].[Profiles] ([Id], [Code], [Name]) VALUES (3, N'CONTROL_PRESUP', N'Control Presupuestario')
INSERT INTO [dbo].[Profiles] ([Id], [Code], [Name]) VALUES (4, N'REVISION_FINANZAS', N'Revision Finanzas')
INSERT INTO [dbo].[Profiles] ([Id], [Code], [Name]) VALUES (5, N'FACTURACION', N'Facturación')
SET IDENTITY_INSERT [dbo].[Profiles] OFF
SET IDENTITY_INSERT [dbo].[Status] ON
INSERT INTO [dbo].[Status] ([Id], [Name]) VALUES (1, N'Activo')
INSERT INTO [dbo].[Status] ([Id], [Name]) VALUES (2, N'Inactivo')
SET IDENTITY_INSERT [dbo].[Status] OFF
ALTER TABLE [dbo].[UserProfiles]
    ADD CONSTRAINT [UserProfile_IdProfile] FOREIGN KEY ([Profile_Id]) REFERENCES [dbo].[Profiles] ([Id])
ALTER TABLE [dbo].[UserProfiles]
    ADD CONSTRAINT [UserProfile_IdUser] FOREIGN KEY ([User_Id]) REFERENCES [dbo].[Users] ([Id])
ALTER TABLE [dbo].[Users]
    ADD CONSTRAINT [fk_users_profiles_idProfile] FOREIGN KEY ([Id]) REFERENCES [dbo].[Profiles] ([Id])
ALTER TABLE [dbo].[BillingMilestoneDetails]
    ADD CONSTRAINT [FK_dbo.BillingMilestoneDetails_dbo.CurrencySigns_IdCurrencySign] FOREIGN KEY ([IdCurrencySign]) REFERENCES [dbo].[CurrencySigns] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[BillingMilestoneDetails]
    ADD CONSTRAINT [FK_dbo.BillingMilestoneDetails_dbo.BillingMilestones_IdBillingMilestone] FOREIGN KEY ([IdBillingMilestone]) REFERENCES [dbo].[BillingMilestones] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[Projects]
    ADD CONSTRAINT [FK_dbo.Projects_dbo.Customers_IdCustomer] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customers] ([Id])
ALTER TABLE [dbo].[Projects]
    ADD CONSTRAINT [FK_dbo.Projects_dbo.CustomerServices_IdService] FOREIGN KEY ([IdService]) REFERENCES [dbo].[CustomerServices] ([Id])
ALTER TABLE [dbo].[CustomerServices]
    ADD CONSTRAINT [FK_dbo.CustomerServices_dbo.Customers_IdCustomer] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customers] ([Id])
ALTER TABLE [dbo].[CustomerServices]
    ADD CONSTRAINT [FK_dbo.CustomerServices_dbo.Status_IdStatus] FOREIGN KEY ([IdStatus]) REFERENCES [dbo].[Status] ([Id])
ALTER TABLE [dbo].[SolFacHists]
    ADD CONSTRAINT [SolFacState_State_IdSolFacState] FOREIGN KEY ([IdSolFacState]) REFERENCES [dbo].[SolFacStates] ([Id])
ALTER TABLE [dbo].[SolFacHists]
    ADD CONSTRAINT [SolFacState_User_IdUser] FOREIGN KEY ([IdUser]) REFERENCES [dbo].[Users] ([Id])
ALTER TABLE [dbo].[SolFacHists]
    ADD CONSTRAINT [SolFacState_BillingMilestones_IdBillingMilestone] FOREIGN KEY ([IdBillingMilestone]) REFERENCES [dbo].[BillingMilestones] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.CustomerServices_IdService] FOREIGN KEY ([IdService]) REFERENCES [dbo].[CustomerServices] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Customers_IdCustomer] FOREIGN KEY ([IdCustomer]) REFERENCES [dbo].[Customers] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.DocumentTypes_IdDocumentType] FOREIGN KEY ([IdDocumentType]) REFERENCES [dbo].[DocumentTypes] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.PaymentMethods_IdPaymentMethod] FOREIGN KEY ([IdPaymentMethod]) REFERENCES [dbo].[PaymentMethods] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Projects_IdProject] FOREIGN KEY ([IdProject]) REFERENCES [dbo].[Projects] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_1] FOREIGN KEY ([IdImpProv_1]) REFERENCES [dbo].[Provinces] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_2] FOREIGN KEY ([IdImpProv_2]) REFERENCES [dbo].[Provinces] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_3] FOREIGN KEY ([IdImpProv_3]) REFERENCES [dbo].[Provinces] ([Id])
ALTER TABLE [dbo].[BillingMilestones]
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.SolFacStates] FOREIGN KEY ([IdSolFacState]) REFERENCES [dbo].[SolFacStates] ([Id])
COMMIT TRANSACTION

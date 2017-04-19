/*
Script de implementación para SOFCO

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SOFCO"
:setvar DefaultFilePrefix "SOFCO"
:setvar DefaultDataPath "C:\Users\cfaedo\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\cfaedo\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO

IF (SELECT OBJECT_ID('tempdb..#tmpErrors')) IS NOT NULL DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO
BEGIN TRANSACTION
GO
PRINT N'Quitando [dbo].[BillingMilestones].[IX_IdImpProv_1]...';


GO
DROP INDEX [IX_IdImpProv_1]
    ON [dbo].[BillingMilestones];


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Quitando [dbo].[BillingMilestones].[IX_IdImpProv_2]...';


GO
DROP INDEX [IX_IdImpProv_2]
    ON [dbo].[BillingMilestones];


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Quitando [dbo].[BillingMilestones].[IX_IdImpProv_3]...';


GO
DROP INDEX [IX_IdImpProv_3]
    ON [dbo].[BillingMilestones];


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Quitando [dbo].[FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_1]...';


GO
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_1];


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Quitando [dbo].[FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_2]...';


GO
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_2];


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Quitando [dbo].[FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_3]...';


GO
ALTER TABLE [dbo].[BillingMilestones] DROP CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_3];


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Modificando [dbo].[BillingMilestones]...';


GO
ALTER TABLE [dbo].[BillingMilestones] ALTER COLUMN [IdImpProv_1] INT NULL;

ALTER TABLE [dbo].[BillingMilestones] ALTER COLUMN [IdImpProv_2] INT NULL;

ALTER TABLE [dbo].[BillingMilestones] ALTER COLUMN [IdImpProv_3] INT NULL;


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creando [dbo].[BillingMilestones].[IX_IdImpProv_1]...';


GO
CREATE NONCLUSTERED INDEX [IX_IdImpProv_1]
    ON [dbo].[BillingMilestones]([IdImpProv_1] ASC);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creando [dbo].[BillingMilestones].[IX_IdImpProv_2]...';


GO
CREATE NONCLUSTERED INDEX [IX_IdImpProv_2]
    ON [dbo].[BillingMilestones]([IdImpProv_2] ASC);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creando [dbo].[BillingMilestones].[IX_IdImpProv_3]...';


GO
CREATE NONCLUSTERED INDEX [IX_IdImpProv_3]
    ON [dbo].[BillingMilestones]([IdImpProv_3] ASC);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_1]...';


GO
ALTER TABLE [dbo].[BillingMilestones] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_1] FOREIGN KEY ([IdImpProv_1]) REFERENCES [dbo].[Provinces] ([Id]);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_2]...';


GO
ALTER TABLE [dbo].[BillingMilestones] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_2] FOREIGN KEY ([IdImpProv_2]) REFERENCES [dbo].[Provinces] ([Id]);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO
PRINT N'Creando [dbo].[FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_3]...';


GO
ALTER TABLE [dbo].[BillingMilestones] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_3] FOREIGN KEY ([IdImpProv_3]) REFERENCES [dbo].[Provinces] ([Id]);


GO
IF @@ERROR <> 0
   AND @@TRANCOUNT > 0
    BEGIN
        ROLLBACK;
    END

IF @@TRANCOUNT = 0
    BEGIN
        INSERT  INTO #tmpErrors (Error)
        VALUES                 (1);
        BEGIN TRANSACTION;
    END


GO

IF EXISTS (SELECT * FROM #tmpErrors) ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 BEGIN
PRINT N'La parte de transacción de la actualización de la base de datos se realizó correctamente.'
COMMIT TRANSACTION
END
ELSE PRINT N'Error de la parte de transacción de la actualización de la base de datos.'
GO
DROP TABLE #tmpErrors
GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[BillingMilestones] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_1];

ALTER TABLE [dbo].[BillingMilestones] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_2];

ALTER TABLE [dbo].[BillingMilestones] WITH CHECK CHECK CONSTRAINT [FK_dbo.BillingMilestones_dbo.Provinces_IdImpProv_3];


GO
PRINT N'Actualización completada.';


GO

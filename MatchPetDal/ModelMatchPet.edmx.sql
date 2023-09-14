
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/05/2023 15:40:51
-- Generated from EDMX file: C:\Users\sebas\Documents\RepositoriosGit\MatchPetProyecto\MatchPetDal\ModelMatchPet.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DBMatchpet];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Organizacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Organizacion];
GO
IF OBJECT_ID(N'[dbo].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Organizacion'
CREATE TABLE [dbo].[Organizacion] (
    [idOrganizacion] int IDENTITY(1,1) NOT NULL,
    [nombre] varchar(50)  NULL,
    [activo] bit  NOT NULL,
    [borrado] bit  NOT NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [idUsuario] int IDENTITY(1,1) NOT NULL,
    [nombres] varchar(50)  NULL,
    [apellidos] varchar(50)  NULL,
    [activo] bit  NOT NULL,
    [borrado] bit  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [idOrganizacion] in table 'Organizacion'
ALTER TABLE [dbo].[Organizacion]
ADD CONSTRAINT [PK_Organizacion]
    PRIMARY KEY CLUSTERED ([idOrganizacion] ASC);
GO

-- Creating primary key on [idUsuario] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([idUsuario] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
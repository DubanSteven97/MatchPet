
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/20/2023 12:41:16
-- Generated from EDMX file: C:\Users\Usuario\source\repos\Servicios\MatchPetDal\ModelMatchPet.edmx
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

IF OBJECT_ID(N'[dbo].[FK__Animal__idOrgani__5FB337D6]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Animal] DROP CONSTRAINT [FK__Animal__idOrgani__5FB337D6];
GO
IF OBJECT_ID(N'[dbo].[FK__Animal__idTipoAn__5FB337D6]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Animal] DROP CONSTRAINT [FK__Animal__idTipoAn__5FB337D6];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Animal]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Animal];
GO
IF OBJECT_ID(N'[dbo].[Organizacion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Organizacion];
GO
IF OBJECT_ID(N'[dbo].[TipoAnimal]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoAnimal];
GO
IF OBJECT_ID(N'[dbo].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Animal'
CREATE TABLE [dbo].[Animal] (
    [idAnimal] int IDENTITY(1,1) NOT NULL,
    [idOrganizacion] int  NOT NULL,
    [idTipoAnimal] int  NOT NULL,
    [nombre] varchar(20)  NOT NULL,
    [genero] varchar(20)  NOT NULL,
    [fecha_nacimiento] datetime  NULL,
    [estado] int  NOT NULL
);
GO

-- Creating table 'Organizacion'
CREATE TABLE [dbo].[Organizacion] (
    [idOrganizacion] int IDENTITY(1,1) NOT NULL,
    [nombre] varchar(255)  NOT NULL,
    [descripcion] varchar(255)  NULL,
    [telefono] varchar(10)  NULL,
    [direccion] varchar(255)  NULL,
    [estado] int  NOT NULL
);
GO

-- Creating table 'TipoAnimal'
CREATE TABLE [dbo].[TipoAnimal] (
    [idTipoAnimal] int IDENTITY(1,1) NOT NULL,
    [nombre] varchar(50)  NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [idUsuario] int IDENTITY(1,1) NOT NULL,
    [nombres] varchar(50)  NULL,
    [apellidos] varchar(50)  NULL,
    [estado] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [idAnimal] in table 'Animal'
ALTER TABLE [dbo].[Animal]
ADD CONSTRAINT [PK_Animal]
    PRIMARY KEY CLUSTERED ([idAnimal] ASC);
GO

-- Creating primary key on [idOrganizacion] in table 'Organizacion'
ALTER TABLE [dbo].[Organizacion]
ADD CONSTRAINT [PK_Organizacion]
    PRIMARY KEY CLUSTERED ([idOrganizacion] ASC);
GO

-- Creating primary key on [idTipoAnimal] in table 'TipoAnimal'
ALTER TABLE [dbo].[TipoAnimal]
ADD CONSTRAINT [PK_TipoAnimal]
    PRIMARY KEY CLUSTERED ([idTipoAnimal] ASC);
GO

-- Creating primary key on [idUsuario] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([idUsuario] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [idOrganizacion] in table 'Animal'
ALTER TABLE [dbo].[Animal]
ADD CONSTRAINT [FK__Animal__idOrgani__5FB337D6]
    FOREIGN KEY ([idOrganizacion])
    REFERENCES [dbo].[Organizacion]
        ([idOrganizacion])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Animal__idOrgani__5FB337D6'
CREATE INDEX [IX_FK__Animal__idOrgani__5FB337D6]
ON [dbo].[Animal]
    ([idOrganizacion]);
GO

-- Creating foreign key on [idTipoAnimal] in table 'Animal'
ALTER TABLE [dbo].[Animal]
ADD CONSTRAINT [FK__Animal__idTipoAn__5FB337D6]
    FOREIGN KEY ([idTipoAnimal])
    REFERENCES [dbo].[TipoAnimal]
        ([idTipoAnimal])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Animal__idTipoAn__5FB337D6'
CREATE INDEX [IX_FK__Animal__idTipoAn__5FB337D6]
ON [dbo].[Animal]
    ([idTipoAnimal]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
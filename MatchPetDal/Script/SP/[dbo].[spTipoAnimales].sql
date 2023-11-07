USE [DBMatchpet]
GO
/****** Object:  StoredProcedure [dbo].[spGetAnimales]    Script Date: 20/09/2023 12:54:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Duban Estupiñan>
-- Create date: <19-Sept-2023>
-- Description:	<Consulta de tipo de animales>
-- Consulta de tipo de animales activos (por defecto)
-- =============================================

CREATE   PROCEDURE [dbo].[spTipoAnimales]
WITH RECOMPILE
AS
BEGIN
	SET NOCOUNT ON;

	SELECT o.idTipoAnimal, o.nombre, o.descripcion, o.img, o.fechaCreacion, o.ruta, o.estado FROM TipoAnimal o WHERE o.estado != 0
	
END;
GO



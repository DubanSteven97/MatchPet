USE [DBMatchpet]
GO
/****** Object:  StoredProcedure [dbo].[spGetAnimales]    Script Date: 20/09/2023 12:54:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Juan Benavides>
-- Create date: <19-Sept-2023>
-- Description:	<Consulta de Animales>
-- Consulta de animales activos (por defecto)
-- =============================================

CREATE OR ALTER PROCEDURE [dbo].[spGetAnimales]
WITH RECOMPILE
AS
BEGIN
	SET NOCOUNT ON;

	SELECT	a.idAnimal,
			o.Nombre as organizacion,
			ta.nombre as tipoAnimal,
			a.nombre,
			a.genero,
			a.descripcion,
			a.fecha_nacimiento,
			a.estado
	FROM	dbo.Animal a,
			dbo.TipoAnimal ta,
			dbo.Organizacion o
	WHERE	a.idTipoAnimal = ta.idTipoAnimal
	AND		a.idOrganizacion = o.idOrganizacion
	AND		a.estado = 1 
	
END;

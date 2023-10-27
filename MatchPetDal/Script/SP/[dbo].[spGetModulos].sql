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

CREATE OR ALTER PROCEDURE [dbo].[spGetModulos]
WITH RECOMPILE
AS
BEGIN
	SET NOCOUNT ON;

	SELECT m.idmodulo, m.titulo, m.descripcion, m.icono, m.ruta, m.estado FROM modulo m WHERE m.estado != 0
	
END;

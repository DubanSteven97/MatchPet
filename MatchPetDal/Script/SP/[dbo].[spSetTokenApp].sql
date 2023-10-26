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

CREATE OR ALTER PROCEDURE [dbo].[spSetTokenApp]

	@p_idAplicacion INT,
	@p_token VARCHAR(255),
	@p_expire DATETIME
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE aplicacion
	SET token = @p_token,
	creacion_token = GETDATE(),
	expires_token = @p_expire
	WHERE	idAplicacion = @p_idAplicacion;

	return @@ROWCOUNT;
	
END;

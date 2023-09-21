USE [DBMatchpet]
GO
/****** Object:  StoredProcedure [dbo].[spGetUsuarios]    Script Date: 20/09/2023 12:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Juan Benavides>
-- Create date: <19-Sept-2023>
-- Description:	<Consulta de usuarios>
-- Consulta de usuarios activos (por defecto) por su nombre y apellido
-- =============================================

CREATE OR ALTER PROCEDURE [dbo].[spGetUsuarios]
    @nombres varchar(50),
	@apellidos varchar(50),
	@estado int
WITH RECOMPILE
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @nombres_par varchar(50) = @nombres
	DECLARE @apellidos_par varchar(50) = @apellidos
	DECLARE @estado_par int = @estado

	IF ISNULL(LTRIM(RTRIM(@estado_par)),'') = ''
		BEGIN
			SELECT	top(1) u.idUsuario, u.nombres, u.apellidos, u.estado
			FROM	Usuario u
			WHERE	u.estado = 1
			AND		u.nombres = @nombres_par
			AND		u.apellidos = @apellidos_par;

		END
	ELSE
		BEGIN
			SELECT	top(1) u.idUsuario, u.nombres, u.apellidos, u.estado
			FROM	Usuario u
			WHERE	u.estado = @estado_par
			AND		u.nombres = @nombres_par
			AND		u.apellidos = @apellidos_par;

		END
	
END;

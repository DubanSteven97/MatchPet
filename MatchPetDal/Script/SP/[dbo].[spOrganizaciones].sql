-- =============================================
-- Author:		<Duban Estupiñan>
-- Create date: <19-Sept-2023>
-- Description:	<Consulta de Organizaciones>
-- Consulta de Organizaciones activos (por defecto)
-- =============================================

CREATE   PROCEDURE [dbo].[spOrganizaciones]
WITH RECOMPILE
AS
BEGIN
	SET NOCOUNT ON;

	SELECT o.idOrganizacion, o.nombre, o.descripcion, o.telefono, o.direccion, o.estado FROM Organizacion o WHERE o.estado != 0
	
END;
GO
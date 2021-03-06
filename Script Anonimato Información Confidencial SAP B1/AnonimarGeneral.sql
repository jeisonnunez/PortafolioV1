USE [master]
GO
/****** Object:  StoredProcedure [dbo].[LoginUser]    Script Date: 26/10/2020 1:18:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AnonimarAmbientesSB1]
@txtSociedad nvarchar(20)
AS

BEGIN

	EXEC Anonimar_Gestion  @Sociedad = @txtSociedad
	EXEC Anonimar_SN @Sociedad = @txtSociedad
	--EXEC Anonimar_Compras @Sociedad = @txtSociedad
	EXEC Anonimar_Ventas @Sociedad = @txtSociedad
	EXEC Anonimar_Bancos @Sociedad = @txtSociedad
	EXEC Anonimar_Finanzas @Sociedad = @txtSociedad
END


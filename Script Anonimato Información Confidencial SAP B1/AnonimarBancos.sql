USE [master]
GO
/****** Object:  StoredProcedure [dbo].[Anonimar_Bancos]    Script Date: 26/10/2020 2:54:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Anonimar_Bancos]
@txtSociedad nvarchar(20)
AS
BEGIN
	BEGIN
	DECLARE @qry NVARCHAR(max)

		SET @qry = N'UPDATE ' + @txtSociedad + '.[dbo].[OVPM] SET CardName = @USU'

		EXEC sp_executesql @qry, N'@USU NVARCHAR(MAX)',
		@USU='xxx'
		
	END

	BEGIN

		SET @qry = N'UPDATE ' + @txtSociedad + '.[dbo].[OCPR] SET Name = @USU'

		EXEC sp_executesql @qry, N'@USU NVARCHAR(MAX)',
		@USU='xxx'
		
	END
	
	BEGIN

		SET @qry = N'UPDATE ' + @txtSociedad + '.[dbo].[OPRJ] SET PrjName = @USU'

		EXEC sp_executesql @qry, N'@USU NVARCHAR(MAX)',
		@USU='xxx'
		
	END
END;



















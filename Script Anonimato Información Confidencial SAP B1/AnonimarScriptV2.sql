USE [master]
GO
/****** Object:  StoredProcedure [dbo].[Anonimar_Gestion]    Script Date: 26/10/2020 4:17:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Anonimar_Gestion]
@Sociedad nvarchar(20)
AS
BEGIN
	BEGIN

		DECLARE @qry NVARCHAR(max)

		SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[OADM] 
		
		SET 
		
		CompnyName	=@string,
		CompnyAddr	=@string,
		State		=@string,
		PrintHeadr	=@string,
		Phone1		=@numeric,
		Phone2		=@numeric,
		Fax			=@string,
		E_Mail		=@mail,
		TaxIdNum	=@RIF,
		RevOffice	=@string,
		DflBnkAcct	=@numeric'
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX), @numeric NVARCHAR(MAX), @mail NVARCHAR(MAX),  @RIF NVARCHAR(MAX)',
		@string='xxx', @numeric='0000000000', @mail='xxxxxxxxxx@xxxxx.com', @RIF='J-00000000-0'
		
					
			
	END 
	BEGIN	

		SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[ADM1] 
		
		SET 
		
		Street	=@string,
		StreetNo	=@string,
		Block		=@string,
		Building	=@string,
		ZipCode		=@string,
		County		=@string,
		IntrntAdrs  =@string'		
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX)',
		@string='xxxxxxx'
		
	END 
	
END;

GO
/****** Object:  StoredProcedure [dbo].[Anonimar_SN]    Script Date: 26/10/2020 4:17:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Anonimar_SN]
@Sociedad nvarchar(20)
AS
BEGIN
	BEGIN

	DECLARE @qry NVARCHAR(max)

		SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[OCRD] 
		
		SET 
		
		CardName	=@string,		
		LicTradNum	=@RIF,		
		Phone1		=@numeric,
		Phone2		=@numeric,
		Fax			=@string,
		E_Mail		=@mail,
		IntrntSite	=@string,
		DflAccount	=@numeric,
		HousBnkAct	=@numeric'
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX), @numeric NVARCHAR(MAX), @mail NVARCHAR(MAX),  @RIF NVARCHAR(MAX)',
		@string='xxxxxxxxxx', @numeric='000-000-00-00', @mail='xxxxxxxxxx@xxxxx.com', @RIF='J-00000000-0'
				
	END 
	
	
	BEGIN

	
		SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[OCPR] 
		
		SET 
		
		Name		=@string,		
		FirstName	=@string,		
		MiddleName	=@string,
		LastName	=@string,
		Title		=@string,
		Position	=@string,
		Address		=@string,
		Tel1		=@numeric,
		Tel2		=@numeric,
		Cellolar	=@numeric,
		Fax			=@string,
		E_MailL		=@mail'
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX), @numeric NVARCHAR(MAX), @mail NVARCHAR(MAX)',
		@string='xxxxxxxxxx', @numeric='000-000-00-00', @mail='xxxxxxxxxx@xxxxx.com'

	END
	BEGIN
	SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[CRD1] 
		
		SET 
		
		Address		=@string,		
		Address2	=@string,		
		Address3	=@string,
		Street		=@string,
		ZipCode		=@string,
		StreetNo	=@string,
		Building	=@string,
		TaxOffice	=@numeric'		
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX), @numeric NVARCHAR(MAX)',
		@string='xxxxxxxxxx',@numeric='000-000-00-00'
	END
END;

GO
/****** Object:  StoredProcedure [dbo].[Anonimar_Finanzas]    Script Date: 26/10/2020 4:18:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Anonimar_Finanzas]
@Sociedad nvarchar(20)
AS
BEGIN
	BEGIN

	DECLARE @qry NVARCHAR(max)

	BEGIN

		SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[JDT1] 
		
		SET ShortName=@string WHERE ShortName<>Account '
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX)',
		@string='xxxxxxxxxx'

	END
		
	BEGIN

		SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].JDT1
		
		SET ContraAct=@string FROM JDT1 T2

		INNER JOIN OCRD T1 ON T1.CardCode=T2.ContraAct'
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX)',
		@string='xxxxxxxxxx'

	END
		
	
	END 
	
	
END;

GO
/****** Object:  StoredProcedure [dbo].[Anonimar_Ventas]    Script Date: 26/10/2020 4:18:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Anonimar_Ventas]
@Sociedad nvarchar(20)
AS
BEGIN
DECLARE @qry NVARCHAR(max)

BEGIN

		SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[ODPI] 
		
		SET Address=@string,
			Address2=@string'
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX)',
		@string='xxxxxxxxxx'

END

	
	BEGIN

		SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[OINV] 
		
		SET Address=@string,
			Address2=@string,
			CardName=@string,
			LicTradNum=@RIF'
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX), @RIF NVARCHAR(MAX)',
		@string='xxxxxxxxxx', @RIF='J-00000000-0'

	END 
	BEGIN

	SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[OSLP] 
		
		SET Telephone=@numeric,
			Mobil=@numeric,
			Fax=@string,
			Email=@mail'
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX), @numeric NVARCHAR(MAX), @mail NVARCHAR(MAX)',
		@string='xxxxxxxxxx', @numeric='000-000-00-00', @mail='xxxxxxxxxx@xxxxx.com'

		
	END
END;

GO
/****** Object:  StoredProcedure [dbo].[Anonimar_Compras]    Script Date: 26/10/2020 4:19:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Anonimar_Compras]
@Sociedad nvarchar(20)
AS
BEGIN
DECLARE @qry NVARCHAR(max)
	BEGIN

	SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[OPCH] 
		
		SET CardName=@string,
			Address2=@string,
			Address=@string,
			LicTradNum=@RIF'
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX), @RIF NVARCHAR(MAX)',
		@string='xxxxxxxxxx', @RIF='J-00000000-0'
	END
	
END;

GO
/****** Object:  StoredProcedure [dbo].[Anonimar_Bancos]    Script Date: 26/10/2020 4:19:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Anonimar_Bancos]
@Sociedad nvarchar(20)
AS
BEGIN
	BEGIN
	DECLARE @qry NVARCHAR(max)

		SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[OVPM] SET CardName = @USU'

		EXEC sp_executesql @qry, N'@USU NVARCHAR(MAX)',
		@USU='xxx'
		
	END

	BEGIN
	

		SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[ORCT] SET CardName = @USU'

		EXEC sp_executesql @qry, N'@USU NVARCHAR(MAX)',
		@USU='xxx'
		
	END

	BEGIN

		SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[OCPR] SET Name = @USU'

		EXEC sp_executesql @qry, N'@USU NVARCHAR(MAX)',
		@USU='xxx'
		
	END
	
	BEGIN

		SET @qry = N'UPDATE ' + @Sociedad + '.[dbo].[OPRJ] SET PrjName = @USU'

		EXEC sp_executesql @qry, N'@USU NVARCHAR(MAX)',
		@USU='xxx'
		
	END
END;

GO
/****** Object:  StoredProcedure [dbo].[AnonimarAmbientesSB1]    Script Date: 26/10/2020 4:21:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[AnonimarAmbientesSB1]
@txtSociedad nvarchar(20)
AS

BEGIN

IF EXISTS (SELECT [name] FROM sys.databases WHERE [name]=@txtSociedad)
BEGIN
IF (@txtSociedad LIKE '%LIVE%')
	BEGIN
		PRINT 'No se pueden anonimar las bases de datos que contengan la palabra LIVE'
	END
	ELSE
	BEGIN
		EXEC Anonimar_Gestion  @Sociedad = @txtSociedad
		EXEC Anonimar_SN @Sociedad = @txtSociedad
		EXEC Anonimar_Compras @Sociedad = @txtSociedad
		EXEC Anonimar_Ventas @Sociedad = @txtSociedad
		EXEC Anonimar_Bancos @Sociedad = @txtSociedad
		EXEC Anonimar_Finanzas @Sociedad = @txtSociedad
	END
END
ELSE 
BEGIN
	PRINT 'La base de datos ' + @txtSociedad + ' no existe'
END

END
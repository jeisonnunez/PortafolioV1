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
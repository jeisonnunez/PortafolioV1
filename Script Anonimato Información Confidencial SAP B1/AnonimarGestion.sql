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
CREATE PROCEDURE [dbo].[Anonimar_Finanzas]
@txtSociedad nvarchar(20)
AS
BEGIN
	BEGIN

	DECLARE @qry NVARCHAR(max)

		SET @qry = N'UPDATE ' + @txtSociedad + '.[dbo].[JDT1] 
		
		SET ShortName=@string WHERE ShortName<>Account '
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX)',
		@string='xxxxxxxxxx'

		SET @qry = N'UPDATE ' + @txtSociedad + '.[dbo].T2
		
		SET T2.ContraAct=@string FROM JDT1 T2

		INNER JOIN OCRD T1 ON T1.CardCode=T2.ContraAct'
		
		EXEC sp_executesql @qry, N'@string NVARCHAR(MAX)',
		@string='xxxxxxxxxx'
	
	END 
	
	
END;
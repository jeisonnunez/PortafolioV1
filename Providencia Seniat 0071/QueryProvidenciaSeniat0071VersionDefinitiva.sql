
GO
/****** Object:  StoredProcedure [dbo].[SBO_ProvidenciaSeniatUltimaVersion]    Script Date: 27/4/2020 12:04:51 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SBO_ProvidenciaSeniatVersionFinal]
@DocKey int
WITH ENCRYPTION

AS

BEGIN

DECLARE @Currency nvarchar(3)

DECLARE @LocalCurrency nvarchar(3)

DECLARE @CodeCurrency nvarchar(3)

DECLARE @DocDate datetime

SET @Currency=(Select DocCur FROM OINV WHERE DocEntry=@DocKey)

SET @LocalCurrency=(Select MainCurncy FROM OADM)

IF(@Currency=@LocalCurrency)
BEGIN

SET @DocDate=(SELECT DocDate FROM OINV WHERE DocEntry=@DocKey)

SET @CodeCurrency=(SELECT TOP 1 SysCurrncy FROM OADM) 

SELECT 
		/****** INFORMACION DEL PROVEEDOR ******/
		T0.[DocNum] AS 'DOCNUM',
		CAST(CONVERT(nvarchar,T0.[DocDate],103)AS nvarchar) AS 'DOCDATE',		
		T0.[CardName] AS 'RAZON_SOCIAL',
		T1.[LicTradNum] AS 'RIF',
		T1.[Address] AS 'DIRECCION',
		T1.[Phone1] AS 'PHONE1',
		T1.[CntctPrsn] AS 'CONTACTO PERSONA',
		
		/****** INFORMACION DE LA FACTURA ******/
		T3.[Dscription] AS 'DESCRIPCION',
		T3.[Quantity] AS 'CANTIDAD',
		T3.[Price] AS 'PRECIO',
		T3.[LineTotal] AS 'ROW TOTAL',

		/****** INFORMACION DEL PIE DE PAGINA ******/
		T0.[DocTotal] AS 'DOCUMENT TOTAL',
		T0.[DiscSum] AS 'TOTAL DISCOUNT',
		T0.[VatSum] AS 'TOTAL TAX',
		(SELECT SUM(LineTotal) FROM INV1 WHERE @DocKey=DocEntry) AS 'SUBTOTAL',

		/****** INFORMACION DE PROVIDENCIA ******/
		T0.[DocTotalSy] AS 'DOCUMENT TOTAL SYS',
		T0.[DiscSumSy] AS 'TOTAL DISCOUNT SYS',
		T0.[VatSumSy] AS 'TOTAL TAX SYS',
		(SELECT SUM(TotalSumSy) FROM INV1 WHERE @DocKey=DocEntry) AS 'SUBTOTAL SYS',
		T5.[DocCurrCod] AS 'SIMBOLO MONEDA LOCAL',
		T4.[DocCurrCod] AS 'SIMBOLO MONEDA EXTRANJERA',
		(SELECT '') AS 'NOMBRE MONEDA LOCAL',
		T3.[TaxCode] AS 'INDICADOR IMPUESTO',
		(SELECT 'El monto en ' + CAST(T4.[CurrName] AS nvarchar)+ ' de esta factura es equivalente segun la tasa de cambio corriente establecida por el BCV (Resolucion 19-05-01) de ' + CAST(T4.[CurrCode] AS nvarchar) + '/' + CAST(T5.[CurrCode] AS nvarchar) + ' : ' + CAST(CAST((SELECT Rate FROM ORTT WHERE RateDate=@DocDate AND Currency=@CodeCurrency)AS decimal(19,2))AS NVARCHAR)+ ' (Fecha: ' +CAST(CONVERT(nvarchar,@DocDate,103)AS nvarchar)+ ')') AS 'LABEL'
		
		FROM [OINV] T0
			INNER JOIN [INV1] T3 ON T0.[DocEntry]=T3.[DocEntry]
			LEFT JOIN [OCRD] T1 ON T1.[CardCode]=T0.[CardCode]	
			LEFT JOIN [OADM] T2 ON T2.[MainCurncy]=T0.[DocCur]
			LEFT JOIN [OCRN] T4 ON T4.[CurrCode]=T2.[SysCurrncy]
			LEFT JOIN [OCRN] T5 ON T5.[CurrCode]=T2.[MainCurncy]
		
		WHERE
		T0.[DocEntry]=@DocKey AND T0.[DocSubType]='--'
END

ELSE
BEGIN

SET @DocDate=(SELECT DocDate FROM OINV WHERE @DocKey=DocEntry)

SET @CodeCurrency=(SELECT TOP 1 SysCurrncy FROM OADM) 

SELECT 
		/****** INFORMACION DEL PROVEEDOR ******/
		T0.[DocNum] AS 'DOCNUM',
		CAST(CONVERT(nvarchar,T0.[DocDate],103)AS nvarchar) AS 'DOCDATE',		
		T0.[CardName] AS 'RAZON_SOCIAL',
		T1.[LicTradNum] AS 'RIF',
		T1.[Address] AS 'DIRECCION',
		T1.[Phone1] AS 'PHONE1',
		T1.[CntctPrsn] AS 'CONTACTO PERSONA',
		
		/****** INFORMACION DE LA FACTURA ******/
		T3.[Dscription] AS 'DESCRIPCION',
		T3.[Quantity] AS 'CANTIDAD',
		T3.[Price] AS 'PRECIO',
		T3.[TotalFrgn] AS 'ROW TOTAL',

		/****** INFORMACION DEL PIE DE PAGINA ******/
		T0.[DocTotalFC] AS 'DOCUMENT TOTAL',
		T0.[DiscSumFC] AS 'TOTAL DISCOUNT',
		T0.[VatSumFC] AS 'TOTAL TAX',
		(SELECT SUM(TotalFrgn) FROM INV1 WHERE @DocKey=DocEntry) AS 'SUBTOTAL',

		/****** INFORMACION DE PROVIDENCIA ******/
		T0.[DocTotal] AS 'DOCUMENT TOTAL SYS',
		T0.[DiscSum] AS 'TOTAL DISCOUNT SYS',
		T0.[VatSum] AS 'TOTAL TAX SYS',
		(SELECT SUM(LineTotal) FROM INV1 WHERE @DocKey=DocEntry) AS 'SUBTOTAL SYS',

		T4.[DocCurrCod] AS 'SIMBOLO MONEDA LOCAL',
		T5.[DocCurrCod] AS 'SIMBOLO MONEDA EXTRANJERA',
		(SELECT T4.[CurrName]) AS 'NOMBRE MONEDA LOCAL',		
		T3.[TaxCode] AS 'INDICADOR IMPUESTO',
		(SELECT 'A los efectos de lo previsto en el Art. 25 de la ley de impuesto al valor agregado se expresan los montos de la factura en ' + CAST(T5.[CurrName] AS nvarchar) + '(' + CAST(T5.[CurrCode] AS nvarchar) + ') considerando la tasa de cambio corriente establecida por el BCV (Resolucion 19-01-05) de ' + CAST(T5.[CurrCode] AS nvarchar) + '/' + CAST(T4.[CurrCode] AS NVARCHAR)  + ':' + CAST(CAST(T0.[DocRate] AS decimal (19,2))AS NVARCHAR)+ ' (Fecha: ' + CAST(CONVERT(nvarchar,@DocDate,103)AS nvarchar)+ ')') AS 'LABEL'
		
		FROM [OINV] T0
			INNER JOIN [INV1] T3 ON T0.[DocEntry]=T3.[DocEntry]
			LEFT JOIN [OCRD] T1 ON T1.[CardCode]=T0.[CardCode]				
			LEFT JOIN [OCRN] T4 ON T4.[CurrCode]=T0.[DocCur]
			LEFT JOIN [OCRN] T5 ON T5.[CurrCode]=@LocalCurrency
		
		WHERE
		T0.[DocEntry]=@DocKey AND T0.[DocSubType]='--' 
END
END
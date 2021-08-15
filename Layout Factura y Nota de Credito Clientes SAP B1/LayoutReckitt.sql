USE [SBO_RECKITT_LIVE]
GO
/****** Object:  StoredProcedure [dbo].[SBO_SP_CUENTASPAGAR]    Script Date: 23/11/2020 4:46:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[SBO_SP_Layout_Factura_Deudores]
@DocKey int
AS

BEGIN

DECLARE @Currency nvarchar(3)

DECLARE @LocalCurrency nvarchar(3)

SET @Currency=(Select DocCur FROM OINV WHERE DocEntry=@DocKey)

SET @LocalCurrency=(Select MainCurncy FROM OADM)


IF(@Currency=@LocalCurrency)
BEGIN

SELECT 
		/****** INFORMACION DEL CLIENTE ******/
		T0.[DocNum] AS 'DocNum',		
		T0.[CardCode] AS 'CODIGO CLIENTE',
		T0.[CardName] AS 'NOMBRE CLIENTE',
		T1.[LicTradNum] AS 'RIF',
		T3.[Address] AS 'DIRECCION',
		T1.[Phone1]  AS 'TELEFONO',

		--/****** INFORMACION CABECERA DE FACTURA ******/

		T0.[NumAtCard] AS 'NUMERO FACTURA',
		T0.[DocDate]  AS 'FECHA CONTABILIZACION',

		/****** INFORMACION DETALLE DE FACTURA ******/
		
		T3.[U_Codigo] AS 'CODIGO',
		T3.[U_Cajas] AS 'CAJAS',
		T3.[U_Tamano] AS 'TAMAÑO',
		T3.[U_PrecioUnitario] AS 'PRECIO UNITARIO',
		T3.[Dscription] AS 'DESCRIPCION',
		T3.[LineTotal] AS 'PRECIO TOTAL',
		
		CASE 
			WHEN T3.[VatPrcnt] = 0 THEN ''
			ELSE CAST (T3.[VatPrcnt] AS nvarchar) + '%'
		END AS 'PORCENTAJE',

		/****** INFORMACION PIE DE INFORME DE FACTURA ******/

		(SELECT CAST (ISNULL(SUM(U_Cajas),0) AS numeric (19,2)) FROM INV1 WHERE DocEntry=@DocKey) AS 'TOTAL CAJAS',

		/****** INFORMACION PIE DE INFORME DE FACTURA SUBTOTALES ******/

		(SELECT SUM(LineTotal) FROM INV1 WHERE DocEntry=@DocKey) AS 'SUBTOTAL',
		T0.[VatSum] AS 'IVA',
		(SELECT SUM(LineTotal) FROM INV1 WHERE DocEntry=@DocKey) + T0.[VatSum] AS 'MONTO TOTAL' 

		--T0.[DocTotal] AS 'NETO A PAGAR',
		FROM [OINV] T0
			INNER JOIN [INV1] T3 ON T0.[DocEntry]=T3.[DocEntry]
			LEFT JOIN [OCRD] T1 ON T1.[CardCode]=T0.[CardCode]	
		WHERE
		T0.[DocEntry]=@DocKey AND T0.[DocSubType]='--'

END

ELSE
BEGIN

SELECT 
--		/****** INFORMACION DEL CLIENTE ******/
		T0.[DocNum] AS 'DocNum',		
		T0.[CardCode] AS 'CODIGO CLIENTE',
		T0.[CardName] AS 'NOMBRE CLIENTE',
		T1.[LicTradNum] AS 'RIF',
		T3.[Address] AS 'DIRECCION',
		T1.[Phone1] AS 'TELEFONO',

--		/****** INFORMACION CABECERA DE FACTURA ******/

		T0.[NumAtCard] AS 'NUMERO FACTURA',
		T0.[DocDate] AS 'FECHA CONTABILIZACION',

--		/****** INFORMACION DETALLE DE FACTURA ******/
		
		T3.[U_Codigo] AS 'CODIGO',
		T3.[U_Cajas] AS 'CAJAS',
		T3.[U_Tamano] AS 'TAMAÑO',
		T3.[U_PrecioUnitario] AS 'PRECIO UNITARIO',
		T3.[Dscription] AS 'DESCRIPCION',
		T3.[TotalFrgn] AS 'PRECIO TOTAL',
		
		CASE 
			WHEN T3.[VatPrcnt] = 0 THEN ''
			ELSE CAST (T3.[VatPrcnt] AS nvarchar) + '%'
		END AS 'PORCENTAJE',

--		/****** INFORMACION PIE DE INFORME DE FACTURA ******/

		(SELECT ISNULL(SUM(U_Cajas),0) FROM INV1 WHERE DocEntry=@DocKey) AS 'TOTAL CAJAS',

--		/****** INFORMACION PIE DE INFORME DE FACTURA SUBTOTALES ******/

		(SELECT SUM(TotalFrgn) FROM INV1 WHERE DocEntry=@DocKey) AS 'SUBTOTAL',
		T0.[VatSumFC] AS 'IVA',
		(SELECT SUM(TotalFrgn) FROM INV1 WHERE DocEntry=@DocKey) + T0.[VatSumFC] AS 'MONTO TOTAL' 

		--T0.[DocTotal] AS 'NETO A PAGAR',
		FROM [OINV] T0
			INNER JOIN [INV1] T3 ON T0.[DocEntry]=T3.[DocEntry]
			LEFT JOIN [OCRD] T1 ON T1.[CardCode]=T0.[CardCode]	
		WHERE
		T0.[DocEntry]=@DocKey AND T0.[DocSubType]='--'

END

END

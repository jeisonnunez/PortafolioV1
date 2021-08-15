USE SBO_HBO_TEST
GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SBO_SP_CUENTASPAGAR]
@DocKey int,
@ObjectID int

AS

BEGIN

SELECT 
		/****** INFORMACION DEL PROVEEDOR ******/
		T0.[DocNum] AS 'VOUCHER',
		T0.[CardCode] AS 'CODIGO',
		T0.[CardName] AS 'NOMBRE/RAZON_SOCIAL',
		T1.[LicTradNum] AS 'RIF',
		T1.[BankCode] AS 'BANCO_RECEPTOR',
		T1.[DflAccount] AS 'CUENTA_RECEPTOR',
		/****** INFORMACION DE LA FACTURA ******/
		T0.[NumAtCard] AS 'NUMERO',
		CASE 
			WHEN T0.[U_IDA_Serie] IS NULL THEN '00' 
			 ELSE T0.[U_IDA_Serie]
			END AS 'SERIE',	
		T0.[U_IDA_NumControl] AS 'CONTROL_NRO',
		T0.[DocDate] AS 'FECHA',
		T0.[U_IDA_TipoTrans] AS 'TIPO_DOC',
		CASE 
			WHEN T0.[U_IDA_TipoTrans]='01' THEN 'Fact'
			WHEN T0.[U_IDA_TipoTrans]='05' THEN 'Int'
			END AS 'TIPO_TRANS',
		CASE 
			WHEN T0.[U_IDA_RetenTercero] IS NULL THEN 'N'
			ELSE 'Y'
		END AS 'Ret. IVA 3ero',
		T0.[DocDueDate] AS 'VENCIMIENTO',
		T0.[TaxDate] AS 'FECHA_EMISION',
		T7.[BnkDflt] AS 'BANCO_PAGADOR',
		T7.[DflAccount] AS 'CUENTA_PAGADOR',
		CASE 
			WHEN T7.[BankTransf]='T' THEN 'EFT'
			WHEN T7.[BankTransf]='C' THEN 'DD'
			END AS 'METODO_PAGO',		
		T0.[DocCur] AS 'MONEDA', 
		T0.[Comments] AS 'CONCEPTO_PAGO',
		(SELECT SUM(LineTotal) FROM PCH1 WHERE DocEntry=@DocKey) AS 'SUBTOTAL',
		T0.[VatSum] AS 'IVA',
		(SELECT SUM(LineTotal) FROM PCH1 WHERE DocEntry=@DocKey) + T0.[VatSum] AS 'MONTO TOTAL', 
		T0.[DocTotal] AS 'NETO A PAGAR',
		(SELECT SUM(WTAmnt) FROM PCH5 WHERE AbsEntry=@DocKey AND BaseType='V')  AS 'IVA RETENIDO',
		(SELECT SUM(WTAmnt) FROM PCH5 WHERE AbsEntry=@DocKey AND BaseType='N')  AS 'I.S.L.R Ret.',
		(SELECT CompnyName FROM OADM) AS 'COMPAÑIA',
		T3.[Dscription] AS 'DESCRIPCION VCHR',
		T3.[AcctCode] AS 'DESCRIPCION CUENTA',
		T4.[AcctName] AS 'NOMBRE',
		T3.[OcrCode] AS 'DEPT ID',
		T5.[OcrName] AS 'DESCRIPCION DEPT',
		T3.[Project] AS 'PROYECTO ID',
		T3.[U_IDA_ITEM] AS 'CANAL',
		T3.[LineTotal] AS 'MONTO',
		T6.[U_NAME] AS 'CREADOR'
		FROM [OPCH] T0
			INNER JOIN [PCH1] T3 ON T0.[DocEntry]=T3.[DocEntry]
			LEFT JOIN [OCRD] T1 ON T1.[CardCode]=T0.[CardCode]
			LEFT JOIN [ODSC] T2 ON T1.[BankCode]=T2.[BankCode]
			LEFT JOIN [OACT] T4 ON T4.[AcctCode]=T3.[AcctCode]
			LEFT JOIN [OOCR] T5 ON T5.[OcrCode]=T3.[OcrCode]
			LEFT JOIN [OUSR] T6 ON T6.[USERID]=T0.[UserSign2]
			LEFT JOIN [OPYM] T7 ON T7.[PayMethCod]=T0.[PeyMethod]
		
		WHERE
		T0.[DocEntry]=@DocKey AND T0.[DocSubType]='--'
END
GO
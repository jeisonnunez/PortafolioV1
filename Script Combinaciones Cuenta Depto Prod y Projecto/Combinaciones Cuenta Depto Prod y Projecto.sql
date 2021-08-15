IF @object_type = '30' AND @transaction_type IN ('U','A')

BEGIN

DECLARE @cnt INT  = 0 -- Contador de lineas de documento
DECLARE @cnt1 INT  = 1 -- Contador de registros de tabla combinaciones
DECLARE @cnt2 INT  = 1 -- Contador de registros de cuenta con combinaciones de la tabla
DECLARE @VAR INT
DECLARE @CUENTA VARCHAR(50)
DECLARE @CENTRO_COSTO VARCHAR(50)
DECLARE @PROYECTO VARCHAR(50)
DECLARE @PRODUCTO VARCHAR(50)
DECLARE @CONTADOR_TABLA INT=0
DECLARE @COMPARA INT
DECLARE @EXISTE INT =0
DECLARE @EXISTE_CUENTA INT =0
DECLARE @CUENTA_VERIFICAR INT


SET @VAR = (SELECT COUNT(T0.Line_ID) FROM JDT1 T0 INNER JOIN OJDT T1 ON T0.TransId = T1.TransId 
WHERE T1.TransId = @list_of_cols_val_tab_del) --CANTIDAD DE LINEAS DE DOCUMENTO

SET @CONTADOR_TABLA = (SELECT COUNT(ID) FROM [dbo].[@COMBINACIONES]) --CONTADOR DE REGISTRO DE COMBINACIONES

	WHILE @cnt < @VAR
	BEGIN

	SET @CUENTA = (SELECT T0.Account FROM JDT1 T0 INNER JOIN OJDT T1 ON T0.TransId = T1.TransId 
	WHERE T1.TransId = @list_of_cols_val_tab_del AND T0.Line_ID = @cnt) --SELECCIONO CUENTA

	SET @CENTRO_COSTO = (SELECT T0.ProfitCode FROM JDT1 T0 INNER JOIN OJDT T1 ON T0.TransId = T1.TransId 
	WHERE T1.TransId = @list_of_cols_val_tab_del AND T0.Line_ID = @cnt) --SELECCIONO CENTRO DE COSTO

	SET @PROYECTO = (SELECT T0.Project FROM JDT1 T0 INNER JOIN OJDT T1 ON T0.TransId = T1.TransId 
	WHERE T1.TransId = @list_of_cols_val_tab_del AND T0.Line_ID = @cnt) --SELECCIONO PROYECTO

	SET  @PRODUCTO = (SELECT T0.U_IDA_ITEM FROM JDT1 T0 INNER JOIN OJDT T1 ON T0.TransId = T1.TransId 
	WHERE T1.TransId = @list_of_cols_val_tab_del AND T0.Line_ID = @cnt) --SELECCIONO PRODUCTO

--------------------------COMPARO CUENTAS CON CUENTAS DE LA TABLA------------------------------------------------------------------

		WHILE @cnt2 <= @CONTADOR_TABLA
		BEGIN

		SET @CUENTA_VERIFICAR = (SELECT COUNT(ID) FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA AND ID=@cnt2)

			IF (@CUENTA_VERIFICAR=1)
			BEGIN
			SET @EXISTE_CUENTA = @EXISTE_CUENTA + 1
			END

		SET @cnt2 = @cnt2 + 1
		END

---------------------------COMPARO EL REGISTRO CON LAS COMBINACIONES DE LA TABLA---------------------------------------------------

		IF (@EXISTE_CUENTA<>0)
		BEGIN

			WHILE @cnt1 <= @CONTADOR_TABLA
			BEGIN

			SET @COMPARA = (SELECT COUNT(ID) FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA AND (Profit_Center=@CENTRO_COSTO OR @CENTRO_COSTO is null OR @CENTRO_COSTO='') AND (Project=@PROYECTO OR @PROYECTO is null OR @PROYECTO='') AND (Item=@PRODUCTO OR @PRODUCTO is null OR @PRODUCTO='') AND ID=@cnt1)

				IF (@COMPARA=1)
				BEGIN
				SET @EXISTE = @EXISTE + 1
				END

			SET @cnt1 = @cnt1 + 1
			END

			IF(@EXISTE=0)
			BEGIN
			SET @error = 1

			SET @error_message = 'La cuenta ' + (SELECT DISTINCT Account FROM [dbo].[@COMBINACIONES] WHERE Account = @CUENTA) + ' admite los centros de costos '

						DECLARE @centro_costo_e varchar(20)

						DECLARE Cursore CURSOR 

						FOR SELECT DISTINCT Profit_Center FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA

						OPEN Cursore 

						FETCH Cursore into @centro_costo_e

							WHILE(@@FETCH_STATUS=0)
							BEGIN

							SET @error_message += @centro_costo_e + ' '

							FETCH Cursore into @centro_costo_e

							END

						CLOSE Cursore

						DEALLOCATE Cursore

						SET @error_message += 'los proyectos '

						DECLARE @proyecto_e varchar(20)

						DECLARE Cursor_p CURSOR 

						FOR SELECT DISTINCT Project FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA

						OPEN Cursor_p

						FETCH Cursor_p into @proyecto_e

							WHILE(@@FETCH_STATUS=0)
							BEGIN

							SET @error_message += @proyecto_e + ' '

							FETCH Cursor_p into @proyecto_e

							END

						CLOSE Cursor_p

						DEALLOCATE Cursor_p

						SET @error_message += 'los productos '

						DECLARE @productos_e varchar(20)

						DECLARE Cursor_i CURSOR 

						FOR SELECT DISTINCT Item FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA

						OPEN Cursor_i

						FETCH Cursor_i into @productos_e

							WHILE(@@FETCH_STATUS=0)
							BEGIN

							SET @error_message += @productos_e + ' '

							FETCH Cursor_i into @productos_e

							END

						CLOSE Cursor_i

						DEALLOCATE Cursor_i

			END

		END

		SET @cnt1=1

		SET @cnt2=1

		SET @EXISTE=0

		SET @EXISTE_CUENTA=0

		SET @cnt = @cnt + 1;

	END
END

---------------------------------------------------FACTURA DE PROVEEDORES-----------------------------------------------------

IF @object_type = '18' AND @transaction_type IN ('U','A')

BEGIN

DECLARE @cnt_FP INT  = 0 -- Contador de lineas de documento
DECLARE @cnt1_FP INT  = 1 -- Contador de registros de tabla combinaciones
DECLARE @cnt2_FP INT  = 1 -- Contador de registros de cuenta con combinaciones de la tabla
DECLARE @VAR_FP INT
DECLARE @CUENTA_FP VARCHAR(50)
DECLARE @CENTRO_COSTO_FP VARCHAR(50)
DECLARE @PROYECTO_FP VARCHAR(50)
DECLARE @PRODUCTO_FP VARCHAR(50)
DECLARE @CONTADOR_TABLA_FP INT=0
DECLARE @COMPARA_FP INT
DECLARE @EXISTE_FP INT =0
DECLARE @EXISTE_CUENTA_FP INT =0
DECLARE @CUENTA_VERIFICAR_FP INT


SET @VAR_FP = (SELECT COUNT(T0.LineNum) FROM PCH1 T0 INNER JOIN OPCH T1 ON T0.DocEntry = T1.DocEntry 
WHERE T1.DocEntry = @list_of_cols_val_tab_del) --CANTIDAD DE LINEAS DE DOCUMENTO

SET @CONTADOR_TABLA_FP = (SELECT COUNT(ID) FROM [dbo].[@COMBINACIONES]) --CONTADOR DE REGISTRO DE COMBINACIONES

	WHILE @cnt_FP < @VAR_FP 
	BEGIN

	SET @CUENTA_FP = (SELECT T0.AcctCode FROM PCH1 T0 INNER JOIN OPCH T1 ON T0.DocEntry = T1.DocEntry 
	WHERE T1.DocEntry = @list_of_cols_val_tab_del AND T0.LineNum = @cnt_FP) --SELECCIONO CUENTA

	SET @CENTRO_COSTO_FP = (SELECT T0.OcrCode FROM PCH1 T0 INNER JOIN OPCH T1 ON T0.DocEntry = T1.DocEntry 
	WHERE T1.DocEntry = @list_of_cols_val_tab_del AND T0.LineNum = @cnt_FP) --SELECCIONO CENTRO DE COSTO

	SET @PROYECTO_FP = (SELECT T0.Project FROM PCH1 T0 INNER JOIN OPCH T1 ON T0.DocEntry = T1.DocEntry 
	WHERE T1.DocEntry = @list_of_cols_val_tab_del AND T0.LineNum = @cnt_FP) --SELECCIONO PROYECTO

	SET  @PRODUCTO_FP = (SELECT T0.U_IDA_ITEM FROM PCH1 T0 INNER JOIN OPCH T1 ON T0.DocEntry = T1.DocEntry 
	WHERE T1.DocEntry = @list_of_cols_val_tab_del AND T0.LineNum = @cnt_FP) --SELECCIONO PRODUCTO

--------------------------COMPARO CUENTAS CON CUENTAS DE LA TABLA------------------------------------------------------------------

		WHILE @cnt2_FP <= @CONTADOR_TABLA_FP
		BEGIN

		SET @CUENTA_VERIFICAR_FP = (SELECT COUNT(ID) FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA_FP AND ID=@cnt2_FP)

			IF (@CUENTA_VERIFICAR_FP=1)
			BEGIN
			SET @EXISTE_CUENTA_FP = @EXISTE_CUENTA_FP + 1
			END

		SET @cnt2_FP = @cnt2_FP + 1
		END

---------------------------COMPARO EL REGISTRO CON LAS COMBINACIONES DE LA TABLA---------------------------------------------------

		IF (@EXISTE_CUENTA_FP<>0)
		BEGIN

			WHILE @cnt1_FP <= @CONTADOR_TABLA_FP
			BEGIN

			SET @COMPARA_FP = (SELECT COUNT(ID) FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA_FP AND (Profit_Center=@CENTRO_COSTO_FP OR @CENTRO_COSTO_FP is null OR @CENTRO_COSTO_FP='') AND (Project=@PROYECTO_FP OR @PROYECTO_FP is null OR @PROYECTO_FP='') AND (Item=@PRODUCTO_FP OR @PRODUCTO_FP is null OR @PRODUCTO_FP='') AND ID=@cnt1_FP)

				IF (@COMPARA_FP=1)
				BEGIN
				SET @EXISTE_FP = @EXISTE_FP + 1
				END

			SET @cnt1_FP = @cnt1_FP + 1
			END

			IF(@EXISTE_FP=0)
			BEGIN
			SET @error = 1

			SET @error_message = 'La cuenta ' + (SELECT DISTINCT Account FROM [dbo].[@COMBINACIONES] WHERE Account = @CUENTA_FP) + ' admite los centros de costos '

						DECLARE @centro_costo_e_FP varchar(20)

						DECLARE Cursore_FP CURSOR 

						FOR SELECT DISTINCT Profit_Center FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA_FP

						OPEN Cursore_FP

						FETCH Cursore_FP into @centro_costo_e_FP

							WHILE(@@FETCH_STATUS=0)
							BEGIN

							SET @error_message += @centro_costo_e_FP + ' '

							FETCH Cursore_FP into @centro_costo_e_FP

							END

						CLOSE Cursore_FP

						DEALLOCATE Cursore_FP

						SET @error_message += 'los proyectos '

						DECLARE @proyecto_e_FP varchar(20)

						DECLARE Cursor_p_FP CURSOR 

						FOR SELECT DISTINCT Project FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA_FP

						OPEN Cursor_p_FP

						FETCH Cursor_p_FP into @proyecto_e_FP

							WHILE(@@FETCH_STATUS=0)
							BEGIN

							SET @error_message += @proyecto_e_FP + ' '

							FETCH Cursor_p_FP into @proyecto_e_FP

							END

						CLOSE Cursor_p_FP

						DEALLOCATE Cursor_p_FP

						SET @error_message += 'los productos '

						DECLARE @productos_e_FP varchar(20)

						DECLARE Cursor_i_FP CURSOR 

						FOR SELECT DISTINCT Item FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA_FP

						OPEN Cursor_i_FP

						FETCH Cursor_i_FP into @productos_e_FP

							WHILE(@@FETCH_STATUS=0)
							BEGIN

							SET @error_message += @productos_e_FP + ' '

							FETCH Cursor_i_FP into @productos_e_FP

							END

						CLOSE Cursor_i_FP

						DEALLOCATE Cursor_i_FP

			END

		END

		SET @cnt1_FP=1

		SET @cnt2_FP=1

		SET @EXISTE_FP=0

		SET @EXISTE_CUENTA_FP=0

		SET @cnt_FP = @cnt_FP + 1;

	END
END

---------------------------------------------------FACTURA DE DEUDORES-----------------------------------------------------

IF @object_type = '13' AND @transaction_type IN ('U','A')

BEGIN

DECLARE @cnt_FD INT = 0 -- Contador de lineas de documento
DECLARE @cnt1_FD INT = 1 -- Contador de registros de tabla combinaciones
DECLARE @cnt2_FD INT = 1 -- Contador de registros de cuenta con combinaciones de la tabla
DECLARE @VAR_FD INT
DECLARE @CUENTA_FD VARCHAR(50)
DECLARE @CENTRO_COSTO_FD VARCHAR(50)
DECLARE @PROYECTO_FD VARCHAR(50)
DECLARE @PRODUCTO_FD VARCHAR(50)
DECLARE @CONTADOR_TABLA_FD INT=0
DECLARE @COMPARA_FD INT
DECLARE @EXISTE_FD INT =0
DECLARE @EXISTE_CUENTA_FD INT =0
DECLARE @CUENTA_VERIFICAR_FD INT

SET @VAR_FD = (SELECT COUNT(T0.LineNum) FROM INV1 T0 INNER JOIN OINV T1 ON T0.DocEntry=T1.DocEntry 
WHERE T1.DocEntry = @list_of_cols_val_tab_del) --CANTIDAD DE LINEAS DE DOCUMENTO

SET @CONTADOR_TABLA_FD = (SELECT COUNT(ID) FROM [dbo].[@COMBINACIONES]) --CONTADOR DE REGISTRO DE COMBINACIONES

	WHILE @cnt_FD < @VAR_FD 
	BEGIN

	SET @CUENTA_FD = (SELECT T0.AcctCode FROM INV1 T0 INNER JOIN OINV T1 ON T0.DocEntry = T1.DocEntry 
	WHERE T1.DocEntry = @list_of_cols_val_tab_del AND T0.LineNum = @cnt_FD) --SELECCIONO CUENTA

	SET @CENTRO_COSTO_FD = (SELECT T0.OcrCode FROM INV1 T0 INNER JOIN OINV T1 ON T0.DocEntry = T1.DocEntry 
	WHERE T1.DocEntry = @list_of_cols_val_tab_del AND T0.LineNum = @cnt_FD) --SELECCIONO CENTRO DE COSTO

	SET @PROYECTO_FD = (SELECT T0.Project FROM INV1 T0 INNER JOIN OINV T1 ON T0.DocEntry = T1.DocEntry 
	WHERE T1.DocEntry = @list_of_cols_val_tab_del AND T0.LineNum = @cnt_FD) --SELECCIONO PROYECTO

	SET @PRODUCTO_FD = (SELECT T0.U_IDA_ITEM FROM INV1 T0 INNER JOIN OINV T1 ON T0.DocEntry = T1.DocEntry 
	WHERE T1.DocEntry = @list_of_cols_val_tab_del AND T0.LineNum = @cnt_FD) --SELECCIONO PRODUCTO

--------------------------COMPARO CUENTAS CON CUENTAS DE LA TABLA------------------------------------------------------------------

		WHILE @cnt2_FD <= @CONTADOR_TABLA_FD
		BEGIN

		SET @CUENTA_VERIFICAR_FD = (SELECT COUNT(ID) FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA_FD AND ID=@cnt2_FD)

			IF (@CUENTA_VERIFICAR_FD=1)
			BEGIN
			SET @EXISTE_CUENTA_FD = @EXISTE_CUENTA_FD + 1
			END

		SET @cnt2_FD = @cnt2_FD + 1
		END

---------------------------COMPARO EL REGISTRO CON LAS COMBINACIONES DE LA TABLA---------------------------------------------------

		IF (@EXISTE_CUENTA_FD<>0)
		BEGIN

			WHILE @cnt1_FD <= @CONTADOR_TABLA_FD
			BEGIN

			SET @COMPARA_FD = (SELECT COUNT(ID) FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA_FD AND (Profit_Center=@CENTRO_COSTO_FD OR @CENTRO_COSTO_FD is null OR @CENTRO_COSTO_FD='') AND (Project=@PROYECTO_FD OR @PROYECTO_FD is null OR @PROYECTO_FD='') AND (Item=@PRODUCTO_FD OR @PRODUCTO_FD is null OR @PRODUCTO_FD='') AND ID=@cnt1_FD)

				IF (@COMPARA_FD=1)
				BEGIN
				SET @EXISTE_FD = @EXISTE_FD + 1
				END

			SET @cnt1_FD = @cnt1_FD + 1
			END

			IF(@EXISTE_FD=0)
			BEGIN
			SET @error = 1

			SET @error_message = 'La cuenta ' + (SELECT DISTINCT Account FROM [dbo].[@COMBINACIONES] WHERE Account = @CUENTA_FD) + ' admite los centros de costos '

						DECLARE @centro_costo_e_FD varchar(20)

						DECLARE Cursore_FD CURSOR 

						FOR SELECT DISTINCT Profit_Center FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA_FD

						OPEN Cursore_FD

						FETCH Cursore_FD into @centro_costo_e_FD

							WHILE(@@FETCH_STATUS=0)
							BEGIN

							SET @error_message += @centro_costo_e_FD + ' '

							FETCH Cursore_FD into @centro_costo_e_FD

							END

						CLOSE Cursore_FD

						DEALLOCATE Cursore_FD

						SET @error_message += 'los proyectos '

						DECLARE @proyecto_e_FD varchar(20)

						DECLARE Cursor_p_FD CURSOR 

						FOR SELECT DISTINCT Project FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA_FD

						OPEN Cursor_p_FD

						FETCH Cursor_p_FD into @proyecto_e_FD

							WHILE(@@FETCH_STATUS=0)
							BEGIN

							SET @error_message += @proyecto_e_FD + ' '

							FETCH Cursor_p_FD into @proyecto_e_FD

							END

						CLOSE Cursor_p_FD

						DEALLOCATE Cursor_p_FD

						SET @error_message += 'los productos '

						DECLARE @productos_e_FD varchar(20)

						DECLARE Cursor_i_FD CURSOR 

						FOR SELECT DISTINCT Item FROM [dbo].[@COMBINACIONES] WHERE Account=@CUENTA_FD

						OPEN Cursor_i_FD

						FETCH Cursor_i_FD into @productos_e_FD

							WHILE(@@FETCH_STATUS=0)
							BEGIN

							SET @error_message += @productos_e_FD + ' '

							FETCH Cursor_i_FD into @productos_e_FD

							END

						CLOSE Cursor_i_FD

						DEALLOCATE Cursor_i_FD

			END

		END

		SET @cnt1_FD=1

		SET @cnt2_FD=1

		SET @EXISTE_FD=0

		SET @EXISTE_CUENTA_FD=0

		SET @cnt_FD = @cnt_FD + 1;

	END
END

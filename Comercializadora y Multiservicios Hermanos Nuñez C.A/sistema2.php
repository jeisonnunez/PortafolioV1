<!-- paso3.-->
<?php

 //Datos de la base de datos
	$usuario = "root";
	$password = "";
	$servidor = "localhost";
	$basededatos = "pedidos";

$conexion = mysqli_connect($servidor, $usuario, "");
if(!$conexion)
{
echo "Error no se puede conectar a la base de datos";
exit;
}
$db = mysqli_select_db($conexion, $basededatos) or die ( "Upps! Pues va a ser que no se ha podido conectar a la base de datos" );
	// establecer y realizar consulta. guardamos en variable.

      if (!$db) 
      {
         die("No puedo conectar: " . mysql_error());
      }
	else
	{
		echo "Conexion establecida";
	}
?>

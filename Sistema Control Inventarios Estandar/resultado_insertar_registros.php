<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>

</head>

<body>

<?php

$n_usu= $_GET["n_usu"];
$p_usu= $_GET["p_usu"];


require("datos_conexion.php");

$conexion=mysqli_connect($db_host,$db_usuario,$db_contraseña);

if(mysqli_connect_errno()){
	
echo "Fallo al conectar con la base de datos";

exit();	
	
}

mysqli_select_db($conexion, $db_nombre) or die ("No se encuentra la base de datos");

mysqli_set_charset($conexion, "utf8");

$sql="insert into usuarios_pass (usuarios, clave) values (?,?)";

$resultado=mysqli_prepare($conexion,$sql);

$ok=mysqli_stmt_bind_param($resultado,"ss",$n_usu,$p_usu);

$ok=mysqli_stmt_execute($resultado);

if($ok==false){
	
echo "Error al ejecutar la consulta";	
	
}else{
			
	echo "Agregado nuevo usuario";
	
	header("location:sistema_login/menu.php");
	 
}

mysqli_stmt_close($resultado);

mysqli_close($conexion);

?>


</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>
</head>

<body>
<?php

	include("conexion_crud.php");
	
	$cod=$_GET['cod'];
	
	$base->query("delete from productos_inventario where codigo_producto='$cod'");
	
	header("location:index_crud.php");
	
?>
</body>
</html>
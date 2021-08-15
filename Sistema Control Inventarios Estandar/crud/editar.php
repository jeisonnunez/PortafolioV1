<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Documento sin título</title>
<link rel="stylesheet" type="text/css" href="hoja.css">
</head>

<body>

<h1>ACTUALIZAR</h1>

<?php

include("conexion_crud.php");

if(!isset($_POST['bot_actualizar'])){

        $codigo=$_GET['cod'];
		$nombre=$_GET['nom'];
		$p_compra=$_GET['p_com'];
		$p_venta=$_GET['p_ven'];
		$cantidad=$_GET['can'];
		$fecha=$_GET['fec'];

}else{
	
	
	    $codigo=$_POST['cod'];
		$nombre=$_POST['nom'];
		$p_compra=$_POST['p_com'];
		$p_venta=$_POST['p_ven'];
		$cantidad=$_POST['can'];
		$fecha=$_POST['fec'];
	
	$sql="update productos_inventario set codigo_producto=:miCod, nombre_producto=:miNom, precio_compra=:miPc, precio_venta=:miPv, cantidad=:miCan, fecha=:miFec where codigo_producto=:miCod";
	
	$resultado=$base->prepare($sql);
	
	$resultado->execute(array(":miCod"=>$codigo, ":miNom"=>$nombre, ":miPc"=>$p_compra, ":miPv"=>$p_venta, ":miCan"=>$cantidad, ":miFec"=>$fecha));
	
	header("location:index_crud.php");
	
}

?>

<p>
 
</p>
<p>&nbsp;</p>
<form name="form1" method="post" action="<?php echo $_SERVER['PHP_SELF'];?>">
  <table width="25%" border="0" align="center">
    <tr>
      <td>Codigo</td>
      <td><label for="cod"></label>
      <input type="hidden" name="cod" id="cod" value="<?php echo $codigo?>"><?php echo $codigo?></td>
    </tr>
    <tr>
      <td>Nombre</td>
      <td><label for="nom"></label>
      <input type="text" name="nom" id="nom" value="<?php echo $nombre?>"></td>
    </tr>
    <tr>
      <td>Precio_compra</td>
      <td><label for="p_com"></label>
      <input type="text" name="p_com" id="p_com" value="<?php echo $p_compra?>"></td>
    </tr>
    <tr>
      <td>Precio_venta</td>
      <td><label for="pv"></label>
      <input type="text" name="p_ven" id="p_ven" value="<?php echo $p_venta?>"></td>
    </tr>
    <tr>
      <td>Cantidad</td>
      <td><label for="can"></label>
      <input type="text" name="can" id="can" value="<?php echo $cantidad?>"></td>
    </tr>
    <tr>
      <td>Fecha</td>
      <td><label for="fec"></label>
      <input type="text" name="fec" id="fec" value="<?php echo $fecha?>"></td>
    </tr>
    <tr>
      <td colspan="2"><input type="submit" name="bot_actualizar" id="bot_actualizar" value="Actualizar"></td>
    </tr>
  </table>
</form>
<p>&nbsp;</p>
</body>
</html>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>CRUD</title>
<link rel="stylesheet" type="text/css" href="hoja.css">


</head>

<body>

<?php

	session_start();
	
	if(!isset($_SESSION["usuario"])){
		
		header("location:login.php");	
		
		
	}

?>
<h1>Bienvenidos Usuarios</h1>

<?php

	echo "Hola: " . $_SESSION["usuario"] . "<br><br>" 
?>

<p><a href="../sistema_login/cierre.php">Cierra Sesion</a></p>

<?php

	include("conexion_crud.php");
	
	//$conexion=$base->query("select * from datos_usuarios");
	
	//$registros=$conexion->fetchAll(PDO::FETCH_OBJ);
	
	//------------------------------------------------------Paginacion---------------------------------------------------------------
	
	$tamagno_paginas=5;
	
	if(isset($_GET['pagina'])){
		
		if($_GET['pagina']==1){
			
			header("location:index_crud.php");	
			
		}else{
						
			$pagina=$_GET['pagina'];	
			
		}
		
	}else{
	
		$pagina=1;
	}
	
	$empezar_desde=($pagina-1)*$tamagno_paginas;
	
	$sql_total="select * from productos_inventario";
	
	$resultado=$base->prepare($sql_total);
	
	$resultado->execute(array());
	
	$num_registros=$resultado->rowCount();
	
	$total_paginas=ceil($num_registros/$tamagno_paginas);
	
	//---------------------------------------------------------------------------------------------------------------------------------------//	
	
	$registros=$base->query("select * from productos_inventario limit $empezar_desde,$tamagno_paginas")->fetchAll(PDO::FETCH_OBJ);
	
	if(isset($_POST['cr'])){
		
		$codigo=$_POST['Cod'];
		$nombre=$_POST['Nom'];
		$p_compra=$_POST['Pc'];
		$p_venta=$_POST['Pv'];
		$cantidad=$_POST['Can'];
		$fecha=$_POST['Fec'];
		
		$sql="insert into productos_inventario (codigo_producto, nombre_producto, precio_compra, precio_venta, cantidad, fecha) values (:cod, :nom, :p_com, :p_ven, :can, :fec)";
		
		$resultado=$base->prepare($sql);
		
		$resultado->execute(array(":cod"=>$codigo, ":nom"=>$nombre, ":p_com"=>$p_compra, ":p_ven"=>$p_venta, ":can"=>$cantidad, ":fec"=>$fecha));
		
		header("location:index_crud.php");
				
	}
//------------------------------------------------------------------------------------//
?>


<h1>INVENTARIO<span class="subtitulo">Comercializadora y Multservicios Hermanos Nuñez C.A.</span></h1>


<form action="<?php echo $_SERVER['PHP_SELF'];?>"  method="post">

  <table width="50%" border="0" align="center">
   
    <tr>
      
      <td class="primera_fila">Codigo</td>
      <td class="primera_fila">Nombre</td>
      <td class="primera_fila">Precio_compra</td>
      <td class="primera_fila">Precio_venta</td>
      <td class="primera_fila">Cantidad</td>
      <td class="primera_fila">Fecha</td>
      
    </tr> 
   
	
    <?php
	
	
	foreach($registros as $productos):?>
   
	
   	<tr>
      <td><?php echo $productos->codigo_producto ?></td>
      <td><?php echo $productos->nombre_producto ?></td>
      <td><?php echo $productos->precio_compra ?></td>
      <td><?php echo $productos->precio_venta ?></td>
      <td><?php echo $productos->cantidad ?></td>
      <td><?php echo $productos->fecha ?></td>
 
      <td class="bot"><a href="eliminar.php?cod=<?php echo $productos->codigo_producto?>"><input type='button' name='del' id='del' value='Eliminar'></a></td>
      <td class='bot'><a href="editar.php?cod=<?php echo $productos->codigo_producto?> & nom=<?php echo $productos->nombre_producto?> & p_com=<?php echo $productos->precio_compra?> & p_ven=<?php echo $productos->precio_venta?> & can=<?php echo $productos->cantidad?> & fec=<?php echo $productos->fecha?>"><input type='button' name='up' id='up' value='Actualizar'></a></td>
    </tr>   
    
    <?php
		endforeach;
	?>
    
    
    
    
        
	<tr>
	
      <td><input type='text' name='Cod' size='10' class='centrado'></td>
      <td><input type='text' name='Nom' size='10' class='centrado'></td>
      <td><input type='text' name='Pc' size='10' class='centrado'></td>
      <td><input type='text' name='Pv' size='10' class='centrado'></td>
      <td><input type='text' name='Can' size='10' class='centrado'></td>
      <td><input type='text' name='Fec' size='10' class='centrado'></td>
      <td class='bot'><input type='submit' name='cr' id='cr' value='Insertar'></td></tr> 
      <tr><td class="centrado" colspan="6"><?php
 
 			for($i=1; $i<=$total_paginas; $i++){
		
			echo "<a href='?pagina=" . $i .  "'>" . $i . "</a>  "; 
	
			}

	?></td>
    </tr>   
  </table>
  
</form>
 
 

</body>
</html>
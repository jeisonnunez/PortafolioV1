 <!-- paso2.-->
 <html>
 <head>
 <script language="javascript">
 <!--
 alert("sus datos han sido guardado satisfactoriamente \n gracias");
 location.href="contacto.html";
 //-->
 </script>
 </head>
 <body>
<?php
   include ("sistema2.php");
    $nombre=$_POST['name'];
    $correo=$_POST['email'];
	$telefono=$_POST['phone'];
	$pedido=$_POST['message'];
	
	if($nombre != "" && $correo != ""){
   mysqli_query($conexion,"insert into formulario (name, email, phone, message) values ('$nombre','$correo', '$telefono','$pedido')");
	}
 
?>
 </body>
 </html>

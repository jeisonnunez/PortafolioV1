<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>
</head>

<body>
<?php

try{
	
	$base=new PDO("mysql:host=localhost; dbname=pruebas","root", "");
	
	$base->exec("SET CARACTER SET utf8");
	
	$base->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	
	$sql="SELECT * FROM USUARIOS_PASS WHERE USUARIOS=:login AND CLAVE =:password";
	
	$resultado=$base->prepare($sql);
	
	$login=htmlentities(addslashes($_POST["login"])); //convierte cualquier simbolo de html y con addslashes escapa de los caracteres extraños y capturo la variable del form 
	
	$password=htmlentities(addslashes($_POST["password"]));
	
	$resultado->bindValue(":login", $login); //cuando se usan marcadores se utiliza bindValue para establecer equivalencia
	
	$resultado->bindValue(":password", $password);
	
	$resultado->execute();
	
	$numero_registro=$resultado->rowCount();//dice el numero de registros que devuelve una consulta. 0 sino encuentra y mas de 1 si encuentra
	
	if($numero_registro!=0){
		
	  
	  	session_start();//crear una sesion para el usuario logeado
		
		$_SESSION["usuario"]=$_POST["login"];
	  
		header("location:../crud/index_crud.php");
				
				
	}else{
		
		header("location:login.php");
		
	}
	
}catch(Exception $e){

die("Error:" . $e->getMessage());



}



?>


</body>
</html>
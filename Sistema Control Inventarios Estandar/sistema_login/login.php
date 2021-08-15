<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Documento sin título</title>

<style>
			table{
				background-color:#FFC;
				border:1px solid #FF0000;
				margin:auto;
				padding:25px;
			}
		h1{
			width:50%;
			margin:25px auto;
			
			text-align:center;
			margin-bottom:50px;
		}
		
		body{
			background-color:#0CF;;
		}
		
		#boton{
			padding-top:25px;
			
		}
		
		</style>
</head>

<body>

<h1>LOGIN</h1>

<form action="comprueba_login.php" method="post">

<table width="378" height="172">
<tr>
<td class="izq">
Usuario:</td><td class="der"><input type="text" name="login"></td></tr>
<tr><td class="izq">Password:</td><td class="der"><input type="password" name="password"></td></tr>
<tr><td colspan="2"><input type="submit" name="enviar" value="LOGIN"></td></tr></table>
</form>
</body>
</html>
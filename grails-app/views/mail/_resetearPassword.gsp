<%@ page import="estats.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<%def usuario = parametros.usuario%>
	<img src="https://raw.githubusercontent.com/diegomartin010/100tifiko/master/grails-app/assets/images/logos/logo.png">
	<h2>Staff de 100tifiko.</h2>
	<h4>Reinicio de Contraseña.</h4>
	<p>
		Señor <b><i>${usuario.nombre} ${usuario.apellido}</i></b>
		Se ha procedido a realizar el reseteo de su contraseña, y cuestiones de seguridad, su cuenta ha sido bloqueada.
	</p>
	<p>Usted puede ingresar al sistema utilizando los siguientes datos.</p>
	<p>----------------------------------------------</p>
	<h2>Username: ${usuario.username}</h2>
	<h2>Password: ${usuario.password}</h2>
	<p>----------------------------------------------</p>
	<p>Para activar su cuenta, haga click en el enlace. <h3><a href="${parametros.url}">Activar Cuenta</a></h3></p>
	<p>Recuerde cambiar su contraseña una vez activada la cuenta.</p>
	<p>Para mas informacion, contactese con nuestro personal, via email : 100tifiko.staff@gmail.com</p>
	<p color="red">Este mail ha sido generado automaticamente, por favor, no lo responda.</p>
</body>
</html>
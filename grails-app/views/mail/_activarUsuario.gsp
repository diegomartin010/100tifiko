<%@ page import="estats.*" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
	<%
		def usuario = parametros.usuario
		def codigo = parametros.codigo
	%>
	<img src="https://raw.githubusercontent.com/diegomartin010/100tifiko/master/grails-app/assets/images/logos/logo.png">
	<h2>Staff de 100tifiko.</h2>
	<h4>Activacion de Cuenta.</h4>
	<p>Señor <b><i>${usuario.nombre} ${usuario.apellido}</i></b></p>
	<p>Used se ha registrado con el username <b><i>${usuario.username}</i></b>. Para confirmar la activacion de la cuenta, haga click en el siguiente enlace.</p>
	<a href="${parametros.url}">Activar usuario</a>
	<p>Para mas informacion, contactese con nuestro personal, via email : 100tifiko.staff@gmail.com</p>
	<p color="red">Este mail ha sido generado automaticamente, por favor, no lo responda.</p>
</body>
</html>
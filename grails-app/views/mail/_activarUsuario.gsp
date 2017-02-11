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
	<h4>Nuevo Usuario.</h4>
	<p>Señor <b><i>${usuario.nombre} ${usuario.apellido}</i></b></p>
	<p>Used se ha registrado en la plataforma 100tifiko, con los siguientes datos:</p>
	<p>----------------------------------------------</p>
	<h2>Username: ${usuario.username}</h2>
	<h2>Contraseña: ${usuario.password}</h2>
	<h5>E-mail: ${usuario.email}</h5>
	<p>----------------------------------------------</p>
	<p>Actualmente su cuenta se encuentra inactiva. Para proceder a la activación, haga click en el siguiente enlace.</p>
	<h3><a href="${parametros.url}">Activar usuario</a></h3>
	<p>Frente a problemas técnicos con la plataforma, usted podrá contactarse con el personal, via email : 100tifiko.staff@gmail.com</p>
	<p color="red">Este mail ha sido generado automáticamente, por favor, no lo responda.</p>
</body>
</html>
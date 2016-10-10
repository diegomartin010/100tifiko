<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	<g:javascript src="" />
	<meta name="layout" content="main">
	<title><g:message code="Carrera"/></title>
</head>
<body>
		
	%{-- Barra de navegacion pagina --}%
	<div class="nav" role="navigation">
		<ul><li><a class="home" href="/"><g:message code="default.home.label"/></a></li></ul>
	</div>
	
	%{-- Estilo body de la pagina --}%
	<div id="page-body" role="main">
		<% def usuario = SessionManager.getCurrentUser() %>
		<div class="content"><h1>Estado academico</h1></div>			
		<div class="container">
			Mudo Aca tenes que hacer la vista para esto ....
			<br>
			<iframe src="https://drive.google.com/file/d/0B3N4QK1nj086NVNkeDVzZ1otQzg/preview" width="640" height="480"></iframe>
		</div>
	</div>

</body>
</html>
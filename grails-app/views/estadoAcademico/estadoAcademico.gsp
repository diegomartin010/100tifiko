<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	<g:javascript src="estadoAcademico/estadoAcademico.js" />  
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
		
		<div id="aprobadas" class="col-md-12">
			<div class="content"><h3>Materias Aprobadas</h3></div>
		</div>
		<div id="regularizadas" class="col-md-12" >
			<div class="content"><h3>Materias Regularizadas</h3></div>	
		</div>
		<div id="en_curso" class="col-md-12" >
			<div class="content"><h3>Materias en curso</h3></div>	
		</div>
		<div id="pendientes" class="col-md-12">
			<div class="content"><h3>Materias Pendientes</h3></div>	
		</div>
	</div>

</body>
</html>
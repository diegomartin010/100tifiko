<%@ page import="estats.SessionManager" %>
<%@ page import="modelo.Carrera" %>
<!DOCTYPE html>
<html>
<head>
	%{-- Incluir logica javascript --}%
	<script type="text/javascript" src = "/js/carrera.js"></script>
	%{-- Incluir cabeceras de estilos --}%
	<meta name="layout" content="main">
	%{-- Titulo de la pagina --}%
	<title><g:message code="Carrera"/></title>
</head>
<body>
		
	%{-- Barra de navegacion pagina --}%
	<div class="nav" role="navigation">
		<ul><li><a class="home" href="/"><g:message code="default.home.label"/></a></li></ul>
	</div>

	
	%{-- Estilo body de la pagina --}%
	<div id="page-body" role="main">

		%{-- Se captura el usuario actual en sesion --}%
		<% def usuario = SessionManager.getCurrentUser() %>
	
			%{-- Formulario de creacion de nueva carrera --}%
			<div class="content scaffold-edit" role="main">
				<h1>Crear una carrera:</h1>
				<ol class="property-list user">
				<div id ="result"></div>
				%{-- Inicio del formulario --}%
				<fieldset class="form">
					<div class="fieldcontain required">
						<div class="alert alert-info" role="alert">
							<label>Archivo de nueva carrera:</label>
							<input type="file" id="nuevaCarrera">
						</div>
					</div>
					<div class="fieldcontain required">
						<label>Carreras cargadas:</label>
						<ul class="list-group">
		  					<g:each var="carrera" in="${Carrera.list()}">
    							<li class="list-group-item">
		  							<label>${carrera.id}: </label> ${carrera.nombre}
		  						</li>
    						</g:each>
		  					
						</ul>					
					</div>
				</fieldset>
				
			
			</div>

			
  		
			<fieldset class="buttons">
				<input type="submit" class="delete" id="eliminar-carrera" value="Desvincular">
			</fieldset>
		
	</div>

</body>
</html>
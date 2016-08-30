<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	%{-- Incluir logica javascript --}%
	<script type="text/javascript" src = "/js/estadoAcademico.js"></script>
	%{-- Librerias javascript --}%
	<g:javascript src="librerias/arborjs/arbor.js" />
	<g:javascript src="librerias/arborjs/graphics.js" />
	<g:javascript src="librerias/arborjs/renderer.js" />
	
	%{-- Incluir cabeceras de estilos --}%
	<meta name="layout" content="main">
	%{-- Titulo de la pagina --}%
	<title><g:message code="Carrera"/></title>
</head>
<body>
		
	%{-- Barra de navegacion pagina --}%
	%{-- <div class="nav" role="navigation">
		<ul><li><a class="home" href="/"><g:message code="default.home.label"/></a></li></ul>
	</div> --}%
	%{-- Aca es donde se carga el grafo --}%

%{-- Barra de navegacion pagina --}%
	<div class="nav" role="navigation">
		<ul><li><a class="home" href="/"><g:message code="default.home.label"/></a></li></ul>
	</div>

	
	%{-- Estilo body de la pagina --}%
	<div id="page-body" role="main">	
			%{-- Formulario de creacion de nueva carrera --}%
			<div class="content scaffold-edit" role="main">
				<h1>Simulacion</h1>
				<ol class="property-list user">
				<div id ="result"></div>
				<canvas id="viewport" width="680" height="460"></canvas>
			</div>

			
  		
			<fieldset class="buttons">
				<input type="submit" class="delete" id="eliminar-carrera" value="Desvincular">
			</fieldset>
		
	</div>













	<g:javascript src="simulacion/simulacion.js" />
</body>
</html>
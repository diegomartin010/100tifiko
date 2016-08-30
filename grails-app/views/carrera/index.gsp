<%@ page import="estats.SessionManager" %>
<%@ page import="modelo.Carrera" %>
<!DOCTYPE html>
<html>
<head>
	%{-- Incluir logica javascript --}%
	<g:javascript src="carrera/manejoArchivos.js" />
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
		<% def usuario = SessionManager.getCurrentUser() %>
		
		<div class="content"><h1>Nueva carrera</h1></div>			
		<form>
			<div class="container">
				<div class="col-md-6">	
					<label>Nueva carrera:</label>
					Cargar archivo json con nueva carrera
					<a class="label label-info" href="https://es.wikipedia.org/wiki/JSON" target="_blank">Cómo es el formato?</a>				 
					<input type="file" id="nuevaCarrera">
				</div>				
			</div>
		</form>	
		
		
		<div class="container">
			<div class="col-md-5">	
    			<br><label>Carreras en el sistema:</label>
    			%{-- <ul class="list-group"> --}%
  					<g:each var="carrera" in="${Carrera.list()}">
  						%{-- <li class="list-group-item"> --}%
  						<p>
  							${carrera.id}:${carrera.nombre}
  							<input type="submit" class="btn btn-xs btn-danger pull-right eliminar" id="eliminar" value="Eliminar">
  						%{-- </li> --}%
  						</p>
  					</g:each>
				%{-- </ul> --}%
			</div>				
		</div>

	</div>

	%{-- Logica Javascript --}%
	<g:javascript src="carrera/carrera.js" />
</body>
</html>
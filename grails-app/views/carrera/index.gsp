<%@ page import="estats.SessionManager" %>
<%@ page import="modelo.Carrera" %>
<%@ page import="modelo.Materia" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/carrera/carrera.css">
	%{-- Incluir logica javascript --}%
	<g:javascript src="carrera/manejoArchivos.js" />
	%{-- Incluir cabeceras de estilos --}%
	<meta name="layout" content="main">
	%{-- Titulo de la pagina --}%
	<title><g:message code="Carrera"/></title>
</head>
<body>
	<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">×</span>
      <h2>Materias </h2>
    </div>


  					<g:each var="materia" in="${Materia.list()}">
  						%{-- <li class="list-group-item"> --}%
  	
  						<p  class="list-group-item"> 						
  							<span style="margin-left:2em" class="alert-danger">${materia.nombre}</span>  <span  class="alert-warning">TIPO</span>
  		
  						</p>
  						
  					
  					</g:each>

    <div id="cerrar" style="cursor:pointer " class="modal-footer">
      <button>Cerrar</button>
    </div>
  </div>

</div>

		
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
  					
  						<p class="list-group-item" >
  						
  							${carrera.id}:${carrera.nombre}
  							<input type="submit" class="btn btn-xs btn-danger pull-right eliminar" name="${carrera.nombre}" id="eliminar" value="Eliminar">
  							<input type="submit" class="btn btn-xs btn-primary pull-right " name="${carrera.nombre}" id="verMaterias" value="Ver Materias">

  		
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
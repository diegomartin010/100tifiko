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

	

	
	%{-- Estilo body de la pagina --}%
	<div id="page-body" role="main">

		%{-- Se captura el usuario actual en sesion --}%
		<% def usuario = SessionManager.getCurrentUser() %>
	
			%{-- Formulario de creacion de nueva carrera --}%
			<div class="content scaffold-edit" role="main">
				<h1> Nueva carrera</h1>
				<ol class="property-list user">
				<div id ="result"></div>
				%{-- Inicio del formulario --}%
				<fieldset class="form">
					<div class="fieldcontain required">
						<div class="alert alert-info" role="alert">
							<label>Archivo de nueva carrera:</label>
							<span>Cargar archivo json con nueva carrera
							  <a style="display: inline-block;" target="_blank" href="https://es.wikipedia.org/wiki/JSON">Cómo es el formato?</a> 
							 </span>
							<input type="file" id="nuevaCarrera">

						</div>
					</div>
					<div class="fieldcontain required">
						<label>Carreras en el sistema:</label>
						<br>
						<ul class="list-group">
		  					<g:each var="carrera" in="${Carrera.list()}">
    							<li class="list-carreras">
		  							<span> <label>${carrera.id}: </label> ${carrera.nombre} </span>
		  							    <select name=${carrera.id} id=${carrera.id}>
		  								<option selected disabled>Acciones</option>
		  								<option value="1">Eliminar</option>
		  								</select>
		  						</li>
		  					<br><br><br>
    						</g:each>
		  					
						</ul>					
					</div>
				</fieldset>
				
			
			</div>

			
  		
		
	</div>
	</div>

</body>
</html>
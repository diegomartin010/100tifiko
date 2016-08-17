<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	%{-- Incluir logica javascript --}%
	<script type="text/javascript" src = "/js/estadoAcademico.js"></script>
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

		%{-- Si el usuario no tiene estado academico, lanzar formulario de creacion --}%
		<g:if test="${usuario.estadoAcademico == null}">
			
			%{-- Formulario de creacion Eacad --}%
			<div class="content scaffold-edit" role="main">
				<h1>Asociar carrera</h1>
				<ol class="property-list user">
				<div id ="result"></div>
				%{-- Inicio del formulario --}%
				<fieldset class="form">
					%{-- <form action="#!"> --}%
						<div class="fieldcontain required">
							<label>Legajo:</label>
							<input type="text" id = "legajo" class = "legajo-text" name="legajo"><br>
						</div>
						<div class="fieldcontain required">
							<label>Carrera:</label>
							<select class = "carrera-select" id ="carrera"></select>
						</div>
		
						<br>
						<fieldset class="buttons" id = "container">
							<input type="submit" class="save" id="asociar-carrera" value="vincular">
						</fieldset>
					%{-- </form> --}%
				</fieldset>
			</div>
			
		</g:if>

		%{-- Si el usuario ya tiene un estado academico creado, mostrarlo.--}%
		<g:else>
    		
    		<h1>Carrera:</h1>
			<ol class="property-list user">
    			<ul class="list-group">
  					<li class="list-group-item">
  						<label>Nombre:</label>${usuario.estadoAcademico.carrera.nombre}
  					</li>
					<li class="list-group-item">
						<label>Numero de legajo:</label>${usuario.estadoAcademico.legajo}
					</li>
  					<li class="list-group-item">
  						<label>NyA del alumno:</label>${usuario.nombre} ${usuario.apellido}
  					</li>
				</ul>
			
			%{-- Mensaje de alerta y botones --}%
			<div class="alert alert-danger" id="warning" role="alert">
				
				%{-- Mensaje --}%
				<h3>Advertencia!</h3>
				<p>ACCION IRREVERSIBLE: Si te desvinculas, perderas toda la informacion que hayas asociado a la carrera:<h4> ${usuario.estadoAcademico.carrera.nombre}</h4></p>
				
				%{-- Boton de confirmacion --}%
				<div class="btn-group">
				  	<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    	Acciones <span class="caret"></span>
				  	</button>
				  	%{-- Opciones del boton --}%
				  	<ul class="dropdown-menu">
					    <li><a href="#" id="agree">Basicamente SI</a></li>
				    	<li role="separator" class="divider"></li>
				    	<li><a href="/" id="notAgree">Salid de aqui</a></li>
				  	</ul>
				</div>
			</div>
			
			%{-- Boton para dar de baja --}%
			<fieldset class="buttons">
				<input type="submit" class="delete" id="eliminar-carrera" value="Desvincular">
			</fieldset>
		</g:else>
	</div>

</body>
</html>
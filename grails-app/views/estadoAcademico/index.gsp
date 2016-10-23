<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	%{-- Incluir logica javascript --}%
	<g:javascript src="estadoAcademico/estadoAcademico.js" />
	%{-- Incluir cabeceras de estilos --}%
	<meta name="layout" content="main">
	%{-- Titulo de la pagina --}%
	<title><g:message code="Carrera"/></title>
</head>
<body>

	%{-- Estilo body de la pagina --}%
	<div id="page-body" role="main">

		%{-- Se captura el usuario actual en sesion --}%
		<% def usuario = SessionManager.getCurrentUser() %>
		%{-- Titulo de la pagina --}%
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Carrera</h1>
            </div>
        </div>
        %{-- ./row --}%
		%{-- Si el usuario no tiene estado academico, lanzar formulario de creacion --}%
		<g:if test="${usuario.estadoAcademico == null}">		
			
			<form>
				<div class="container">
					<div class="col-md-4">	
						<label>Legajo:</label>
						<input type="text" id = "legajo" class = "form-control" name="legajo" placeholder="Legajo...">
						<label>Carrera:</label>
						<select class = "form-control" id ="carrera" placeholder="Legajo...">
							<option>Elija una carrera...</option>
						</select>
						<br><input type="submit" class="btn btn-default" id="asociar-carrera" value="Vincular">
					</div>				
				</div>
			</form>	

		</g:if>

		%{-- Si el usuario ya tiene un estado academico creado, mostrarlo.--}%
		<g:else>
    		<div class="container">
				<div class="col-md-6">	
					<p>Nombre: ${usuario.estadoAcademico.carrera.nombre}</p>
					<p>Legajo: ${usuario.estadoAcademico.legajo}</p>
					<p>Nombre y apellido:${usuario.nombre} ${usuario.apellido}</p>
					<input type="submit" class="btn btn-danger" id="eliminar-carrera" value="Desvincular">
				</div>				
			</div>
		</g:else>
	</div>

</body>
</html>
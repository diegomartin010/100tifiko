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
                <h1 class="page-header"> <i class="fa fa-road fa-fw"></i> Carrera</h1>
            </div>
        </div>
        %{-- ./row --}%
		%{-- Si el usuario no tiene estado academico, lanzar formulario de creacion --}%
		<g:if test="${usuario.estadoAcademico == null}">		
			
			<form>
				<div class="panel panel-default">
					<div class="panel-heading">
	                    <i class="fa fa-chain fa-fw"></i> Vincular una carrera
	                </div>
                	<div class="panel-body">
						<div class="col-md-4">	
							<label>Legajo:</label>
							<input type="text" id = "legajo" class = "form-control" name="legajo" placeholder="Legajo...">
							<label>Carrera:</label>
							<select class = "form-control" id ="carrera" placeholder="Legajo...">
								<option>Elija una carrera...</option>
							</select>
							
						</div>	
					</div>
					<div class="panel-footer">
	                    <input type="submit" class="btn btn-default" id="asociar-carrera" value="Vincular">
	                </div>	
				</div>		
				
			</form>	

		</g:if>

		%{-- Si el usuario ya tiene un estado academico creado, mostrarlo.--}%
		<g:else>
    		<div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-database fa-fw"></i> Carrera actual
                </div>
                <div class="panel-body">
                	<div class="row">
	                	<div class="col-lg-6">
	                    	<div class="panel panel-default">
	                			<div class="panel-heading">Datos del alumno</div>
	                			<div class="panel-body">
	                				<p>Legajo: ${usuario.estadoAcademico.legajo}</p>
	                               	<p>Nombre: ${usuario.nombre}</p>
	                              	<p>Apellido: ${usuario.apellido}</p>
								</div>
							</div>
	                    </div>
	                	<div class="col-lg-6">
	                		<div class="panel panel-default">
	                			<div class="panel-heading">Datos de la carrera</div>
	                			<div class="panel-body">
	                				<p>Nombre de carrera: ${usuario.estadoAcademico.carrera.nombre}</p>
	                                <p>Codigo de carrera: ${usuario.estadoAcademico.carrera.codigo}</p>
								</div>
							</div>
	                    </div>
	                </div>
                    %{-- ./row --}%
				</div>
				%{-- /panel body --}%
				<div class="panel-footer">                
					<input type="submit" class="btn btn-danger" id="eliminar-carrera" value="Desvincular">				
 				</div>
 			</div>
 			%{-- /panel --}%
		</g:else>
	</div>

</body>
</html>
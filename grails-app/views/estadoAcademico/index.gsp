<%@ page import="estats.*" %>
<%@ page import="modelo.*" %>
<%@ page import="security.*" %>
<!DOCTYPE html>
<html>
<head>
	%{-- Incluir logica javascript --}%
	<g:javascript src="estadoAcademico/estadoAcademico.js" />
	%{-- Incluir cabeceras de estilos --}%
	<meta name="layout" content="main">
	%{-- Titulo de la pagina --}%
	<title>Carrera</title>
</head>
<body>

	%{-- Estilo body de la pagina --}%
	<div id="page-body" role="main">

		%{-- Se captura el usuario actual en sesion --}%
		<% def usuario = user %>
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
	                    <i class="fa fa-mortar-board"></i> <label>Vincular una carrera</label>
	                </div>
                	<div class="panel-body">
						<div class="col-md-4" >	
							<label>Legajo:</label>
							<input type="text" id = "legajo" class = "form-control" name="legajo" placeholder="Legajo...">
							<label>Carrera:</label>
							<select class = "form-control" id ="carrera" placeholder="Legajo...">
								<option>Elija una carrera...</option>
							</select>
							
						</div>	
					</div>
					<div class="panel-footer">
	                    <button class="btn btn-primary pull-right" id="asociar-carrera"><i class="fa fa-save"></i> Vincular</button><br><br>
	                </div>	
				</div>		
				
			</form>	

		</g:if>

		%{-- Si el usuario ya tiene un estado academico creado, mostrarlo.--}%
		<g:else>
    		<div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-mortar-board"></i> <label>Carrera actual</label>
                </div>
                <div class="panel-body">
                	<div class="row">
	                	<div class="col-lg-6">
	                    	<div class="panel panel-default">
	                			<div class="panel-heading"><label>Datos del alumno</label></div>
	                			<div class="panel-body">
	                				<p>Legajo: ${usuario.estadoAcademico.legajo}</p>
	                               	<p>Nombre: ${usuario.nombre}</p>
	                              	<p>Apellido: ${usuario.apellido}</p>
								</div>
							</div>
	                    </div>
	                	<div class="col-lg-6">
	                		<div class="panel panel-default">
	                			<div class="panel-heading"><label>Datos de la carrera</label></div>
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
					<button class="btn btn-danger pull-right" id="eliminar-carrera"><i class="glyphicon glyphicon-trash"></i> Desvincular</button>
					%{-- <input type="submit" class="btn btn-danger pull-right" id="eliminar-carrera" value="Desvincular"> --}%
					<div class = "space"/>
 				</div>
 			</div>
 			%{-- /panel --}%
		</g:else>
	</div>

</body>
</html>
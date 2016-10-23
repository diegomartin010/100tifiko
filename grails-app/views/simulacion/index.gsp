<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	%{-- Librerias javascript --}%
	<g:javascript src="librerias/arborjs/arbor.js" />
	<g:javascript src="librerias/arborjs/graphics.js" />
	<g:javascript src="librerias/arborjs/renderer.js" />
	
	%{-- Incluir cabeceras de estilos --}%
	<meta name="layout" content="main">
	%{-- Titulo de la pagina --}%
	<title><g:message code="Simulación"/></title>
</head>
<body>

	%{-- Barra de navegacion pagina --}%
	<div class="nav" role="navigation">
	</div>

	
	%{-- Estilo body de la pagina --}%
	<div id="page-body" role="main">	
		%{-- Titulo de la pagina --}%
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Simulación</h1>
            </div>
        </div>
		<div class="col-md-2">	
			<select class = "form-control" id ="materia">
				<option>Filtrar por ...</option>
				<option>Correlatividad para cursar</option>
				<option>Correlatividad para rendir</option>
			</select>
		</div>
		<div class="container">
			<div class="col-md-6">	
				<ul class="list-group">
 					<li class="list-group-item" style="width:710px; height:460px;"><canvas id="viewport" width="680" height="460"></canvas></li>
				</ul>
				
			</div>				
		</div>
		<div class="content"><h1>Agenda</h1></div>
		%{-- Contenedor nueva fecha --}%
		

		%{-- Fomulario nueva materia --}%
		<div class="container">	
			<div class="col-md-6">	
				<input type="submit" class="btn  btn-default pull-right" value="Guardar agenda">
				<br><br>
			</div>
		</div>	
		<div class="container">
			<label>Nueva fecha</label>
		</div>
		<div class="container">	

    		<div class="col-md-10">	
				<div class="col-md-3">	
					<input type="text" id="fecha" class="form-control" name="fecha" placeholder="Fecha">	
				</div>
				<div class="col-md-3">	
					<select class = "form-control" id ="materia">
						<option>Elija una materia...</option>
					</select>
				</div>
				<div class="col-md-1">	
					<input type="submit" class="btn btn-xs btn-success pull-right" value="Agregar">
				</div>
			</div>
		</div>
		%{-- Fomulario nueva materia --}%
		<div class="container">
			<label>Proximas fechas</label>
		</div>
		<div class="container">	
    		<div class="col-md-10">	
				<div class="col-md-3">	
					<input type="text" id="legajo" class="form-control" name="legajo" placeholder="Fecha">	
				</div>
				<div class="col-md-3">	
					<input type="text" id = "legajo" class = "form-control" name="legajo" placeholder="Materia">	
				</div>
				<div class="col-md-1">	
					<input type="submit" class="btn btn-xs btn-danger pull-right" value="Eliminar">
				</div>
			</div>
		</div>
		%{-- Fomulario nueva materia --}%
		<div class="container">	
    		<div class="col-md-10">	
				<div class="col-md-3">	
					<input type="text" id="legajo" class="form-control" name="legajo" placeholder="Fecha">	
				</div>
				<div class="col-md-3">	
					<input type="text" id = "legajo" class = "form-control" name="legajo" placeholder="Materia">	
				</div>
				<div class="col-md-1">	
					<input type="submit" class="btn btn-xs btn-danger pull-right" value="Eliminar">
				</div>
			</div>
		</div>
	</div>

	<g:javascript src="simulacion/simulacion.js" />
</body>
</html>
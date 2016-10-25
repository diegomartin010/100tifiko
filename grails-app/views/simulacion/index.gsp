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

	%{-- Titulo de la pagina --}%
	<div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Simulación</h1>
        </div>
    </div>

	<div class="row">
        <div class="col-lg-12">
        	<div class="panel panel-default">
      			<div class="panel-heading">
      				Planificacion
      			</div>
				<div class="panel-body">
					%{-- Eliminar eventos --}%
					<div class="row">	
						<div class="col-md-3">	
							<input type="text" id="fecha" class="form-control" name="fecha" placeholder="Fecha">	
						</div>
						<div class="col-md-3">	
							<select class = "form-control" id ="materia">
								<option>Elija una materia...</option>
							</select>
						</div>
						<div class="col-md-1">	
							<input type="submit" class="btn btn-xs btn-danger pull-right" value="eliminar">
						</div>
					</div>
					%{-- eliminar eventos --}%
					<div class="row">	
						<div class="col-md-3">	
							<input type="text" id="fecha" class="form-control" name="fecha" placeholder="Fecha">	
						</div>
						<div class="col-md-3">	
							<select class = "form-control" id ="materia">
								<option>Elija una materia...</option>
							</select>
						</div>
						<div class="col-md-1">	
							<input type="submit" class="btn btn-xs btn-danger pull-right" value="eliminar">
						</div>
					</div>%{-- ./row --}%
					
					%{-- Agregar eventos --}%
					<div class="row">	
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
					
				</div>%{-- /panel body --}%
				<div class="panel-footer">
					<a href="" class="btn btn-default">Guardar Eventos</a>
				</div>
			</div>%{-- /panel panel-default --}%
        </div>%{-- /col-lg-12 --}%
    </div>%{-- /row --}%
    
    %{-- Panel del simulador --}%
	<div class="row">
        <div class="col-lg-12">
        	<div class="panel panel-default">
      			<div class="panel-heading">
  					Simulador        
                    <a data-toggle="collapse" class = "btn btn-xs btn-default pull-right" href="#collapseOne">
                    	Mostrar / Ocultar
                    </a>
      			</div>
      			<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body">
						<p>Descripcion del grafico</p>
						<canvas id="viewport" width="870" height="500"></canvas>
					</div>
				</div>%{-- /collapseOne --}%
			</div>%{-- /panel default --}%
        </div>%{-- /col-lg 12 --}%
    </div>%{-- /row --}%

	

	

<g:javascript src="simulacion/simulacion.js" />
</body>
</html>
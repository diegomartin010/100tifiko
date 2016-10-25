<%@ page import="estats.SessionManager" %>
<%@ page import="estats.AutoridadModulos" %>
<%def modulo_nombre = "simulacion"%>
<%def modulo = AutoridadModulos.getByName(modulo_nombre)%>
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
            <h1 class="page-header"><i class="${modulo.icono}"></i>${modulo.titulo}</h1>
        </div>
    </div>

	<div class="row">
        <div class="col-lg-12">
        	<div class="panel panel-default">
      			<div class="panel-heading">
      				Planificacion
      			</div>
				<div class="panel-body">
					
					%{-- Agregar eventos --}%
					<div class="row">	
						<div class="col-md-2">	
							<input type="text" id="fecha-new" class="form-control" name="fecha" placeholder="Fecha">	
						</div>
						<div class="col-md-4">	
							<input type="text" id="descripcion-new" class="form-control" name="descripcion" placeholder="Descripcion del evento">	
						</div>
						<div class="col-md-2">	
							<select class = "form-control" id ="tipo-new" >
								<option>Examen</option>
								<option>Alarma</option>
							</select>
						</div>
						<div class="col-md-1">	
							<input type="submit" id = "agregar" onclick="nuevoEvento()" class="btn btn-xs btn-success pull-right" value="Agregar">
						</div>
					</div>

					%{-- Eliminar eventos --}%
					
					<div class="row cargar" id="cargados" hidden>	
						<div class="col-md-2">	
							<input type="text" id="fecha-load" class="form-control" name="fecha-load" placeholder="Fecha"disabled>	
							<div id="put"></div>
						</div>
						<div class="col-md-4">	
							<input type="text" id="descripcion-load" class="form-control" name="descripcion-load" placeholder="Descripcion del evento"disabled>	
							<div id="put"></div>
						</div>
						<div class="col-md-2">	
							<input type="text" id="tipo-load" class="form-control" name="tipo-load" placeholder="Tipo"disabled>	
							<div id="put"></div>
						</div>
						<div class="col-md-1">	
							<input type="submit" class="btn btn-xs btn-danger pull-right" id="eliminar-load" value="Eliminar">
							<div id="put"></div>
						</div>
					</div>	

							
				</div>%{-- /panel body --}%
				<div class="panel-footer">
					<a href="" class="btn btn-default" onclick="guardarEventos()">Guardar Eventos</a>
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

%{-- Javascript --}%
<g:javascript src="simulacion/simulacion.js" />
<g:javascript src="simulacion/cargarEventos.js" />
</body>
</html>
<%@ page import="estats.SessionManager" %>
<%@ page import="estats.AutoridadModulos" %>
<%def modulo_nombre = "simulacion"%>
<%def modulo = AutoridadModulos.getByName(modulo_nombre)%>
<!DOCTYPE html>
<html>
<head>

	%{-- Incluir cabeceras de estilos --}%
	<meta name="layout" content="main">
	<!-- Titulo de la pagina -->
	<title><g:message code="Simulación"/></title>
	<!-- hoja de estilos de la movida de grafos -->
	<style type="text/css">
        #mynetwork {
            width: 100%;
            height: 400px;
            border: 1px solid lightgray;
        }
    </style>
    	<!-- <g:javascript src="examen/examen.js" />  -->
</head>
<body>

	<!-- Titulo de la pagina -->
	<div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><i class="${modulo.icono}"></i>${modulo.titulo}</h1>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
           <i class="fa fa-file-text"></i> <label>Panel de eventos</label>
        </div>
		<div class="panel-body">
			<a id = "grafo" onclick="window.open('/simulacion/grafo')" class="btn btn-info pull-right">Correlatividades <i class="fa fa-share-alt"></i> </a>
		


			<!-- Agregar eventos -->
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
			</div><!-- /row -->




			<!-- Eliminar eventos  -->
			<div class="row cargar" id="cargados" hidden>	
				<div class="col-md-2">	
					<input type="text" id="fecha-load" class="form-control date" name="fecha-load" placeholder="Fecha" disabled/>	
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
			</div><!-- / id cargados -->

				
		</div><!-- /panel body -->
		
		<div class="panel-footer">
			<a href="#" class="btn btn-primary" onclick="guardarEventos()">Guardar Eventos</a>
		</div>
	</div><!-- /panel panel-default-->
                	
	



<!-- Javascript -->
<g:javascript src="jquery/jquery-ui.js"/>
<g:javascript src="jquery/jquery-ui.css"/>
<g:javascript src="simulacion/grafos.js" />
<g:javascript src="simulacion/cargarEventos.js" />
<g:javascript src="simulacion/nuevosEventos.js" />
</body>
</html>
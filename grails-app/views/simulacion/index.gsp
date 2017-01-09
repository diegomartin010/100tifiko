<%@ page import="estats.*" %>
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
           <a id = "grafo" onclick="window.open('/simulacion/grafo')" class="btn btn-default pull-right">Correlatividades <i class="fa fa-share-alt"></i></a>
           <br><br>
        </div>
		<div class="panel-body">

			<!-- Agregar eventos -->
			<div class="row">	
				<div class="col-md-2">
					<label>Fecha</label>	
					<input type="text" id="fecha-new" class="form-control" name="fecha" placeholder="Fecha">	
				</div>
				<div class="col-md-4">	
					<label>Descripcion</label>
					<input type="text" id="descripcion-new" class="form-control" name="descripcion" placeholder="Descripcion del evento">	
				</div>
				<div class="col-md-2">	
					<label>Tipo</label>
					<select class = "form-control" id ="tipo-new" >
						<option value = "E">Examen</option>
						<option value = "A">Alarma</option>
					</select>
				</div>
				<div class="col-md-1">	
					<br>
					<input type="submit" id = "agregar" onclick="nuevoEvento()" class="btn btn-xs btn-success pull-right" value="Agregar">
				</div>
				<br><br>
			</div><!-- /row -->




			<!-- Eliminar eventos  -->
			<% def eventos = SessionManager.getCurrentUser().estadoAcademico.eventos %>
			<div class="row cargar" id="cargados">	
				<g:each var="evento" in="${eventos}">
					<div class="col-md-2">	
						<input type="text" id="fecha-load" class="form-control date" name="fecha-load" placeholder="${evento.fecha}" disabled/>	
						<div id="put"></div>
					</div>
					<div class="col-md-4">	
						<input type="text" id="descripcion-load" class="form-control" name="descripcion-load" placeholder="${evento.descripcion}"disabled>	
						<div id="put"></div>
					</div>
					<div class="col-md-2">	
						<input type="text" id="tipo-load" class="form-control" name="tipo-load" placeholder="${evento.tipo}"disabled>	
						<div id="put"></div>
					</div>
					<div class="col-md-1">	
						%{-- <input type="submit" class="btn btn-xs btn-danger pull-right" id="eliminar-load" name="tipo-load" value="Eliminar"> --}%
						<button class="btn btn-xs btn-danger pull-right" id="eliminar-load" onclick="eliminarEvento(${evento.id})">
							Eliminar
						</button>
					</div>
					<br><br>
				</g:each>
			</div><!-- / id cargados -->


				
		</div><!-- /panel body -->
		
		<div class="panel-footer">
			<br><br>
		</div>
	</div><!-- /panel panel-default-->
                	
	

<!-- Javascript -->
<g:javascript src="jquery/jquery-ui.js"/>
<g:javascript src="jquery/jquery-ui.css"/>

<g:javascript>
	// Setear datepicker
	$( "#fecha-new" ).datepicker();
	
	function nuevoEvento(){
		$.post( "/agenda/guardarEventoSimulacion", {
	    
	          fecha: $('#fecha-new').val()
	        , tipo: $('#tipo-new').val()
	        , descripcion: $('#descripcion-new').val()
    	
    	}).done(function(){ location.reload() })

		

	}	

	function eliminarEvento(id){
		
		$.post( "/agenda/eliminarEvento", {
	          id: id
    	}).done(function() {
    		location.reload()
  		})

		

	}	

</g:javascript>
</body>
</html>
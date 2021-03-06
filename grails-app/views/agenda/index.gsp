<%@ page import="estats.SessionManager" %>
<%@ page import="estats.AutoridadModulos" %>
<%def modulo_nombre = "agenda"%>
<%def modulo = AutoridadModulos.getByName(modulo_nombre)%>
<!DOCTYPE html>
<html>
<head>
	<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/lib/moment.min.js'></script>
	<script src="http://fullcalendar.io/js/fullcalendar-2.1.1/lib/jquery-ui.custom.min.js"></script>
	<script src='http://fullcalendar.io/js/fullcalendar-2.1.1/fullcalendar.min.js'></script>
	<!-- ojo estos 3 -->

	<script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
	<!-- ya está arriba
	<g:javascript src="librerias/fullcalendar/moment.min.js"/>
	-->
	<g:javascript src="jquery/jquery.min.js"/>
	<g:javascript src="librerias/fullcalendar/dist/fullcalendar.js"/>
	<g:javascript src="librerias/fullcalendar/dist/lang/es.js"/>
	<link rel="stylesheet" href="js/librerias/fullcalendar/fullcalendar.css">
	<g:javascript src="librerias/datejs/date.js" />
	%{-- Incluir logica javascript  --}%
	<g:javascript src="agenda/agenda222.js" />
	<meta name="layout" content="main">
	<title><g:message code="Agenda"/></title>
</head>
<body>
	

	%{-- Body --}%
	<div id="page-body" role="main">
	%{-- Titulo de la pagina --}%
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class = "${modulo.icono}"></i> ${modulo.titulo}</h1>
            </div>
        </div>
			<form>
				<div class="container">
					<div class="col-md-8">
						
						<div id="calendar" class="fc fc-unthemed fc-ltr"></div>
					
						<div id="datepicker"></div>
					</div>
				</div>
			</form>	
	</div>

<!--MODAL MODAL MODAL MODAL -->


<!-- Modal Crear-->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><i class="fa fa-plus"></i> Nuevo Evento</h4>
      </div>
      <div class="modal-body">
			         <form>
			  			<div class="form-group">
						    <label for="nombre">Nombre del evento:</label>
						    <input type="text" class="form-control" id="nombre">
						</div>

						<div class="form-group">
							<label for="nombre">Clase del evento:</label>
							<select id="idnota" class="selectpicker form-control">
		          						<option value = "E" >Examen</option>
							            <option value = "A" >Alerta</option>
							</select>
						</div>
						<div class="form-group">
						    <label for="fecha">Fecha:</label>
						    <input type="date" class="form-control" id="idfecha" disabled>
						  </div>
					</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Cancelar</button>
        <button type="button" onClick="saracho2()" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-save"></i> Guardar</button>
      </div>
    </div>

  </div>
</div>

<!-- Modal Modificar o Eliminar-->
<div id="modalModif" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"> <i class="fa fa-pencil"></i> Modificar o Eliminar Evento</h4>
      </div>
      <div class="modal-body">
      <!--<button type="button" onClick="saracho4()" class="btn btn-danger pull-right " data-dismiss="modal"><i class="glyphicon glyphicon-trash"></i> Eliminar Evento</button><br> --><br> 
			         <form>
			  			<div class="form-group">
						    <label for="nombre">Nombre del evento:</label>
						    <input type="text" class="form-control" id="nombre2">
						</div>

						<div class="form-group">
							<label for="nombre">Clase del evento:</label>
							<select id="idnota" class="selectpicker form-control">
		          						<option value = "E" >Examen</option>
							            <option value = "A" >Alerta</option>
							</select>
						</div>
						<div class="form-group">
						    <label for="fecha">Fecha:</label>
						    <input type="date" class="form-control" id="idfecha" disabled>
						  </div>
						<div class="form-group">
						    <label for="fecha">Nueva Fecha:</label>
						    <input type="text" class="form-control" id="datepicker2" placeholder="Fecha">
						  </div>
					</form>

      </div>
      <div class="modal-footer">
      <button type="button" onClick="saracho3()" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-save pull-right"></i> Modificar</button>
      	<button type="button" onClick="saracho4()" class="btn btn-danger " data-dismiss="modal"><i class="glyphicon glyphicon-trash"></i> Eliminar Evento</button>
        <button type="button" class="btn btn-warning pull-left" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Cancelar</button>
        

        <input type="hidden" id="params3">
      </div>
    </div>

  </div>
</div>
<!-- Javascript -->

<g:javascript src="jquery/jquery-ui.js"/> 
<g:javascript src="jquery/jquery-ui.css"/>

</body>
</html>

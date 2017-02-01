<%@ page import="estats.AutoridadModulos" %>
<%def modulo_nombre = "index"%>
<%def modulo = AutoridadModulos.getByName(modulo_nombre)%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>	
		<title>100tifiko</title>

	</head>
	<body>

	 <!-- Estilo body de la pagina  -->
	
		<!-- Titulo de la pagina  -->
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="${modulo.icono}"></i>${modulo.titulo}</h1>
            </div>
        </div>
       <!-- ./row  -->

		
		<!-- Panel de examenes -->
	    <div class="panel-group" id="accordion">
            <div class="panel panel-primary">
            	<!-- Cabecera panel -->
                <div class="panel-heading">
                	<i class="fa fa-file-text-o"></i> <label>Próximos Exámenes (que debés rendir menos de 15 dias)</label>
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="btn btn-default btn-xs pull-right">Ocultar / Mostrar</a>                 
                </div><!-- Fin cabecera -->
                <!-- Movida collapse -->
                <div id="collapseOne" class="panel-collapse collapse in">
                    <!-- Body del panel -->
                    <div class="panel-body">
                        <g:each var="examen" in="${examenesProximos}">
	                		<div class="list-group">
                                <a href="#" class="list-group-item">
                                    <div class="row">
                                        <div class="col-sm-10">
                                            <i class="fa fa-exclamation-circle"></i> ${examen.evento.descripcion} <em>(${examen.evento.fecha.format( 'dd/MM/yyy' )})</em>
                                            <span class=" text-muted small">
                                                Faltan: (${examen.diasRestantes} dias)
                                            </span>
                                            </div>
                                        <div class="col-sm-1">
                                           
                                        </div>
                                        <div class="col-sm-1">
                                            <button type="button" onclick='cambiarEstado(${examen.evento.id})' class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-times-circle"></i></button>
                                        </div>
                                    </div>  
                                </a>
                            </div>
	            		</g:each>

                        %{-- Examenes pasados. --}%
                        <g:each var="examenPasado" in="${examenesPasados}">
                            <div class="list-group">
                                <a href="#" class="list-group-item list-group-item-danger">
                                    <div class="row">
                                        <div class="col-sm-10">
                                            <i class="fa fa-exclamation-circle"></i> ${examenPasado.evento.descripcion}
                                            <span class=" text-muted small">
                                                -- Rendido el Dia: (${examenPasado.evento.fecha.format( 'dd/MM/yyy' )}))
                                            </span>
                                            </div>
                                        <div class="col-sm-1">
                                            <button class="btn btn-primary btn-xm pull-right" onclick="location.href='/examen'">
                                               Calificacion
                                            </button>
                                        </div>
                                        <div class="col-sm-1">
                                            <button type="button" onclick='cambiarEstado(${examenPasado.evento.id})' class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-times-circle"></i></button>
                                        </div>
                                    </div>  
                                </a>
                            </div>
                        </g:each>
                        <g:if test="${examenesProximos.size()==0}">
                            <p>Usted no registra proximos examenes.</p>
                        </g:if>
	            		<button class="btn btn-default">Ver Todos</button>
	            		<!-- <a href="/examen" class="btn btn-default pull-right">Cargar Examen</a> -->
                    </div><!-- ./panel body -->
                </div>
         	</div><!-- ./panel default -->
        </div><!-- ./panel de examenes -->
               
                  
        <!-- Panel de notificaciones -->
        <div class="panel-group" id="accordion">
            <div class="panel panel-info">
                <!-- Heading -->
                <div class="panel-heading">
                    <i class="fa fa-bell fa-fw"></i> <label>Otras Alarmas</label>
					<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" class="btn btn-default btn-xs pull-right">Ocultar / Mostrar</a>                 
                </div>
                <div id="collapseTwo" class="panel-collapse collapse in">
                    <!-- Vamos con el body -->
                    <div class="panel-body">
                       <g:each var="alerta" in="${alertasProximas}">
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    <div class="row">
                                        <div class="col-sm-11">
                                            <i class="fa fa fa-calendar"></i> ${alerta.evento.descripcion} <em>(${alerta.evento.fecha.format( 'dd/MM/yyy' )})
                                            <span class=" text-muted small">
                                                Faltan: (${alerta.diasRestantes} dias)
                                            </span>
                                        </div>
                                        <div class="col-sm-1">
                                            <button type="button" onclick='cambiarEstado(${alerta.evento.id})' class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-times-circle"></i></button>
                                        </div>
                                    </div>  
                                </a>
                            </div>
                        </g:each>
	            		<g:if test="${alertasProximas.size()==0}">
                            <p>Usted no registra proximas alertas.</p>
                        </g:if>
                        <button class="btn btn-default">Ver Todos</button>
                    </div>
                </div>
         	</div><!-- ./panel default -->
        </div><!-- ./panel group acordion -->
                                
<g:javascript>
    function cambiarEstado(id){
        
        $.post( "/agenda/cambiarEstado", {
            id: id
        }).done(function() {
            location.reload()
        })

    }
</g:javascript>                          


</body>
</html>

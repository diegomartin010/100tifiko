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
                       <g:each in="${ (0..<3) }">
	                		<!-- <div class="alert alert-info alert-dismissable">
	                    		<button type="button" class="btn btn-danger btn-xs pull-right" data-dismiss="alert" aria-hidden="true">Ignorar</button>
	                    		Notificacion # ${it}
	                    		<a href="/examen" class="btn btn-default btn-xs ">Ir a examenes</a>
	                		</div> -->
	                		<div class="list-group">
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-exclamation-circle"></i> Final de analisis mat1 <em>(01/01/01)</em>
                                    <span class="pull-right text-muted small">Faltan: (3 dias)
                                    </span>
                                </a>
                            </div>
	            		</g:each>
	            		<button class="btn btn-default">Ver todos</button>
	            		<a href="/examen" class="btn btn-default">Cargar Examen</a>
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
                       <g:each in="${ (0..<3) }">
	                		<div class="list-group">
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-calendar"></i> Notificacion ${it} <em>(01/01/01)</em>
                                    <span class="pull-right text-muted small">Faltan: (3 dias)
                                    </span>
                                </a>
                            </div>
	            		</g:each>
	            		<button class="btn btn-default">Ver todos</button>
                    </div>
                </div>
         	</div><!-- ./panel default -->
        </div><!-- ./panel group acordion -->
                                
                           


</body>
</html>

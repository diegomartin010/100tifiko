<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	<g:javascript src="estadoAcademico/estadoAcademico.js" />  
	<meta name="layout" content="main">
	<title><g:message code="Carrera"/></title>
</head>
<body>
	
	%{-- Estilo body de la pagina --}%
	
		<% def usuario = SessionManager.getCurrentUser() %>
		%{-- Titulo de la pagina --}%
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-thumbs-o-down fa-fw"></i>Estado Academico</h1>
            </div>
        </div>
        %{-- ./row --}%		
		
		%{-- Negrada para no tener que escribir mucho --}%
        <%def mensajes = [
        	pendientes:[
        		titulo: "Pendientes",
        		mensaje: "Se muestran todas las materias que podes cursar."
        	],
        	enCurso:[
        		titulo: "Cursando",
        		mensaje: "Se muestran todas las materias que cursas actualmente."
        	],
        	aprobadas:[
        		titulo: "Aprobadas",
        		mensaje: "Se muestran todas las materias que aprobaste."
        	],
        	regularizadas:[
        		titulo: "Regularizadas",
        		mensaje: "Se muestra todas las materias que has regularizado."
        	]
        ]%>
        <div class="panel panel-default">
            <div class="panel-heading">Estado Actual</div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="active">
                    	%{-- Se aplica la negrada --}%
                    	<a href="#pendientes-tab" data-toggle="tab">${mensajes.pendientes.titulo}</a>
                    </li>
                    <li>
                    	<a href="#encurso-tab" data-toggle="tab">${mensajes.enCurso.titulo}</a>
                    </li>
                    <li>
                    	<a href="#regularizadas-tab" data-toggle="tab">${mensajes.regularizadas.titulo}</a>
                    </li>
                    <li>
                    	<a href="#aprobadas-tab" data-toggle="tab">${mensajes.aprobadas.titulo}</a>
                    </li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="pendientes-tab">
                    	<h4>${mensajes.pendientes.titulo}</h4>
                    	<p>${mensajes.pendientes.mensaje}</p>
						<div id="pendientes"></div>
                    </div>
                    <div class="tab-pane fade" id="encurso-tab">
                    	<h4>${mensajes.enCurso.titulo}</h4>
                    	<p>${mensajes.enCurso.mensaje}</p>
						<div id="en_curso"></div>	
                    </div>
                    <div class="tab-pane fade" id="regularizadas-tab">
                    	<h4>${mensajes.regularizadas.titulo}</h4>
                    	<p>${mensajes.regularizadas.mensaje}</p>
						<div id="regularizadas"></div>
                    </div>
                    <div class="tab-pane fade" id="aprobadas-tab">
                    	<h4>${mensajes.aprobadas.titulo}</h4>
                    	<p>${mensajes.aprobadas.mensaje}</p>
                    	<div id="aprobadas"></div>
                    </div>
                </div>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->


		
	

</body>
</html>
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
	<div id="page-body" role="main">
		<% def usuario = SessionManager.getCurrentUser() %>
		%{-- Titulo de la pagina --}%
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Estado Academico</h1>
            </div>
        </div>
        %{-- ./row --}%		
		
		<div id="aprobadas" class="col-md-12">
			<div class="content"><h3>Materias Aprobadas</h3></div>
		</div>
		<div id="regularizadas" class="col-md-12" >
			<div class="content"><h3>Materias Regularizadas</h3></div>	
		</div>
		<div id="en_curso" class="col-md-12" >
			<div class="content"><h3>Materias en curso</h3></div>	
		</div>
		<div id="pendientes" class="col-md-12">
			<div class="content"><h3>Materias Pendientes</h3></div>	
		</div>
	</div>

</body>
</html>
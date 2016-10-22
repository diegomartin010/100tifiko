<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>

<html>
<head>
<g:javascript src="estadisticas/estadisticas.js" />
<meta name="layout" content="main">
	<title><g:message code="Básicamente estadísticas"/></title>
</head>
<body>

	%{-- navegacion? --}%
	<div class="nav" role="navigation">
		<ul><li><a class="home" href="/"><g:message code="default.home.label"/></a></li></ul>
	</div>
	%{-- Body --}%
	<div id="page-body" role="main">
		<div class="content">
			<h1>Estadísticas</h1>
	</div>
				<form>
				<div class="container">
					<div class="panel panel-default">
						<div class="panel-heading">Promedio con aplazos</div>
						<div id="1" class="panel-body"> </div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">Promedio sin aplazos</div>
						<div id="2" class="panel-body"> 4 (hardcode)</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">Cantidad de materias aprobadas</div>
						<div id="3" class="panel-body"> 1 (hardcode)</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">Cantidad de finales desaprobados</div>
						<div id="4" class="panel-body"> 3 (hardcode)</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">Cantidad de materias regularizadas</div>
						<div id="5" class="panel-body"> 3 (hardcode)</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">Cantidad de materias que cursa actualmente</div>
						<div id="6" class="panel-body"> 5 (hardcode)</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">Cantidad de materias pendientes</div>
						<div id="7" class="panel-body"> 35 (hardcode)</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">Tiempo que le está tomando la carrera</div>
						<div id="8" class="panel-body"> 8 años (hardcode)</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">Porcentaje de realización de la carrera</div>
						<div id="9" class="panel-body"> 4.5%(hardcode)</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">Tiempo hasta próximo examen</div>
						<div id="10" class="panel-body"> 3 dias (hardcode)</div>
					</div>
				</div>
				</form>
	</div>
</body>
</html>

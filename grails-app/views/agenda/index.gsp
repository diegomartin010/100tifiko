<%@ page import="estats.SessionManager" %>
<%@ page import="estats.AutoridadModulos" %>
<%def modulo_nombre = "agenda"%>
<%def modulo = AutoridadModulos.getByName(modulo_nombre)%>
<!DOCTYPE html>
<html>
<head>
	

	<link rel="stylesheet" href="js/librerias/fullcalendar/fullcalendar.css">
	<g:javascript src="jquery/jquery.min.js"/>
	<g:javascript src="librerias/fullcalendar/moment.min.js"/>
	<g:javascript src="librerias/fullcalendar/dist/fullcalendar.js"/>
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

</body>
</html>
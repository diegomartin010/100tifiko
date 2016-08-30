<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="js/librerias/fullcalendar/fullcalendar.css">
	<g:javascript src="jquery/jquery.min.js"/>
	<g:javascript src="librerias/fullcalendar/moment.min.js"/>
	<g:javascript src="librerias/fullcalendar/dist/fullcalendar.js"/>
	<script>$(document).ready(function() {

    // page is now ready, initialize the calendar...

	   	$('#calendar').fullCalendar({
	   	//tamaño
	    //opciones al clickear
	       dayClick: function(date, jsEvent, view) {

        alert('Seleccionaste la fecha : ' + date.format() + ' próximamente la funcionalidad para añadir un evento será añadida');

        // change the day's background color just for fun

			}// put your options and callbacks here
   		 }) 
	});
	</script>
	<meta name="layout" content="main">
	<title><g:message code="Carrera"/></title>
</head>
<body>

	%{-- navegacion? --}%
	<div class="nav" role="navigation">
		<ul><li><a class="home" href="/"><g:message code="default.home.label"/></a></li></ul>
	</div>
	%{-- Body --}%
	<div id="page-body" role="main">
		<div class="content"><h1>Agenda</h1></div>
			<form>
				<div class="container">
					<div class="col-md-8">	
						<div id="calendar" class="fc fc-unthemed fc-ltr"></div>
					</div>
				</div>
			</form>	
	</div>

</body>
</html>
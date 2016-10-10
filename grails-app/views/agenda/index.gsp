<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="js/librerias/fullcalendar/fullcalendar.css">
	<g:javascript src="jquery/jquery.min.js"/>
	<g:javascript src="librerias/fullcalendar/moment.min.js"/>
	<g:javascript src="librerias/fullcalendar/dist/fullcalendar.js"/>
	%{-- Incluir logica javascript 
	<g:javascript src="agenda/agenda222.js" />--}%
	<g:javascript>
	$(document).ready(function() {
		$('#calendar').fullCalendar({
	    	dayClick: function(date, jsEvent, view) {
	    		var myCalendar = $('#calendar');
				myCalendar.fullCalendar();
				var eventname = prompt("Ingrese el nombre del evento a añadir", "");
				var myEvent = {
					title: eventname,
					allDay: true,
					start: date,
					end: date
				};
				myCalendar.fullCalendar('renderEvent', myEvent);
			}
		});
	})
	$(document).ready(function(){
		var myCalendar = $('#calendar');
		$('#calendar').fullCalendar({
   			eventClick: function(event){
  				$('.closon').click(function() {
     				myCalendar.fullCalendar('removeEvents'[event._id]);
     			});
   		 	}
   		}) 
	});
 	</g:javascript>
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
						<div id="datepicker"></div>
					</div>
				</div>
			</form>	
	</div>

</body>
</html>
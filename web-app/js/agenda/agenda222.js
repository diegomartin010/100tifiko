//js Usado en "/views/agenda/index.gsp"

$(document).ready(function() {
	var myCalendar = $('#calendar');
	$('#calendar').fullCalendar({
	    dayClick: function(date, jsEvent, view) {
			myCalendar.fullCalendar();
			var uid =  Math.floor(Math.random() *10000000);
			var eventname = prompt("Ingrese el nombre del evento a añadir", "");
			var myEvent = {
				id: uid,
				title: eventname,
				allDay: true,
				start: date,
				end: date
			};
			console.log("ID: "+myEvent.id);
			myCalendar.fullCalendar('renderEvent', myEvent);
			//convierto el formato de la fecha
			console.log("fecha UNIX: "+date);
			fecha = timeConverter(date);
			console.log("fecha: "+fecha);
			guardarevento(myEvent, fecha);
		}
   		
   	});
});
$(document).ready(function() {
	cargarEventos();
});

/* FALTA ELIMINAR / MODIFICAR EVENTOS
$(document).ready(function(){
	var myCalendar = $('#calendar');
	eventClick: function(event){
  		$('.closon').click(function(event) {
     		myCalendar.fullCalendar('removeEvents'[event._id]);
     	});
	}
});
*/

//guardo el evento en la DB
function guardarevento(myEvent, fecha){
	console.log("Enviando EVENTO mediante POST:");
	var i = myEvent.id;
	var t = myEvent.title;
	var f = myEvent.start.toString();
	console.log(myEvent);
	$.post("agenda/guardarEvento",{
		//id : i,
		titulo : t,
		fecha : fecha
	});
};

//cambio el formato de la fecha para enviarlo en el json con el método post("agenda/gardarEvento")
function timeConverter(UNIX_timestamp){
	var a = new Date(UNIX_timestamp);
	var months = ['01','02','03','04','05','06','07','08','09','10','11','12'];
	var year = a.getFullYear();
	var month = months[a.getMonth()];
	var date = (a.getDate())+1;
	var time = date + "/" + month + "/" + year;
	return time;
};
//cambio el formato de la fecha para desde el Post en que recibo un Json post("agenda/getEventos")
//pueda conseguir un formato de fecha adecuado para cargar el evento en FullCalendar (Unix Timestamp)
function fechaDecente(tiempo){
	var a = new Date(tiempo);
	var month = tiempo.slice(5,7);
	var year = tiempo.slice(0,4);
	var date = tiempo.slice(8,10);
	var time = date + "/" + month + "/" + year;
	return time;
}

//cargo eventos desde la DB a la agenda - FullCalendar
function cargarEventos(){
	var myCalendar = $('#calendar');
	$.post("agenda/getEventos",function(data){
		$.each(data, function(index, evento){
			fechadecente = fechaDecente(evento.fecha);
			var unixtime = Date.parse(fechadecente).getTime();
			console.log("intento de fecha unix: "+unixtime);
			var myEvent = {
				//id: uid,
				title: evento.descripcion,
				allDay: true,
				start: unixtime,
				end: unixtime
			};
		myCalendar.fullCalendar('renderEvent', myEvent);
		});
	});
}


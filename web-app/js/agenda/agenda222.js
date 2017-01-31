//js Usado en "/views/agenda/index.gsp"

$(document).ready(function() {
	//$('#myModal').modal('show');
	var myCalendar = $('#calendar');
	$('#calendar').fullCalendar({
	    dayClick: function(date, jsEvent, view) {
			myCalendar.fullCalendar();
			//ejecuto la modal
			//var lacomitiva = fechaDecente(date);
			saracho(date, jsEvent, view);
			//$('#myModal').modal('show'); 
			//console.log("este es el formato fecha del FullCalendar: "+date);
		/*	var uid =  Math.floor(Math.random() *10000000);
			var myEvent = {
				id: uid,
				title: eventname,
				allDay: true,
				start: date,
				end: date
			};
			//console.log("ID: "+myEvent.id);
			myCalendar.fullCalendar('renderEvent', myEvent);
			//convierto el formato de la fecha
			//console.log("fecha UNIX INGRESO: "+date);
			fecha = timeConverter(date);
			//console.log("fecha: "+fecha);
			guardarevento(myEvent, fecha); */
		},
		//Clickeando eventos se los elimina
		eventClick: function(calEvent, jsEvent, view) {
			console.log("eventClick linea 31");
			console.log(calEvent.id);
			jQuery.noConflict();
			$('#modalModif').modal('show');

			$("#params3").val(calEvent.id);
			

			//elimino eventos del calendario y DB	
     		//myCalendar.fullCalendar('removeEvents',[calEvent._id]);
     		//eliminarEvento(calEvent.id);
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

/*
$(document).ready(function(){
	$('#calendar').fullCalendar({
		eventClick: function(calEvent, jsEvent, view) {
        	alert("probando");
        }
    });
});
*/
//con esto lanzo la modal
function saracho(fecha, jsEvent, view){
	var myCalendar = $('#calendar');
	jQuery.noConflict();
	$('#myModal').modal('show');
	var vhorno = timeConverter(fecha);
	console.log("fecha sin convertir:");
	console.log(fecha);
	console.log("fecha convertida");
	console.log(vhorno);
	$("#idfecha").val(vhorno);
}
//con esta función lanzo desde el modal "guardar evento"
function saracho2(){
	var myCalendar = $('#calendar');
	var auxfecha = $("#idfecha").val();
	var unixtime = Date.parse(auxfecha).getTime()
	var uid =  Math.floor(Math.random() *10000000);
	var myEvent = {
		id: uid,
		title: $("#nombre").val(), 
		allDay: true,
		start: unixtime,
		end: unixtime
	};

	//myCalendar.fullCalendar('renderEvent', myEvent);
	//fecha = vhorno;
	guardarevento(myEvent, auxfecha);
	location.href = "/agenda"
};
//esta función modifica, eliminando un evento y creando otro
//por ahora no anda xq no puedo capturar el id del evento p/ eliminarlo
function saracho3(){
	var myCalendar = $('#calendar');
	//eliminarEvento(idEvento);
	//básicamente acá se ejecuta saracho2
	var auxfecha = $("#datepicker2").val();
	console.log("fecha datepicker");
	console.log(auxfecha);
	/*var unixt = Date.parse(auxfecha).getTime();
	console.log("fecha unixt");
	console.log(unixt);
	var fechadecente = timeConverter(unixt);
	console.log("fecha decente");
	console.log(fechadecente);
	var fechabien = cambiarMesPorDia(fechadecente);
	console.log("fecha bien");
	console.log(fechabien);
	var unixtime = Date.parse(fechabien).getTime();
	console.log("fecha unixtime");
	console.log(unixtime);*/
	var fechabien = cambiarMesPorDia(auxfecha);
	console.log("fecha bien");
	alert(auxfecha);
	alert(fechabien);
	var unixtime = Date.parse(auxfecha).getTime();
	console.log("fecha unixtime");
	alert(unixtime);
	var uid =  Math.floor(Math.random() *10000000);
	var myEvent = {
		id: uid,
		title: $("#nombre2").val(), 
		allDay: true,
		//posiblemente haya que cambiar y poner esta fecha en unix
		start: unixtime,
		end: unixtime
	};

	//myCalendar.fullCalendar('renderEvent', myEvent);
	//fecha = vhorno;
	guardarevento(myEvent, fechabien);
	location.href = "/agenda"
};

function saracho4(){
	console.log("patan.mp3");
};
//guardo el evento en la DB
function guardarevento(myEvent, fecha){
	console.log("Enviando EVENTO mediante POST:");
	var i = myEvent.id;
	var t = myEvent.title;
	var f = myEvent.start.toString();
	console.log(myEvent);
	//myCalendar.fullCalendar('renderEvent', myEvent);
	$.post("agenda/guardarEvento",{
		//id : i,
		titulo : t,
		fecha : fecha,
		resourceEditable: true
	});
};

//cambio el formato de la fecha para enviarlo en el json con el método post("agenda/gardarEvento")
function timeConverter(UNIX_timestamp){
	var a = new Date(UNIX_timestamp);
	var months = ['01','02','03','04','05','06','07','08','09','10','11','12'];
	var year = a.getFullYear();
	var month = months[a.getMonth()];
	var date = (a.getDate()+1);
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
	var time = month + "/" + date + "/" + year;
	return time;
}

function cambiarMesPorDia(tiempo){
	var a = new Date(tiempo);
	var month = tiempo.slice(0,2);
	var year = tiempo.slice(6,10);
	var date = tiempo.slice(3,5);
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
			var myEvent = {
				id: evento.id,
				title: evento.descripcion,
				allDay: true,
				start: unixtime,
				end: unixtime,
				resourceEditable: true
			};
		myCalendar.fullCalendar('renderEvent', myEvent);
		});
	});
}

function eliminarEvento(idEvento){
	var idE = parseInt(idEvento);
	var myCalendar = $('#calendar');
	console.log(idE);
	alert(idE);
	//myCalendar.fullCalendar('removeEvents',[calEvent._id]);
	//myCalendar.fullCalendar('removeEvents',[1]);
	$.post("agenda/eliminarEvento",{
		id : 1
	});

	location.href = "/agenda"
}





//esto es para el datepicker
$( function() {
	$( "#datepicker2" ).datepicker({
    });
    $( "#anim" ).on( "change", function() {
    	$( "#datepicker2" ).datepicker( "option", "showAnim", $( this ).val() );
    });
 });
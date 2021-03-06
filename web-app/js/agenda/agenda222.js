//js Usado en "/views/agenda/index.gsp"

$(document).ready(function() {
	//$('#myModal').modal('show');
	var myCalendar = $('#calendar');

	$('#calendar').fullCalendar({
	    dayClick: function(date, jsEvent, view) {
			myCalendar.fullCalendar();
			//ejecuto la modal
			if( date < new Date() ){
				alert("Elija una fecha posterior a la fecha actual.")	
			}else{
				saracho(date, jsEvent, view);

			}
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

//defino una tropimovida
function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}

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
	//básicamente acá se ejecuta saracho2 , osea CREO
	var auxfecha = $("#datepicker2").val();
	console.log("fecha datepicker");
	console.log(auxfecha);
	var fechabien = cambiarMesPorDia(auxfecha);
	console.log("fecha bien");
	//alert(auxfecha);
	//alert(fechabien);
	var unixtime = Date.parse(auxfecha).getTime();
	console.log("fecha unixtime");
	//alert(unixtime);
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
	//elimino
	//alert("el evento se ha modificado satisfactoriamente");
	sleep(500);
	if(1){}
		else{(alert("hardcode solutions"));
	}
	saracho4();
	location.href = "/agenda"
};

function saracho4(){
	eliminarEvento(1);
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
	if (((a.getDate()==28) && (month==02)) ||
		((a.getDate()==30) && (month==04,06,09,11)) ||
		((a.getDate()==31) && (month==01,03,05,07,08,10,12))){
		month++;
		date=1;
	}
	else{
		var date = (a.getDate()+1);
	}
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
		myCalendar.fullCalendar('renderEvent', myEvent, true);
		});
	});
}

function eliminarEvento(idEvento){
	
	var myCalendar = $('#calendar');
	//myCalendar.fullCalendar('removeEvents',[calEvent._id]);
	//myCalendar.fullCalendar('removeEvents',[1]);
	$.post("agenda/eliminarEvento",{
		id : $("#params3").val()
	});

	location.href = "/agenda"
}

//esto es para el datepicker
$( function() {
	$( "#datepicker2" ).datepicker({minDate: new Date()
    });
    $( "#anim" ).on( "change", function() {
    	$( "#datepicker2" ).datepicker( "option", "showAnim", $( this ).val() );
    });
 });
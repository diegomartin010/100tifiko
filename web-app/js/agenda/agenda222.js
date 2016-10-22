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
			guardarevento(myEvent);
		}
   		//eventClick: function(event){
  		//	$('.closon').click(function(event) {
     	//		myCalendar.fullCalendar('removeEvents'[event._id]);
     	//	});
   	});
});


function guardarevento(myEvent){
	console.log("Enviando EVENTO mediante POST:");
	var i = myEvent.id;
	var t = myEvent.title;
	var f = myEvent.start.toString();
	console.log("fecha: "+myEvent.start);
	$.post("agenda/guardarEvento",{
		//id : i,
		titulo : t
		//fecha : f
	});
};
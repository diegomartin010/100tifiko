var myCalendar = $('#my-caendar-id');
	myCalendar.fullCalendar();
var myEvent = {
	title:"my new event",
	allDay: true,
	start: new Date(),
	end: new Date()
};
myCalendar.fullCalendar('renderEvent', myEvent);

var x;
x=$(document)
x.ready(incializarEvento);

function inicializarEvento(){
	var x;
	x=$("#calendar")
	x.click(pegarTexto)
}

function pegarTexto(){
	alert("caca")
}
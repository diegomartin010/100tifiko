$( document ).ready(function() {
    mostrarLista();
});

function nuevoEvento(){
	iniciarStore();
	storeArray = new Array();
	storeArray.push({
		  fechaNew: $( "#fecha-new" ).val()
		, descripcionNew: $( "#descripcion-new" ).val()
		, tipoNew: $( "#tipo-new" ).val()
	});
	// sotoreArray.push(storeJson);
	storeArray = $.merge(JSON.parse(localStorage.nuevosEventos), storeArray);

	localStorage.nuevosEventos = JSON.stringify(storeArray);
	// localStorage.nuevosEventos = [];
	console.log(JSON.parse(localStorage.nuevosEventos || "{}"));
	location.reload();
	// mostrarLista();
}

console.log(JSON.parse(localStorage.nuevosEventos || "{}"));

// Iniciar el localStore como array
function iniciarStore(){
	// localStorage.nuevosEventos = 0;
	movida = JSON.parse(localStorage.nuevosEventos || "{}");
	if(!$.isArray(movida)){
		console.log("Entrada no es un array");
		localStorage.nuevosEventos = JSON.stringify(new Array());
	}
	
}

function eliminarEvento(id){
	arr = JSON.parse(localStorage.nuevosEventos || "{}");
	console.log("eliminar");
	console.log(arr[id]);
	// arr.splice(id,1);
	delete arr[id];
	console.log("eliminado");
	console.log(arr);
	localStorage.nuevosEventos = JSON.stringify(arr);
	$("#cargados-"+id).fadeOut(300, function() { $(this).remove() });
	// location.reload();
}

function mostrarLista(){	
	var local = JSON.parse(localStorage.nuevosEventos || "{}");
	for (var i = 0 ; i <= local.length; i++) {
		console.log("iteracion"+i);
		console.log(local[i]);
		if(!local[i]) continue;
		
		// Aca clonamos a lo negro
		$( "#cargados" )
			.clone()
			.attr('id', 'cargados-'+i)
			.insertAfter( $(".cargar").last() );

		$("#cargados-"+i).fadeIn("slow");
		$("#cargados-"+i)
			.find( "#fecha-load" )
			.attr('id', 'fecha-load-'+i)
			.attr('value', local[i].fechaNew);

		$("#cargados-"+i)
			.find( "#descripcion-load" )
			.attr('id', 'descripcion-load-'+i)
			.attr('value', local[i].descripcionNew);

		$("#cargados-"+i)
			.find( "#tipo-load" )
			.attr('id', 'tipo-load-'+i)
			.attr('value', local[i].tipoNew);

		$("#cargados-"+i)
			.find( "#eliminar-load" )
			.attr('id', 'eliminar-load-'+i)
			.attr('onclick', 'eliminarEvento('+i+')')
			.attr('value', 'eliminar('+i+')');
	}

}

function guardarEventos(){
	confirm("Al aceptar, se guardara su planificacion en la agenda");
	localStorage.nuevosEventos = null;
}

console.log(localStorage.nuevosEventos)
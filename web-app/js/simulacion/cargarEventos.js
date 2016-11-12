$( document ).ready(function() {
    mostrarLista();
});

function getStore(){
	return JSON.parse(localStorage.nuevosEventos || "{}");
}
function setStore(storeArray){
	localStorage.nuevosEventos = JSON.stringify(storeArray);	
}
function pushStore(value){
	return $.merge(getStore(), value);
}

function nuevoEvento(){
	iniciarStore();
	storeArray = new Array();
	storeArray.push({
		  fechaNew: $( "#fecha-new" ).val()
		, descripcionNew: $( "#descripcion-new" ).val()
		, tipoNew: $( "#tipo-new" ).val()
	});

	storeArray = pushStore(storeArray);
	setStore(storeArray);

	console.log(getStore());
	nuevoRegistro();
	// location.reload();

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
	$("#cargados-"+id).slideUp("fast", function() { $(this).remove() });
	// location.reload();
}

function nuevoRegistro(){
	
	store = getStore().pop();
	id = getStore().length;
	$( "#cargados" )
			.clone()
			.attr('id', 'cargados-'+id)
			.insertAfter( $(".cargar").last() );

	$("#cargados-"+id).show("fast");
	$("#cargados-"+id)
		.find( "#fecha-load" )
		.attr('id', 'fecha-load-'+id)
		.attr('value', store.fechaNew);

	$("#cargados-"+id)
		.find( "#descripcion-load" )
		.attr('id', 'descripcion-load-'+id)
		.attr('value', store.descripcionNew);

	$("#cargados-"+id)
		.find( "#tipo-load" )
		.attr('id', 'tipo-load-'+id)
		.attr('value',store.tipoNew);

	$("#cargados-"+id)
		.find( "#eliminar-load" )
		.attr('id', 'eliminar-load-'+id)
		.attr('onclick', 'eliminarEvento('+id+')')
		.attr('value', 'eliminar('+id+')');
}

function mostrarLista(){	
	var local = JSON.parse(localStorage.nuevosEventos || "{}");
	for (var i = 0 ; i <= local.length; i++) {
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
		// commit
		$("#cargados-"+i)
			.find( "#eliminar-load" )
			.attr('id', 'eliminar-load-'+i)
			.attr('onclick', 'eliminarEvento('+i+')')
			.attr('value', 'eliminar('+i+')');
	}

}

console.log(localStorage.nuevosEventos)
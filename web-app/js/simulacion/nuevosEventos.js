$( "#fecha-new" ).datepicker();


function guardarEventos(){
	// alert(getStore().length)
	
	if(!confirm("Al aceptar, se guardara su planificacion en la agenda"))
		return false;
	


	var carga = new Array();
	$.each(getStore(), function( index, value ) {
  		if(value){
  			carga.push(value);
  		}
	});

	console.log(carga);

	$.each(carga, function( index, value ) {
		var fechaNew = value.fechaNew
		
		// Cosas raras
		var tipoNew = value.tipoNew
		switch (tipoNew) {
		    case 'Examen':
		        tipoNew = 'E';
		        break;
		    case 'Alarma':
		        tipoNew = 'A';
		        break;
		}

  		$.post( "/agenda/guardarEventoSimulacion", {
	          fecha: value.fechaNew
	        , tipo: tipoNew
	        , descripcion: value.descripcionNew
    	})

  		localStorage.nuevosEventos = null;
  		window.location.href = "/simulacion";

	});

	
}
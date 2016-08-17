
// Javascrip usado en: 
// "/views/estadoAcademico/index.gsp"


// Algunas cosas iniciales
$( document ).ready(function() {
	$("#warning").hide();
});





// Cargar select del formulario.
$( document ).ready(function() {
	$.post( "/estadoAcademico/getAllCarreras", function( data ) {
	
			// Ciclo foreach
			$.each( data, function( index, carrera ) { 			
	 			var id = carrera.id;
	 			var nombre = carrera.nombre;
	 			// Agregamos un html al <select>
	 			$("#carrera").append(
	 				'<option value="'+ id +'">'
	 					+ carrera.nombre +
	 				'</option>'
	 			); 
				// Mostramos boludeces en la consola
	 			console.log( id );
			});

	}, "json");

});





// Asociar una nueva carrera.
$( document ).ready(function() {
	$( "#asociar-carrera" ).click(function() {
	  	console.log( "Elegiste:"+ $( "#legajo" ).val() + " " +$( "#carrera option:selected" ).val()  );

	  	$.post("/estadoAcademico/crear",{
                legajo: $( "#legajo" ).val(),
                carrera: $( "#carrera" ).val()
            }).done(function( resp ) {
            	// alert(resp.result);
            	if(resp.result)
            		$( "#result" ).append('<div class="alert alert-danger" role="alert">Hubo un error.</div>');
            	else
            	 	// $( "#result" ).append('<div class="alert alert-success" role="alert">Te asociaste a una nueva carrera!</div>');
            	 	location.reload();
            	
        });
	});
});





// Advertencia eliminar carrera.
$( document ).ready(function() {
	$( "#eliminar-carrera" ).click(function() {
		$("#warning").fadeIn('fast');
		$("#eliminar-carrera").hide();
		$(".buttons").hide();
	});
});


// Confirmar eliminacion.
$( document ).ready(function() {
	$( "#agree" ).click(function() {
		
		// Ejecutamos el controlador
		$.post("/estadoAcademico/eliminar").done(function( resp ) {
            if(resp.result){
            	alert("Hubo un problema. Pruebe mas tarde.");
            	
            }else{
            	alert("Te has desvinculado de tu carrera.");
            	location.reload();
        	}
                   	
        });


	});
});



// Leer un archivo.
$( document ).ready(function() {
		// display file contents
		$('#basicamente').change(function(event) {
 			var file = event.target.files[0];
  			var reader = new FileReader();
  			reader.readAsText(file);

  			reader.onload = function(event) {
    			// The file's text will be printed here
    			console.log(event.target.result)
  			};

			
		});
});
	
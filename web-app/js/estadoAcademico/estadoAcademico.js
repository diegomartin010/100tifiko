
// Javascrip usado en: 
// "/views/estadoAcademico/index.gsp"


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
		statement = "";
  		var pregunta = prompt(
	  			"AVISO:\n"+
	  			"----------------------------------------------\n\n"+	
	  			"Esta accion es IRREVERSIBLE."+
	  			"\nAl desvincular borraremos tu informacion asociada a la carrera.\n\n"+
	  			"ESCRIBE la palabra 'yes' para confirmar.\n"+
	  			"----------------------------------------------"
  			);
  		if ( pregunta == "yes"){
  			
  			$.post("/estadoAcademico/eliminar").done(function( resp ) {
            if(resp.result){
            	alert("Hubo un problema. Pruebe mas tarde."); 	
            }else{
            	alert("Te has desvinculado de tu carrera.");
            	location.reload();
        	}
                   	
        });
  		}
	});
});

$( document ).ready(function() {
	$.post( "/estadoAcademico/getMateriasByEstado", {
                estado: "P"
            }).done(function(d) {

            if (d.length > 0){
                $.each( d, function( index, materia ) {
                	//console.log(materia)
                	$("#pendientes").append(
	 				'<p class="list-group-item col-md-7" value="'+ materia.id +'">'
	 					+ materia.nombre +
	 					'<span class="btn btn-xs m-l-15 btn-warning" style="margin-left: 20px;"> Pendiente </span>' +
	 					'<input type="submit" class="btn btn-xs btn-primary pull-right r" name="'+materia.id+'" id="cambiar_a_cursando" value="Cambiar a cursando"> </p>'
	 			); 

                })} else {
                	$("#pendientes").append("No hay materias para mostrar")
                }



      $.post( "/estadoAcademico/getMateriasByEstado", {
                estado: "C"
            }).done(function(d) {

            if (d.length > 0){
                $.each( d, function( index, materia ) {
                	//console.log(materia)
                	$("#en_curso").append(
	 				'<p class="list-group-item col-md-7" value="'+ materia.id +'">'
	 					+ materia.nombre +
	 					'<span class="btn btn-xs m-l-15 btn-warning" style="margin-left: 20px;"> En curso </span>' +
	 					'<input type="submit" class="btn btn-xs btn-primary pull-right r" name="'+materia.id+'" id="cambiar_a_cursando" value="Cambiar a cursando"> </p>'
	 			); 

                })} else {
                	$("#en_curso").append("<p>No hay materias para mostrar</p>")
                }})



    $.post( "/estadoAcademico/getMateriasByEstado", {
                estado: "R"
            }).done(function(d) {

            if (d.length > 0){
                $.each( d, function( index, materia ) {
                	//console.log(materia)
                	$("#regularizadas").append(
	 				'<p class="list-group-item col-md-7" value="'+ materia.id +'">'
	 					+ materia.nombre +
	 					'<span class="btn btn-xs m-l-15 btn-warning" style="margin-left: 20px;"> Regularizada </span>' +
	 					'<input type="submit" class="btn btn-xs btn-primary pull-right r" name="'+materia.id+'" id="cambiar_a_cursando" value="Cambiar a cursando"> </p>'
	 			); 

                })} else {
                	$("#regularizadas").append("<p>No hay materias para mostrar</p>")
                }})
            

      $.post( "/estadoAcademico/getMateriasByEstado", {
                estado: "A"
            }).done(function(d) {

            if (d.length > 0){
                $.each( d, function( index, materia ) {
                	//console.log(materia)
                	$("#aprobadas").append(
	 				'<p class="list-group-item col-md-7" value="'+ materia.id +'">'
	 					+ materia.nombre +
	 					'<span class="btn btn-xs m-l-15 btn-warning" style="margin-left: 20px;"> Aprobadas </span>' +
	 					'<input type="submit" class="btn btn-xs btn-primary pull-right r" name="'+materia.id+'" id="cambiar_a_cursando" value="Cambiar a cursando"> </p>'
	 			); 

                })} else {
                	$("#aprobadas").append("<p>No hay materias para mostrar</p>")
                }})
             $("#cambiar_a_cursando").click( function(e){
 	$.post("/estadoAcademico/cambiarEstadoMateria",{
 		materia:this.name
 	}).done(function( resu ) {
 		console.log(resu.result)
 	})
 });


  });




});


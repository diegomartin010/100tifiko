
// Javascrip usado en: 
// "/views/estadoAcademico/index.gsp"


$(document).ready(function() {



self.getMaterias()
self.inicializarEventos()           



});

function inicializarEventos(){

   // BINDEO LOS CLICKS PARA CAMBIAR EL ESTADO DE LAS MATERIAS

            $("#pendientes").on('click','#cambiar_a_cursando', function(e){ 
                    self.cambiarEstado(e.target.name,'C',$( e.target ).attr('materia')); 
            });

            $("#en_curso").on('click','#cambiar_a_regular', function(e){ 
                    self.cambiarEstado(e.target.name,'R',$( e.target ).attr('materia')); 
            });

            /*$("#regularizadas").on('click','#cambiar_a_aprobada', function(e){ 
                    self.cargarExamen(e.target.name,$( e.target ).attr('materia')); 
            });*/

    // FIN DEL BINDEO DE LOS CLICKS PARA CAMBIAR EL ESTADO DE LA MATERIA

    // Advertencia eliminar carrera.

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

    // Asociar una nueva carrera.

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


    // Cargar select del formulario.

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
    
 

}

function getMaterias(){

        $.post( "/estadoAcademico/getMateriasByEstado", {
                estado: "P"
            }).done(function(d) {

            if (d.length > 0){
                $.each( d, function( index, materia ) {
                    //console.log(materia)
                    $("#pendientes").append(
                    '<p class="list-group-item col-md-7" id="'+ materia.id +'">'
                        + materia.nombre +
                        '<span class="btn btn-xs m-l-15 btn-warning" style="margin-left: 20px;"> Pendiente </span>' +
                        '<input type="submit" class="btn btn-xs btn-primary pull-right r" materia="'+materia.nombre+'" name="'+materia.id+'" id="cambiar_a_cursando" value="Cambiar a cursando"> </p>'
                ); 

                })} else {
                    $("#pendientes").append("No hay materias para mostrar")
                }
        });





          $.post( "/estadoAcademico/getMateriasByEstado", {
                estado: "C"
            }).done(function(d) {

            if (d.length > 0){
                $.each( d, function( index, materia ) {
                    //console.log(materia)
                    $("#en_curso").append(
                    '<p class="list-group-item col-md-7" id="'+ materia.id +'">'
                        + materia.nombre +
                        '<span class="btn btn-xs m-l-15 btn-warning" style="margin-left: 20px;"> En curso </span>' +
                        '<input type="submit" class="btn btn-xs btn-primary pull-right r" materia="'+materia.nombre+'" name="'+materia.id+'" id="cambiar_a_regular" value="Cambiar a regular"> </p>'
                ); 

                })} else {
                    $("#en_curso").append("<p>No hay materias para mostrar</p>")
                }});





    $.post( "/estadoAcademico/getMateriasByEstado", {
                estado: "R"
            }).done(function(d) {

            if (d.length > 0){
                $.each( d, function( index, materia ) {
                    //console.log(materia)
                    $("#regularizadas").append(
                    '<p class="list-group-item col-md-7" id="'+ materia.id +'">'
                        + materia.nombre +
                        '<span class="btn btn-xs m-l-15 btn-warning" style="margin-left: 20px;"> Regularizada </span>' +
                        "<a href=/examen> <input type='submit' class='btn btn-xs btn-primary pull-right r' materia="+materia.nombre+" name="+materia.id+"  id='cambiar_a_aprobada' value='Cargar Examen'></a> </p>"
                ); 

                })} else {
                    $("#regularizadas").append("<p>No hay materias para mostrar</p>")
                }});
            





      $.post( "/estadoAcademico/getMateriasByEstado", {
                estado: "A"
            }).done(function(d) {

            if (d.length > 0){
                $.each( d, function( index, materia ) {
                    //console.log(materia)
                    $("#aprobadas").append(
                    '<p class="list-group-item col-md-7" id="'+ materia.id +'">'
                        + materia.nombre + '<span class="btn btn-xs m-l-15 btn-warning" style="margin-left: 20px;"> Aprobada </span> </p>'
                ); 

                })} 
            else {
                    $("#aprobadas").append("<p>No hay materias para mostrar</p>")
                }});

}

function cambiarEstado(materiaId,estado,materiaNombre){

            $.post("/estadoAcademico/cambiarEstadoMateria",{
                    idMateria:materiaId
                ,   nuevoEstado: estado
                }).done(function( resu ) {
                    console.log(resu.result)
                })

            updateTable(materiaId,estado,materiaNombre) 
                
}

function updateTable(materiaId,estado,materiaNombre){

    $("#"+materiaId).remove()

    switch(estado) {
    case 'C':
                        $("#en_curso").append(
                    '<p class="list-group-item col-md-7" id="'+ materiaId +'">'
                        + materiaNombre +
                        '<span class="btn btn-xs m-l-15 btn-warning" style="margin-left: 20px;"> En curso </span>' +
                        '<input type="submit" class="btn btn-xs btn-primary pull-right r" materia="'+materiaNombre+'" name="'+materiaId+'" id="cambiar_a_regular" value="Cambiar a regular"> </p>'
                ); 
        
        break;
    case 'R':
                                    $("#regularizadas").append(
                    '<p class="list-group-item col-md-7" id="'+ materiaId +'">'
                        + materiaNombre +
                        '<span class="btn btn-xs m-l-15 btn-warning" style="margin-left: 20px;"> Regularizada </span>' +
                        "<a href=/examen> <input type='submit' class='btn btn-xs btn-primary pull-right r' materia="+materiaNombre+" name="+materiaId+"  id='cambiar_a_aprobada' value='Cargar Examen'></a> </p>"
                );     
        break;
    /*case 'A':
            $("#aprobadas").append(
                    '<p class="list-group-item col-md-7" id="'+ materiaId +'">'
                        + materiaNombre +
                        '<span class="btn btn-xs m-l-15 btn-warning" style="margin-left: 20px;"> Aprobada </span> </p>'
                ); 
    break;*/
}

}




// $( document ).ready(function() {
  $( ".eliminar" ).click(function() {
      var pregunta = prompt(
          "AVISO:\n"+
          "----------------------------------------------\n\n"+ 
          "Esta accion es IRREVERSIBLE."+
          "\nAl eliminar una carrera se borrara toda la informacion de los alumnos asociadas a dicha carrera.\n\n"+
          "ESCRIBE la palabra 'yes' para confirmar.\n"+
          "----------------------------------------------"
        );
      if ( pregunta == "yes"){
        alert("Has borrado la carrera.");
      }
});
// });
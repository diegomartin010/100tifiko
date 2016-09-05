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

  $( document ).ready(function() {

var modal = document.getElementById('myModal');



// CON ESTO CAPTURO EL NOMBRE DEL PLAN
$(".container .col-md-5 #verMaterias").click(function(){ 
                  var materia = $(this).attr("name")
                  $("#myModal").attr("name",materia)
                  $(this).click(
    modal.style.display = "block");
}

                  
                )


// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

var cerrar= document.getElementById("cerrar");

// When the user clicks the button, open the modal
/*$(".container .col-md-5 #verMaterias").onclick = function() {
    modal.style.display = "block";
}*/

cerrar.onclick = function(){
 modal.style.display = "none";

}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}  
});
// });
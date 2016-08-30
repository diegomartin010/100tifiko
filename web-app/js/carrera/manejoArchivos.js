

// Funcion para leer un archivo

function leerArchivo( callback ){
  var file = event.target.files[0];
  var reader = new FileReader();

    reader.readAsText(file);

    reader.onload = function(event) {
        jsonResult = JSON.parse(event.target.result);
        callback(jsonResult);
    };

}

// Crear una nueva carrera.
$( document ).ready(function() {
    $('#_nuevaCarrera').change(function() {
      leerArchivo(function(jsonCarrera){
          
            var html = '<div class="alert alert-danger" id = "mat" role="alert">';
            html +=  '<p>'+jsonCarrera.nombre+': </p>';
            for (var i = 0; i <= jsonCarrera.materiasObligatorias.length ; i++) {
              html +=  '<p>'+jsonCarrera.materiasObligatorias[i]+'</p>';
            }
            html += '</div>';
            console.log(jsonCarrera);
          $( "#result" ).append(html);

        

      });

    });
});



// Crear una nueva carrera.
$( document ).ready(function() {
    $('#nuevaCarrera').change(function() {
      
      leerArchivo(function(jsonCarrera){

          console.log(jsonCarrera);
          
                
                // Con esto se envia la informacion a la pagina por ajax.
                $.ajax({
                  method: "POST",
                  url: "/carrera/nuevaCarrera",
                  data: JSON.stringify(jsonCarrera),
                  contentType:"application/json; charset=utf-8",
                  dataType: "json",
                  success: function( resp ){
                    // alert(resp);
                    if(resp.result){
                      alert("hola");
                    }else{
                       alert("todo bien");
                      location.reload();  
                    }
                    
                  },
                  error: function () {}
                });

      });

    });
});


//js Usado en "/views/examen/index.gsp"


function eliminar(idmovida){
	$.post("examen/eliminarExamen",{
		id: idmovida
	});
	window.location.reload();
}

	//genero la lista de exámenes rendidos para poner en la tabla
	$(document).ready(function(){
		cargarlacomitiva();
	});
		function cargarlacomitiva(){
		$.post("examen/getExamenes", function (data){
			$.each( data, function(index,ex){
				console.log(ex);
				notaExamen = ex.nota;
				fechaExamen = ex.fecha.slice(0,10);
				nombreExamen = ex.nombre;
				var table = document.getElementById("letable");
				var row = table.insertRow(-1);
				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				var cell3 = row.insertCell(2);
				var cell4 = row.insertCell(3);
				cell1.innerHTML = "<input class='form-control' id='disabledInput' type='text' placeholder='"+fechaExamen+"' disabled=''>";
				cell2.innerHTML = "<input class='form-control' id='disabledInput' type='text' placeholder='"+nombreExamen+"' disabled=''>";
				cell3.innerHTML = "<input class='form-control' id='disabledInput' type='text' placeholder='"+notaExamen+"' disabled=''>";
				cell4.innerHTML = '<button onclick="eliminar('+ex.id+')" class="btn btn-danger btn-xs" id="btn-update">Eliminar</button>'
			});

		});
		
	};
	//genero la lista del dropdown de materias
	$(document).ready(function() {
		$.post( "/estadoAcademico/getMateriasByEstado", {
                estado: "R"
            }).done(function(d) {
            $.each(d, function (index,mat){
            	var sel = document.getElementById("idmateria");
			    var opt = document.createElement("option");
			    opt.innerHTML = mat.nombre;
			    opt.value = mat.nombre;
			    sel.appendChild(opt);
            	})
            });
	});
		function guardarexamen(){						
				    //agrego funcionalidad para almacenar el examen.
				    $.post( "/examen/guardar",{
					    fecha: $("#datepicker").val(),
						materia: $("#idmateria").val(),
						nota: $("#idnota").val()
				    }).done(function( resp ){
				    	if(resp.result){
	   					 console.log(resp.examen.fecha);
				    	}
  					});
  					window.location.reload();
				    console.log("fecha en que se agrega el examen: "+$("#datepicker").val());
		};
$( function() {
    $( "#datepicker" ).datepicker();
    $( "#anim" ).on( "change", function() {
    	$( "#datepicker" ).datepicker( "option", "showAnim", $( this ).val() );
    });
 });
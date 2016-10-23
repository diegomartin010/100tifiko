<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	<g:javascript src="examen/examen.js" /> 
	<g:javascript src="jquery/jquery-ui.js"/>
	<g:javascript src="jquery/jquery-ui.css"/>
%{--
<g:javascript>

function eliminar(idmovida){
	$.post("examen/eliminarExamen",{id: idmovida});
	alert("caca: "+idmovida);
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
				cell1.innerHTML = fechaExamen;
				cell2.innerHTML = nombreExamen;
				cell3.innerHTML = notaExamen;
				cell4.innerHTML = '<button onclick="eliminar('+ex.id+')" id="btn-update">Eliminar</button>'
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
	   					 console.log(resp.examen);
				    	}
  					});


		};
$( function() {
    $( "#datepicker" ).datepicker();
    $( "#anim" ).on( "change", function() {
    	$( "#datepicker" ).datepicker( "option", "showAnim", $( this ).val() );
    });
 });
 </g:javascript> --}%
    <meta name="layout" content="main">
	<title><g:message code="Exámenes"/></title>
</head>
<body>
	%{-- Body --}%
	<div id="page-body" role="main">
		%{-- Titulo de la pagina --}%
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Examenes</h1>
            </div>
        </div>
        %{-- ./row --}%
			<form>
				<div class="container">
					<div class="panel panel-default">
						<div class="panel-heading">Nuevo examen</div>
						<div class="panel-body">
							<table class="table">
    						<tr>
    							<th><p>Date: <input type="text" id="datepicker"></p>
									</th>
	    						<th><select id="idmateria" class="selectpicker"> 
										</select>
										</th>  
		    							<th>
		          						<select id="idnota" class="selectpicker">
							            <option value = "1" >1</option>
							            <option value = "2" >2</option>
							            <option value = "3" >3</option>
							            <option value = "4" >4</option>
							            <option value = "5" >5</option>
							            <option value = "6" >6</option>
							            <option value = "7" >7</option>
							            <option value = "8" >8</option>
							            <option value = "9" >9</option>
							            <option value = "10" >10</option>
						          	</select>
						      		</li></th>  
    							<th> <button type="button" class="btn btn-default" onclick="guardarexamen()">Agregar</button></th>  
 						 	</table>
    					</div>
  					</div>			
				</div>
			</form>	
	%{--</div>--}%
%{-- acá va la tabla con los examenes cargados --}%
<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">Exámenes rendidos</div>
  <div class="panel-body">
  	%{--</div>--}%

  <!-- Table -->
  <table id="letable" class="table">
    <tr>
    	<th>Fecha</th>
    	<th>Materia</th>
    	<th>Nota</th>
  	</tr>
  		%{-- acá debería poner para cargar la tabla desde los arrays --}%
    </table>
  </div>
</body>
</html>
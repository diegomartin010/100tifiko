<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="/css/simple-sidebar.css">
  	<g:javascript src="jquery/jquery.js"/>
	<g:javascript src="bootstrap/js/bootstrap.min.js"/>
	<g:javascript src="jquery/jquery-ui.js"/>
	<g:javascript src="jquery/jquery-ui.css"/>
	<g:javascript>
	$(document).ready(function() {
		//$.post( "/examen/getNombreMaterias", function( data ){
		//$.each( data, function( index, carrera ) {
			var listamaterias = ["ALGEBRA","MAT SUP","FISICA","SIS Y ORG","ING Y SOC"];     
			var sel = document.getElementById("idmateria");
			for(var i = 0; i < listamaterias.length; i++) {
		    var opt = document.createElement("option");
		    opt.innerHTML = listamaterias[i];
		    opt.value = listamaterias[i];
		    sel.appendChild(opt);
		}
	});	
	//});
	</g:javascript>
	<g:javascript>
		function guardarexamen(){
				var examen = {
					fecha: $("#datepicker").val(),
					materia: $("#idmateria").val(),
					nota: $("#idnota").val()
				};				

				    var table = document.getElementById("letable");
				    var row = table.insertRow(-1);
				    var cell1 = row.insertCell(0);
				    var cell2 = row.insertCell(1);
				    var cell3 = row.insertCell(2);
				    cell1.innerHTML = examen.fecha;
				    cell2.innerHTML = examen.materia;
				    cell3.innerHTML = examen.nota;

		}
	</g:javascript>
	<g:javascript>
  	 $( function() {
    $( "#datepicker" ).datepicker();
    $( "#anim" ).on( "change", function() {
      $( "#datepicker" ).datepicker( "option", "showAnim", $( this ).val() );
    });
  } );
  </g:javascript>
    <meta name="layout" content="main">
	<title><g:message code="Exámenes"/></title>
</head>
<body>

	%{-- navegacion? --}%
	<div class="nav" role="navigation">
		<ul><li><a class="home" href="/"><g:message code="default.home.label"/></a></li></ul>
	</div>
	%{-- Body --}%
	<div id="page-body" role="main">
		<div class="content"><h1>Examenes</h1></div>
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
      </table>
  
  
</div>
</body>
</html>
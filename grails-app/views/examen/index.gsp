<%@ page import="estats.SessionManager" %>
<%@ page import="estats.AutoridadModulos" %>
<%def modulo_nombre = "examenes"%>
<%def modulo = AutoridadModulos.getByName(modulo_nombre)%>
<!DOCTYPE html>
<html>
<head>
	<g:javascript src="examen/examen.js" /> 
	<g:javascript src="jquery/jquery-ui.js"/>
	<g:javascript src="jquery/jquery-ui.css"/>
    <meta name="layout" content="main">
	<title><g:message code="Exámenes"/></title>
</head>
<body>
	%{-- Body --}%
	<div id="page-body" role="main">
		%{-- Titulo de la pagina --}%
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="${modulo.icono}"></i> ${modulo.titulo}</h1>
            </div>
        </div>
        %{-- ./row --}%
			%{--<form>--}%
				%{--<div class="container">--}%
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
				%{--</div>--}%
			%{--</form>--}%
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
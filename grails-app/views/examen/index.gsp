<%@ page import="estats.SessionManager" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="/css/simple-sidebar.css">
  	<script src="/jquery/jquery.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
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
    							<th>Fecha</th>
	    							<th><li class="dropdown">
	          							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Materia  <span class="caret"></span></a>
	         				 			<ul class="dropdown-menu">
	            					<li><a href="#">Algebra</a></li>
	            					<li><a href="#">Fisica I</a></li>
	          						</ul>
		      							</li></th>  
		    							<th><li class="dropdown">
		          						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Nota  <span class="caret"></span></a>
		          						<ul class="dropdown-menu">
							            <li><a href="#">1</a></li>
							            <li><a href="#">2</a></li>
							            <li><a href="#">3</a></li>
							            <li><a href="#">3</a></li>
							            <li><a href="#">4</a></li>
							            <li><a href="#">5</a></li>
							            <li><a href="#">6</a></li>
							            <li><a href="#">7</a></li>
							            <li><a href="#">8</a></li>
							            <li><a href="#">9</a></li>
							            <li><a href="#">10</a></li>
						          	</ul>
						      		</li></th>  
    							<th> <button type="button" class="btn btn-default">Agregar</button></th>  
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
  <table class="table">
    <tr>
    <th>Fecha</th>
    <th>Materia</th>
    <th>Nota</th>
    %{-- Comento esto para poner el boton adentro de la tabla en lugar de encima
    	<th><li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Acciones  <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">modificar</a></li>
            <li><a href="#">eliminar examen</a></li>
          </ul>
			</li></th>
			--}%
  </tr>
  <tr>
    <td>27/02/2016</td>
    <td>Ingeniería y sociedad</td>
    <td>9</td>
    <td><li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Acciones  <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">modificar</a></li>
            <li><a href="#">eliminar examen</a></li>
          </ul>
			</li></td>
  </tr>
      </table>
</div>
</body>
</html>
<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="main">
		<g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
	</head>
	<body>
		<g:if env="development">
			
			<div class="container">
  				<br><br><br><br>
  				<div class="row">
	    			<div class="col-md-2"></div>
	    			<div class="col-md-8">
	      				<div class="panel panel-danger">
	        				<div class="panel-heading">
	          					<h3 class="text-center">
	          						<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> Lamentablemente : <small>No puede mostrarse la informacion solicitada. - <b>404 error</b></small>
	          					</h3>
	        				</div>
	    					<div class="panel-body">
	    						<br>
	    						<p>La pagina se encuentra fuera de servicio, y no va a solucionarse <b>a corto plazo</b>. Que tenga un buen dia, y <b>no vuelva a molestarnos</b>.</p>
	    						<p class="pull-right">Atte. 100tifiko</p>
	         				</div>
	         				<!-- <div class="panel-footer">
	         					<button class="btn btn-default center-block">Enojarme con la vida</button>
							</div> -->
	        			</div>
	      			</div>
				    <div class="col-md-2"></div>
   			 	</div>
			</div>	

			<!-- Muestra los errores y las cosas raras -->
			<g:renderException exception="${exception}" />

		</g:if>
		<g:else>
			<ul class="errors">
				<li>An error has occurred</li>
			</ul>
		</g:else>
	</body>
</html>

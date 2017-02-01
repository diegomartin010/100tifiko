
<!DOCTYPE html>
<html>
<head>
	
	<meta name="layout" content="main">
</head>
<body>

%{-- 
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header"><i class="fa fa-star"></i> Tutoriales</h1>
    </div>
</div> --}%
<br>
<div class="panel panel-info">
	
	<!-- Cabecera panel -->
    <div class="panel-heading">
    	%{-- Controles del carrousel --}%
    	<a href="#myCarousel" class="btn btn-lg btn-default" role="button" data-slide="prev">Anterior</a>
		<a href="#myCarousel" class="btn btn-lg btn-default pull-right" role="button" data-slide="next">Siguiente</a>   
    </div>
    
    %{-- Cuerpo del panel --}%
    <div class="panel-body">
    	%{-- Carrousel. Pantalla con imagenes --}%
   		<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false" >
		    %{-- Indicadores. Circulos abajo de imagenes --}%
		    <ol class="carousel-indicators">
		    	<% def count = 0 %>
		      	
		      	<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    	
		    	<g:each in="${imagenes}">
		    		<li data-target="#myCarousel" data-slide-to="${++count}"></li>
				</g:each>

			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
			    <% count = 0 %>
		    	<g:each in="${imagenes}">
			      	<g:if test="${count == 0}">
		     			<div class="item active">
			       			<img src="${route}/${it}" width="100%" >
			      		</div>
					</g:if>
					<g:else>
		     			<div class="item">
			       			<img src="${route}/${it}"  width="100%" >
			      		</div>
					</g:else>
			      	<% count++ %>
		   		</g:each>
				</div>
			%{-- ./carrousel --}%
		</div>

    </div><!-- ./panel body -->
</div><!-- ./panel info -->



	




















</body>
</html>

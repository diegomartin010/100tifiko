
<!DOCTYPE html>
<html>
<head>
	
	<meta name="layout" content="main">
</head>
<body>
	
<br><br>



<div class="panel panel-info">
            	<!-- Cabecera panel -->
                <div class="panel-heading">
                	<a href="#myCarousel" class="btn btn-lg btn-default" role="button" data-slide="prev">
	      				Anterior
	    			</a>
	  				<a href="#myCarousel" class="btn btn-lg btn-default pull-right" role="button" data-slide="next">
	      				Siguiente
	    			</a>   
                </div><!-- Fin cabecera -->
                <!-- Movida collapse -->
                    <!-- Body del panel -->
                <div class="panel-body">

             


               		<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false" >

                		<!-- Left and right controls -->
	    			
	    <!-- Indicators -->
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
		       			<img src="/assets/tutoriales/ROLE_USER/${it}" width="100%" >
		      		</div>
				</g:if>
				<g:else>
	     			<div class="item">
		       			<img src="/assets/tutoriales/ROLE_USER/${it}"  width="100%" >
		      		</div>
				</g:else>
		      	<% count++ %>
	      </g:each>
	    </div>

	    
	</div>






                       
                </div><!-- ./panel body -->
	</div><!-- ./panel default -->



	




















</body>
</html>

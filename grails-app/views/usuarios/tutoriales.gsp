
<!DOCTYPE html>
<html>
<head>
	
	<meta name="layout" content="main">
</head>
<body>
	
	<div id="page-body" role="main">
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"> Tutoriales</h1>
            </div>
        </div>
		
	</div>
<g:each in="${imagenes}" var="imagen">


	<div class="panel-group" id="accordion">
            <div class="panel panel-primary">
            	<!-- Cabecera panel -->
                <div class="panel-heading">
                	<i class="fa fa-file-text-o"></i> <label>Crear usuarios</label>     
                </div><!-- Fin cabecera -->
                <!-- Movida collapse -->
                <div id="collapseOne" class="panel-collapse collapse in">
                    <!-- Body del panel -->
                    <div class="panel-body">

                    <img src =  '\assets\tutoriales\${imagen}'>
                        

                       
                    </div><!-- ./panel body -->
                </div>
         	</div><!-- ./panel default -->
        </div>
 </g:each>




</body>
</html>

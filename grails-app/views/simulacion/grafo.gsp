<!DOCTYPE html>
<html>
<head>
	<title>Grafos</title>
</head>
    <script src="/js/jquery/jquery.js"></script>
    <script src="/js/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Core JavaScript -->
    
    <!-- Metis Menu Plugin JavaScript -->
   
    <!-- Bootstrap Core CSS -->
    
    <!-- Custom CSS -->
    
    <!-- Custom Fonts -->
   
<body>

	<style type="text/css">
        #mynetwork {
            width: 100%;
            height: 768px;
            border: 1px solid lightgray;
        }
        body{
        	background-color: #f8f8f8
        }
        .btn-default {
            color: white;
            background-color: #B5B5B5;
            border-color: #ccc;
        }       
        .btn-primary {
            color: white;
            background-color: #6995e4;
            border-color: #ccc;
        }       
        .btn-success {
            color: white;
            background-color: #46de83;
            border-color: #ccc;
        }       
        .btn-warning {
            color: white;
            background-color:#ffb733;
            border-color: #ccc;
           
        } 
        .btn-info {
            color: white;
            background-color:  #00e2ff;
            border-color: #ccc;
        } 
        .btn-danger {
            color: white;
            background-color:#933;
            border-color: #ccc;
            /*border-radius: 50%;*/
        }                 
    }
    </style>
    <!-- <h2>Referencia de colores</h2> -->
    <div class="panel panel-default">
        <div class="panel-heading">
           <h4>Grafo de Correlatividades</h4>
        </div>
        <div class="panel-body">
            Referencias de colores
             <p>
                <button type="button" class="btn btn-default btn-xm">Materias pendientes</button>
                <button type="button" class="btn btn-info btn-xm">Materias permitidas</button>
                <button type="button" class="btn btn-primary btn-xm">Materias regularizadas</button>
                <button type="button" class="btn btn-success btn-xm">Materias aprobadas</button>
                <button type="button" class="btn btn-warning btn-xm">Materias cursando</button>
                <button type="button" class="btn btn-danger btn-xm">Finales pendientes</button>
                
            </p>
            <div id="mynetwork"></div>
        </div>
    </div>
   
	<!-- <div id="mynetwork"></div> -->
	<g:javascript src="librerias/vis/dist/vis.js" />
	<g:javascript src="/simulacion/grafos.js" />
</body>
</html>
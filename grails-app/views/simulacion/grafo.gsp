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
        .btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
.btn-circle-lock {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  background-color: #B5B5B5;
  line-height: 1.428571429;
  border-radius: 15px;
}
.btn-circle.btn-lg {
  width: 50px;
  height: 50px;
  padding: 10px 16px;
  font-size: 18px;
  line-height: 1.33;
  border-radius: 25px;
}
.btn-circle.btn-xl {
  width: 70px;
  height: 70px;
  padding: 10px 16px;
  font-size: 24px;
  line-height: 1.33;
  border-radius: 35px;
}
                 
    }
    </style>
    <!-- <h2>Referencia de colores</h2> -->
    <div class="panel panel-default navbar navbar-fixed-top ">
        <div class="panel-heading">
           <h4>Grafo de Correlatividades</h4>
        </div>
        <div class="panel-body">
            Referencias de colores
             <p>
                <button type="button" class="btn btn-default btn-xm">No puedo cursar</button>
                <button type="button" class="btn btn-info btn-xm">Puedo cursar</button>
                <button type="button" class="btn btn-primary btn-xm">Regularizadas</button>
                <button type="button" class="btn btn-success btn-xm">Aprobadas</button>
                <button type="button" class="btn btn-warning btn-xm">Cursando actualmente</button>
                <button type="button" class="btn btn-info btn-circle btn-xm"></button>
                (Final) Puedo rendir.
                <button type="button" class="btn btn-default btn-circle-lock btn-xm"data-toggle="tooltip" title="Basicamente estos son los examenes que yo no puedo rendir, porque no cumplo con las correlatividades necesarias para poder rendirlos." ></button>
                (Final) No puedo rendir.
                
            </p>
            <div id="mynetwork"></div>
        </div>
    </div>
   
	<!-- <div id="mynetwork"></div> -->
	<g:javascript src="librerias/vis/dist/vis.js" />
	<g:javascript src="/simulacion/grafos.js" />
    <g:javascript>

        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip(); 
        });

    </g:javascript>
</body>
</html>
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
        .label-default {
            color: white;
            background-color: #B5B5B5;
            border-color: #ccc;
        }       
        .label-primary {
            color: white;
            background-color: #6995e4;
            border-color: #ccc;
        }    
        /*puedo cursar*/
        .label-success {
            color: white;
            background-color: #5cb85c;
            border-color: #ccc;
        }       
        .label-warning {
            color: white;
            background-color:#ffb733;
            border-color: #ccc;
           
        } 
        /*regularizada*/
        .label-info {
            color: white;
            background-color: #2e9fff;
            border-color: #ccc;
        } 
        .label-danger {
            color: white;
            background-color:#d9534f;
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
                <h4>
                  <span class="label label-danger label-xm">No puedo cursar / No puedo Rendir</span>
                  %{-- <span class="btn btn-danger btn-circle btn-xm"></span> No puedo rendir. --}%

                  <span class="label label-success label-xm">Puedo cursar / Puedo Rendir</span>
                  %{-- <span class="btn btn-success btn-circle btn-xm"></span> Puedo rendir. --}%

                  <span class="label label-info label-xm">Regularizadas</span>
                  <span class="label label-default label-xm">Aprobadas</span>
                  <span class="label label-warning label-xm">Cursando</span>
                </h4>

            </p>
            <p style="color: #10c09b !important">Para desplazarse por el gráfico, hacer clic en él, y arrastrar el cursor.</p>
            <p style="color: #10c09b !important">Para hacer zoom, girar la rueda del ratón.</p>
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
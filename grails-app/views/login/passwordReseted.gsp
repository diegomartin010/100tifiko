<!DOCTYPE html>
<html>
	<head>
    	<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <asset:link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
        <asset:javascript src="application.js"/>
        <script src="/js/jquery/jquery.min.js"></script>
        <script src="/js/jquery/jquery.js"></script>
        <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="/vendor/metisMenu/metisMenu.min.js"></script>
        <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="/dist/css/sb-admin-2.css" rel="stylesheet">
        <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    	<title>100tifiko</title>
        <style type="text/css">
            body{
                margin-left: 20%;
                margin-right: 20%;
            }

            body{
            background-repeat: no-repeat!important;
            /*width:100%!important;*/
            /*height:100%!important;*/
            background-size: 100% 250%!important;
            /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#a7cfdf+0,23538a+100;Blue+3d+%238 */
            background: rgb(167,207,223); /* Old browsers */
            background: -moz-linear-gradient(top,  rgba(167,207,223,1) 0%, rgba(35,83,138,1) 100%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top,  rgba(167,207,223,1) 0%,rgba(35,83,138,1) 100%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom,  rgba(167,207,223,1) 0%,rgba(35,83,138,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a7cfdf', endColorstr='#23538a',GradientType=0 ); /* IE6-9 */
        }
        </style>
	</head>
	<body>

	 <!-- Estilo body de la pagina  -->
	
		<!-- Titulo de la pagina  -->
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    <!-- Icono -->
                    %{-- <i class="fa fa-user"></i> --}%
                    <a href="/">
                        <asset:image width="170" src="logos/logo.png" alt="Grails"/>          
                    </a
                </h1>
            </div>
        </div>
        <!-- ./row  -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> Notificacion de Usuario</small>
            </div>
            <div class="panel-body">
                <p>Su cuenta ha sido activada satisfactoriamente.</p>
                <p>Atte. 100tifiko</p>
            </div>
            <div class="panel-footer">
                <a href="/" class="btn btn-info" onclick=""><i class="fa fa-arrow-left "></i> Iniciar Sesion</a>
                <br><br>
            </div>
        </div>

</body>
</html>

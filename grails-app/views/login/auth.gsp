<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>100tifiko - Inicia sesión o regístrate</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    	body{
            background-image: url("/assets/loginBack.png");
    		background-color: #5bc0de;
            /*background-repeat: no-repeat!important;
    		width:100%!important;
            height:100%!important;
    		background-size: 100% 250%!important;
            background: rgb(167,207,223);
            background: -moz-linear-gradient(top,  rgba(167,207,223,1) 0%, rgba(35,83,138,1) 100%);
            background: -webkit-linear-gradient(top,  rgba(167,207,223,1) 0%,rgba(35,83,138,1) 100%);
            background: linear-gradient(to bottom,  rgba(167,207,223,1) 0%,rgba(35,83,138,1) 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#a7cfdf', endColorstr='#23538a',GradientType=0 );*/
    	}
    </style>
</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><a href="/"><asset:image width="170" src="logos/logo.png" alt="Grails"/></a></h3>
                    </div>
                    <div class="hidden alert alert-danger">
                    <strong>Error</strong> El usuario y la contraseña ingresados, son incorrectos.
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <label>Username</label>
                                    <input class="form-control" placeholder="Username"name="username" id = "username" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input class="form-control" placeholder="Password" name="password" id = "password" type="password" value="">
                                </div>
                                <div class="form-group">
                                    <a href="/usuarios/recuperar" >Olvidé mi Contraseña</a>
                                    <a href="/usuarios/newUser"class="pull-right">Nuevo Usuario</a><br>
                                </div>
                                <a href="#!" class="btn btn-lg btn-success btn-block" onclick="login()">Iniciar Sesión</a>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <g:javascript>

        // Logearse automaticamente cuando apretamos enter.
        $(document).keypress(
            function(e) {
                if(e.which == 13) {
                    login()
                }
            }
        );

        function login(){
            // Codigo para logearme
            $.post( "/session/setSession", 
                {
                    username: $("#username").val(),
                    password: $("#password").val() 
                }
            )
            .done(
                function( data ) {
                   if(data.result){
                        if(!data.enabled){
                            alert("El usuario con el que intenta acceder, se encuentra bloqueado.\n--------------------------------------------------------------------\n\nUsted debera contactarse con el administrador de la aplicacion.\n\nDisculpe las molestias.");  
                        }else{
                            window.location.href = "/";    
                        }
                        
                   }else{
                        $(".alert-danger").removeClass('hidden')
                   }
                }
            );

        }
    </g:javascript>

</body>

</html>

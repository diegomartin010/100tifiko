<%@ page import="estats.*" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>100tifiko</title>
      		%{-- <asset:stylesheet src="application.css"/> --}%
    <asset:link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
	<asset:javascript src="application.js"/>
        <!-- jQuery -->
    <script src="/js/jquery/jquery.min.js"></script>
    <script src="/js/jquery/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Datepicker -->

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <g:layoutHead/>
    <style type="text/css">
        .panel{
           box-shadow: 0px 5px 19px #e4e4e4 !important;
        }
        a {
            /*color: #777777;*/
            /*font-weight: bold;*/
        }
        .space{
            margin-bottom: 32px;
        }
        .btn{
            margin-left: 3px;
        }
    </style>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/"><asset:image width="170" src="logos/logo.png" alt="Grails"/></a>
                %{-- <a class="navbar-brand" href="index.html">100tifiko (Cambiar imagen)</a> --}%
            </div>
            <!-- /.navbar-header -->


            <ul class="nav navbar-top-links navbar-right">

                <!-- /.dropdown -->
                <!-- La parte de las notificaciones -->
                <%   
                    def eventos = null   
                    try {
                        eventos = SessionManager
                        .getCurrentUser()
                        .estadoAcademico
                        .eventos

                        eventos.each{
                            switch(it.tipo) {
                                case "E": 
                                    it.tipo = "Examen"
                                break
                                case "A": 
                                    it.tipo = "Alerta"
                                break
                            }
                        }  
                        
                       System.out.println "Catch piola" 
                    }
                     
                    catch(Exception e) {
                        System.out.println "Excepcion" 
                    }
                %>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <g:each in="${eventos}">
                                <li>
                                    <a href="#">
                                        <div>
                                            <i class="fa fa-tasks fa-fw"></i>(${it.tipo}) ${it.descripcion}
                                            <span class="pull-right text-muted small">
                                                Fecha: <g:formatDate format="dd-MM-yy" date="${it.fecha}"/>
                                            </span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                        </g:each>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                    <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <p class="text-center">
                                    <strong>Notificaciones y eventos</strong>
                                    <!-- <i class="fa fa-angle-right"></i> -->
                                </p>
                            </li>
                            <li class="divider"></li>
                        <g:each in="${eventos}">
                            <li>
                                <a href="#">
                                    <div>
                                        <strong><i class="fa fa-mortar-board"></i> ${it.tipo}</strong>
                                        <span class="pull-right text-muted">
                                            <em><g:formatDate format="dd/MM/yyyy" date="${it.fecha}"/></em>
                                        </span>
                                    </div>
                                    <div>${it.descripcion}</div>
                                </a>
                            </li>
                            <li class="divider"></li>
                        </g:each> 
                            <li>
                                <a class="text-center" href="#">
                                    <strong>Ver todas</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- Fin notificaciones -->

                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <%def u = SessionManager.getCurrentUser()%>
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>${u.nombre} ${u.apellido}</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    %{-- Modulos de la barra lateral --}%
                    <ul class="nav" id="side-menu">
                        <g:each in="${AutoridadModulos.getByAuth()}">
                           <li>
                                <a href="${it.url}" target="${it.target}"><i class="${it.icono}"></i> ${it.titulo}</a>
                            </li>
                        </g:each>
                    </ul>
                    <!-- /#side-menu -->
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-10">
                    <g:layoutBody />
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    <!-- <nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
        <div class="container">
            <p class="text-center" style="color:#337ab7">Copyrights <em>@100tifiko</em> - 2016 - <a onclick="hardCode()">HardCode Computacion.</a></p>
            <p class="text-center"></p>
        </div>
    </nav> -->

<g:javascript>
    function hardCode(){
        text =  "HardCode Computacion® 2016.\n\n\n";
        text += "Es una empresa Argentina, lider en desarrollo de software, y con bajos recursos.\n\n";
        text += "---------------------------------------------------------------------\n";
        text += "Nuestra filosofia:\n'El usuario debe adaptarse al software, y no al reves.'\n";
        text += "---------------------------------------------------------------------\n";
        alert(text);
    }
  
</g:javascript>
</body>

</html>

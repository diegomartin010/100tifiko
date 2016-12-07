<%@ page import="estats.AutoridadModulos" %>
<%@ page import="security.User" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>	
		<title>100tifiko</title>

	</head>
	<body>

	 <!-- Estilo body de la pagina  -->
	
		<!-- Titulo de la pagina  -->
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    <!-- Icono -->
                    <i class="fa  fa-book "></i> 
                    Materia                 
                </h1>
            </div>
        </div>
        <!-- ./row  -->
        <a href="/carrera/verCarrera?id=${carrera.id}" class="btn btn-info">
            <i class = "fa fa-arrow-left"></i>
            Carrera
        </a>
        <br><br>
        
        <!-- <div class="col-md-6"> -->
                <!-- Panel de datos de materia -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <p>
                            <i class="fa fa-database"></i>
                            <label> Datos de Materia:</label>
                        </p>
                    </div>
                    <!-- /panel heading -->
                    <div class="panel-body">
                        <form role="form">
                            <div class = "row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Nombre de Materia</label>
                                        <input class="form-control" value="${materia.nombre}" disabled="">
                                    </div>
                                      <div class="form-group">
                                        <label>Codigo</label>
                                        <input class="form-control" value="${materia.codigo}" disabled>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>Carrera</label>
                                        <input class="form-control" value="${carrera.nombre}" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label>Nivel</label>
                                        <input class="form-control" value="${materia.nivel}" disabled="">
                                    </div>
                                   
                                </div>
                               <!--  <div class="col-md-1">
                                    <div class="form-group">
                                        <label>ID</label>
                                        <input class="form-control" value="${materia.id}" disabled>
                                    </div>
                                </div> -->
                            </div>
                        </form>
                    </div>
                    <!-- ./panel body -->
                   
                    <!-- /panel footer -->
                </div>
        <!-- </div> -->

        <!-- Panel de correlatividades -->
        <!-- <div class="col-md-6"> -->
                <!-- Panel de correlatividades -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <p>
                            <i class="fa fa-share-alt"></i>
                            <label> Correlatividades:</label>
                        </p>
                    </div>
                    <div class="panel-body">
                    </div>
                    <!-- ./panel body -->
                    <div class="panel-footer">
                        <br>
                    </div>
                </div>
        <!-- </div> -->
        <!-- /columna -->

        <g:javascript>
        </g:javascript>
</body>
</html>

<%@ page import="estats.AutoridadModulos" %>
<%@ page import="security.User" %>
<%def modulo_nombre = "gestionCarreras"%>
<%def modulo = AutoridadModulos.getByName(modulo_nombre)%>
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
                <h1 class="page-header"><i class="${modulo.icono}"></i>${modulo.titulo}</h1>
            </div>
        </div>
        <!-- ./row  -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class = "fa fa-th-list"></i>
                <label>Lista de Carreras</label>
            </div>
            <div class="panel-body">
                
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Cantidad de Materias</th>
                                <th>Version</th>
                                <th>Acciones</th>
                            </tr> 
                        </thead>
                        <tbody> 
                            <!-- Listamos los usuarios en el sistema -->
                            <g:each var="carrera" in="${carreras}">
                                <tr>
                                    <th scope="row">${carrera.id}</th>
                                    <td>${carrera.codigo}</td>
                                    <td>${carrera.nombre}</td>
                                    <td>${carrera.materias.size()}</td>
                                    <td>${carrera.version}</td>
                                    <td>
                                        <a href="/carrera/verCarrera?id=${carrera.id}" class="btn btn-default">
                                            <i class="fa  fa-search"></i>
                                             Ver Carrera
                                        </a>
                                    </td>
                                </tr>
                            </g:each>
                        </tbody> 
                    </table> 
                
            </div>
            <!-- ./Panel body -->
            <div class="panel-footer">
                <br>
            </div>
        </div>

</body>
</html>

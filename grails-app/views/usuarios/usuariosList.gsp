<%@ page import="estats.AutoridadModulos" %>
<%@ page import="security.User" %>
<%def modulo_nombre = "usuarios"%>
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
            <div class="panel-heading"><i class = "fa fa-th-list"></i> <label>Lista de Usuarios</label></div>
            <div class="panel-body">
                <table class="table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Username</th>
                            <th>Nombre y Apellido</th>
                            <th>e-mail</th>
                            <th>Legajo</th>
                            <th>Activo</th>
                            <th>Acciones</th>
                        </tr> 
                    </thead>
                    <tbody> 
                        <!-- Listamos los usuarios en el sistema -->
                        <g:each var="usuario" in="${User.getAll()}">
                            <tr>
                                <th scope="row">${usuario.id}</th>
                                <td>${usuario.username}</td>
                                <td>${usuario.nombre} ${usuario.apellido}</td>
                                <td>${usuario.email}</td>
                                <td>
                                    <g:if test="${usuario.estadoAcademico}">
                                       ${usuario.estadoAcademico.legajo}
                                    </g:if>
                                    <g:else>
                                        No definido
                                    </g:else>
                                </td>
                                <td>
                                    <g:if test="${usuario.enabled==true}">
                                        <i class="fa fa-check "></i>
                                    </g:if>
                                    <g:else>
                                         <i class="fa fa-times"></i>
                                    </g:else>
                                </td>
                                <td>
                                    <a href="/Usuarios/editar?uid=${usuario.id}" class="btn btn-primary"><i class="fa fa-pencil"></i> Editar</a>
                                </td>
                            </tr>
                        </g:each>
                    </tbody> 
                </table> 
             </div>
        </div>

</body>
</html>

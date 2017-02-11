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
                    <i class="fa fa-user"></i>
                    Editar Usuario                    
                </h1>
            </div>
        </div>
        <!-- ./row  -->
        <!--
        <a href="/usuarios" class="btn btn-info"><i class = "fa fa-th-list"></i> Lista de Usuarios</a><br><br>
        -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-database"></i>
                <label> Formulario de Usuario</label>
                 <a href="#!" onclick = "resetearPassword(${usuario.id})"class = "btn btn-success btn-xm pull-right"><i class= "fa fa-unlock"></i> Recuperar Clave</a><br><br>
            </div>
            <div class="panel-body">
                
                <form role="form">
                    <div class = "row">
                       
                        <div class="col-md-4">
                            <div class = "row">
                            <div class="col-md-9">
                                <div class="form-group">
                                    <label>ID</label>
                                    <input class="form-control" value="${usuario.id}" disabled>
                                </div>
                            </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">     
                                <label>Estado</label>
                                <div class="checkbox">
                                    <label>
                                        <g:if test="${usuario.enabled == true}">
                                            <input id = "enabled" type="checkbox" checked>Usuario Activo
                                        </g:if>
                                        <g:else>
                                            <input id = "enabled" type="checkbox">Usuario Activo
                                        </g:else>
                                    </label>
                                </div>            
                            </div>
                        </div>
                    </div>
                    <div class = "row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Roles / Permisos</label>
                                <input class="form-control" value="${usuario.getAuthorities()}" disabled>
                            </div>
                        </div>
                    </div>
                    <div class = "row">
                        
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Nombre de usuario</label>
                                <input class="form-control" id="username" value="${usuario.username}">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Email</label>
                                <input class="form-control" id="email" value="${usuario.email}">
                            </div>
                        </div>
                        <div class="col-md-1">
                        </div>
                    </div>


                    <div class = "row">
                        
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Nombre</label>
                                <input class="form-control" id="nombre" value="${usuario.nombre}">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Apellido</label>
                                <input class="form-control" id="apellido" value="${usuario.apellido}">
                            </div>
                        </div>
                        <div class="col-md-1">
                        </div>
                    </div>                    
                </form>
            %{-- Aca es donde tiramos la movida --}%
            <div id="mensaje"></div>                        
            </div>
            <!-- ./panel body -->
            <div class="panel-footer">
                <a href="#!" class="btn btn-primary pull-right" onclick="guardar(${usuario.id})"><i class="fa fa-save"></i> Guardar</a>
                <a href="/usuarios" class="btn btn-warning pull-right" onclick=""><i class="fa fa-arrow-left"></i> Cancelar</a>
                <br><br>
            </div>
        </div>

        <g:javascript>
            
            // Ejecutamos la funcion guardar
            function guardar(id){
                // Lanzamos un post para guardar la movida
                
                $.post( "/usuarios/saveEdited", 
                    {
                          id: id
                        , nombre:  $( "#nombre" ).val()
                        , apellido: $( "#apellido" ).val()
                        , username: $( "#username" ).val()
                        , email: $( "#email" ).val()
                        , enabled: $( "#enabled" ).prop( "checked" )
                    }
                )
                // .done(function( data ) {
                //     alert("usuario guardado");
                // }); 
                $(location).attr('href', '/usuarios') 


            }

            // Funcion para resetear el password.
            function resetearPassword(id){
                
                if(confirm("Reinicio de contraseña.\n---------------------------------\nSe cambiara la contraseña del usuario, y se enviara un mail al mismo para activar la cuenta.")){
                    
                    $.post( "/gestionCuentas/resetearPassword", 
                        {
                            id: id
                        }
                    )
                    .done(function( data ) {
                        alert("La contraseña ha sido reiniciada. Por seguridad se ha bloqueado la cuenta.")
                        // $("#mensaje").append("<div class='alert alert-success'><p>"+data.mensaje+"</p></div>").hide().show('fast')
                    });
                }
               
            }
        </g:javascript>
</body>
</html>

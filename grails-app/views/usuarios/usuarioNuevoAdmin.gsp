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
                    <i class="fa fa-arrow-up"></i>
                    <i class="fa fa-user"></i>
                    Nuevo Usuario                  
                </h1>
            </div>
        </div>
        <!-- ./row  -->
        <a href="/usuarios" class="btn btn-info"><i class = "fa fa-th-list"></i> Lista de Usuarios</a><br><br>
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-database"></i>
                <label> Formulario de Nuevo Usuario</label>
            </div>
            <div class="panel-body">
                
                <form role="form">
                    <div class = "row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Roles / Permisos</label>
                                <select class="form-control" id="role">
                                    <option value="">
                                        Seleccione Permiso.
                                    </option>
                                    <option value="ROLE_ALUMNO">
                                        Alumno
                                    </option>
                                    <option value="ROLE_ADMINISTRADOR">
                                        Administrador
                                    </option>
                                </select> 
                            </div>
                        </div>
                        %{-- sacamos la partede usuario activo --}%
                        %{-- <div class="col-md-2">
                            <div class="form-group">     
                                <label>Estado</label>
                                <div class="checkbox">
                                    <label>
                                        <input id = "enabled" type="checkbox" checked>Usuario Activo
                                    </label>
                                </div>            
                            </div>
                        </div> --}%
                    </div>
                    <div class = "row">
                        
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Username</label>
                                <input class="form-control" id="username" placeholder = "Username" value="">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Email</label>
                                <input class="form-control" id="email" placeholder = "e-mail" value="">
                            </div>
                        </div>
                        <div class="col-md-1">
                        </div>
                    </div>


                    <div class = "row">
                        
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Nombre</label>
                                <input class="form-control" id="nombre" placeholder = "Nombre" value="">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Apellido</label>
                                <input class="form-control" id="apellido" placeholder = "Apellido" value="">
                            </div>
                        </div>
                        <div class="col-md-1">
                        </div>
                    </div>                    
                </form>
                %{-- Aca se va a mostrar el mensaje de error --}%
                <div id="mensaje"></div>
            </div>
            <!-- ./panel body -->
            <div class="panel-footer">
                <a href="#!" class="btn btn-primary pull-right" onclick="guardar()"><i class="fa fa-save"></i> Guardar</a>
                <a href="/usuarios" class="btn btn-warning pull-right" onclick=""><i class="fa fa-arrow-left"></i> Cancelar</a>
                <br><br>
            </div>
        </div>

        <g:javascript>
             // Ejecutamos la funcion guardar
            function guardar(){
                
                alert($( "#role" ).val())
                
                $.post( "/usuarios/usuarioNuevoAdminGuardar", 
                    {
                          nombre:  $( "#nombre" ).val()
                        , apellido: $( "#apellido" ).val()
                        , username: $( "#username" ).val()
                        , email: $( "#email" ).val()
                        , role: $( "#role" ).val()
                    }
                )
                .done(function( data ) {
                    $("#mensaje").append("<div class='alert alert-"+data.claseAlerta+"'><p>"+data.mensaje+"</p></div>").hide().show('fast')
                })  


            }

        </g:javascript>

</body>
</html>

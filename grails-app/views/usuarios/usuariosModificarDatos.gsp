<%@ page import='estats.*'%>
<%@ page import='security.*' %>
<%@ page import='modelo.*' %>

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
                    Modificar datos                   
                </h1>
            </div>
        </div>
        <!-- ./row  -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-database"></i>
                <label> Formulario de Usuario</label>
            </div>
            <div class="panel-body">
                
                <form role="form">
                    
                   
                    <div class = "row">
                        
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Username</label>
                                <input class="form-control" id="username" value="${currentUser.username}">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Email</label>
                                <input class="form-control" id="email" value="${currentUser.email}">
                            </div>
                        </div>
                        <div class="col-md-1">
                        </div>
                    </div>


                    <div class = "row">
                        
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Nombre</label>
                                <input class="form-control" id="nombre" value="${currentUser.nombre}">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Apellido</label>
                                <input class="form-control" id="apellido" value="${currentUser.apellido}">
                            </div>
                        </div>
                        <div class="col-md-1">
                        </div>
                    </div> 
                    <div class = "row">
                        
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Modificar Password</label>
                                <input class="form-control" type='password' id="password" value="${currentUser.password}">
                            </div>
                        </div>

                    </div>   
                    <div class="row">

                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Repetir Password</label>
                                <input class="form-control" type='password' id="rePassword" value="${currentUser.password}">
                            </div>
                        </div>

                    </div>
                                                
                </form>
            %{-- Aca es donde tiramos la movida --}%
            <div id="mensaje"></div>                        
            </div>
            <!-- ./panel body -->
            <div class="panel-footer">
                <a href="#!" class="btn btn-primary pull-right" onclick="guardar()"><i class="fa fa-save"></i> Guardar</a>
                <a href="/" class="btn btn-warning pull-right" onclick=""><i class="fa fa-arrow-left"></i> Cancelar</a>
                <br><br>
            </div>
        </div>

        <g:javascript>
            
            // Ejecutamos la funcion guardar
            function guardar(){
                // Lanzamos un post para guardar la movida
                var password = $( "#password" ).val()
                var rePassword = $( "#rePassword" ).val()

                if(password == rePassword){
                    $.post( "/usuarios/guardarDatosUsuario", 
                        {
                            nombre:  $( "#nombre" ).val()
                            , apellido: $( "#apellido" ).val()
                            , username: $( "#username" ).val()
                            , email: $( "#email" ).val()
                            , password: password
                        }
                    )
                    
                    alert("Datos Modificados Correctamente.")

                    $(location).attr('href', '/') 

                }else{
                    alert('Contraseña Incorrecta')
                }

            }

           
        </g:javascript>
</body>
</html>

<!DOCTYPE html>
 <html lang="en" class="no-js">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
		<title><g:layoutTitle default="Grails"/></title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
<asset:link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>
  		
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/bootstrap/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="/css/simple-sidebar.css">

		<script src="/jquery/jquery.js"></script>
		<script src="/bootstrap/js/bootstrap.min.js"></script>

		%{-- Aca va el head de la pagina --}%
		<g:layoutHead/>
</head>
	
<body>
	<div id="grailsLogo" role="banner">
		<a href="/"><asset:image src="logos/logo.png" alt="Grails"/></a>
		<sec:ifLoggedIn>
			<span class="logout-btn" >
				%{-- Notificaciones --}%
				<div class="dropdown">
    			<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
        		Notificaciones <b class="caret"></b>
    			</a>
    			<ul class="dropdown-menu">
        			<li><a href="#">Notificación #1</a></li>
        			<li class="divider"></li>
        			<li><a href="#">Notificación #2</a></li>
        			<li class="divider"></li>
        			<li><a href="#">Notificación #3</a></li>
    				</ul>
  				%{-- Usuario --}%
				<g:link controller="user" action="show" id="${sec.loggedInUserInfo(field:"id")}"><sec:username/></g:link>
				<g:link controller='logout' >Salir</g:link>
			</span>
		</div>
		</sec:ifLoggedIn>

	</div>
	<div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand"><a href="/">Index</a></li>
                <li><a href="/nofunciona">Tutoriales</a></li>
				<li><a href="/estadoAcademico">Estado Academico</a></li>
				<li><a href="/nofunciona">Estadisticas</a></li>
				<li><a href="/examen">Examenes</a></li>
				<li><a href="/agenda">Agenda</a></li>
				<li><a href="/simulacion">Simulacion</a></li>
				<li><a href="/carrera">Administrar carreras</a></li>
            </ul>
        </div>
	</div>
		%{-- Contenido de la pagina --}%
		<g:layoutBody/>

	<div class="footer" role="contentinfo"></div>
	<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
</body>
</html>
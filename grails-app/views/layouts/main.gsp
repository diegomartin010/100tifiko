<!DOCTYPE html>
 <html lang="en" class="no-js">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
		<title><g:layoutTitle default="Grails"/></title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		
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
				%{-- Usuario --}%
				<g:link controller="user" action="show" id="${sec.loggedInUserInfo(field:"id")}"><sec:username/></g:link>
				|<g:link controller='logout' >Salir</g:link>
			</span>
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
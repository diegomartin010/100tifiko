<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		
			<title><g:layoutTitle default="Grails"/></title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		
  		%{-- Carga de hojas de estilos predenterminadas --}%
  		<asset:stylesheet src="application.css"/>
  		%{-- Js de aplicacion --}%
		<asset:javascript src="application.js"/>

		%{-- Css Bootstrap --}%
		<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="/bootstrap/css/bootstrap-theme.min.css">
		
		%{-- Scripts --}%

		%{-- Jquery --}%
		<script src="/jquery/jquery.js"></script>
		%{-- Js Bootstrap --}%
		<script src="/bootstrap/js/bootstrap.min.js"></script>

			%{-- Aca va el head de la pagina --}%
			<g:layoutHead/>


	</head>
	
	<body>
		<div id="grailsLogo" role="banner">
			<a href="/"><asset:image src="logos/logo_12.png" alt="Grails"/></a>

			<sec:ifLoggedIn>
				<span class="logout-btn" >
					%{-- Usuario --}%
					<g:link controller="user" action="show" id="${sec.loggedInUserInfo(field:"id")}">
							<sec:username/>
					</g:link> |
					<g:link controller='logout' >
							Salir
					</g:link>
				</span>
		</sec:ifLoggedIn>


		</div>
		
		%{-- Movida login logout --}%
			<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>MENU</h1>
			<ul>
				<li><a href="/nofunciona">Tutoriales</a></li>
				<li><a href="/estadoAcademico">Carreras</a></li>
				<li><a href="/nofunciona">Estadisticas</a></li>
				<li><a href="/nofunciona">Examenes</a></li>
				<li><a href="/nofunciona">Agenda</a></li>
				<li><a href="/nofunciona">Simulador</a></li>
				<li><a href="/carrera">Administrar carreras</a></li>
			</ul>
		</div>
			%{-- Contenido de la pagina --}%
			<g:layoutBody/>

		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
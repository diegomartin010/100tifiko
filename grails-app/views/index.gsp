<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>


		
		<style type="text/css">
			body {
			    box-shadow: 0 0 0.3em #4A4A4A;
			}

			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}



			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>

		<title>100tifiko</title>

	</head>
	<body>
		%{-- <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="status" role="complementary">
			<h1>Informacion de carrera</h1>
			<ul>
				<li>ESTO ESTA HARDCODEADO</li>
				<li>Nombre: Igenieria en sistemas</li>
				<li>Facultad: UTN FRD</li>
				<li>Legajo: 9158</li>
				<li>Fecha de inicio: 01/01/2011</li>
			</ul>
		</div> --}%
		<div id="page-body" role="main">
			<h1>Bienvenido a 100tifiko</h1>
			<p>Vamos a empezar a crear la aplicacion</p>

			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					%{-- <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each> --}%
					<a href="/login">PANTALLA LOGIN</a>
				</ul>
			</div>
		</div>
	</body>
</html>

<script type="text/javascript">
	alert("holamundo");
</script>

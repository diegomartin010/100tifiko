<%@ page import="estats.AutoridadModulos" %>
<%def modulo_nombre = "index"%>
<%def modulo = AutoridadModulos.getByName(modulo_nombre)%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>	
		<title>100tifiko</title>

	</head>
	<body>

	%{-- Estilo body de la pagina --}%
	<div id="page-body" role="main">
		%{-- Titulo de la pagina --}%
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="${modulo.icono}"></i>${modulo.titulo}</h1>
            </div>
        </div>
        %{-- ./row --}%

		<div class="container">
			<div class="col-md-6">	
				<a class = "btn btn-default" href="./controladorPrueba">ENOJARME CON LA VIDA !!!!!!</a>
				<iframe width="560" height="315" src="https://www.youtube.com/embed/bUlSjgbag8o?rel=0&autoplay=1" frameborder="0" allowfullscreen></iframe>
				<img src="http://www.aceroymagia.com/Images/articulo/cuadro-canvas-patan-muttley-autos-locos/01-cuadro-canvas-patan-muttley-autos-locos.jpg">
				

			</div>		
		</div>
	</div>
</body>
</html>

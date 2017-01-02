<%@ page import="estats.*" %>
<%def modulo_nombre = "estadisticas"%>
<%def modulo = AutoridadModulos.getByName(modulo_nombre)%>
<!DOCTYPE html>
<html>
<head>
<g:javascript src="estadisticas/estadisticas.js" />
<meta name="layout" content="main">
	<title><g:message code="Básicamente estadísticas"/></title>
</head>
<body>

	%{-- navegacion? --}%
	<div class="nav" role="navigation">
	</div>
	%{-- Body --}%
	<div id="page-body" role="main">
		%{-- Titulo de la pagina --}%
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="${modulo.icono}"> </i>${modulo.titulo}</h1>
            </div>
        </div>


        	%{-- Estadisticas --}%
        	<div class="row">
        		<% def indicadores = EstadisticasManager.getEstadisticas() %>
        		%{-- Indicador 1 --}%
        		<g:each in="${indicadores}" var="indicador">
	                <div class="col-lg-6 col-md-6">
	                    <div class="panel panel-${indicador.color}">
	                        <div class="panel-heading">
	                            <div class="row">
	                                <div class="col-xs-12">
	                                    <div class="text-left">${indicador.descripcion}:</div>
	                                    
	                                    <div class="huge text-center">${indicador.valor}</div>
	                                </div>
	                            </div>
	                            <div class="row">
	                            	<div class="col-xs-12 text-center">
	                                    <div>${indicador.unidad}</div>
		                            </div>
								</div>
	                        </div>
	                    </div>
	                </div>
	            </g:each>
                %{-- fin indicador --}%
            </div>
            %{-- Fin estadisticas --}%

	</div>
</body>
</html>

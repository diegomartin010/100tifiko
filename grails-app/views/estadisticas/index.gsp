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

        	<p>Posicionar arriba de un indicador para ver su descripcion.</p>
        	%{-- Estadisticas --}%
        	<div class="row">
        		<% def indicadores = EstadisticasManager.getEstadisticas() %>
        		%{-- Indicador 1 --}%
        		<g:each in="${indicadores}" var="indicador">
	                <div class="col-lg-3 col-md-3">
	                    <div class="panel panel-${indicador.color}">
	                        <div class="panel-heading" data-toggle="tooltip" title="${indicador.formula}">
	                            <div class="row">
	                                <div class="col-xs-12">
	                                    <div class="text-left">${indicador.descripcion}:</div>
	                                    
	                                    <div class="text-center"><h4>${indicador.valor} ${indicador.unidad}</h4></div>
	                                </div>
	                            </div>
	                           %{--  <div class="row">
	                            	<div class="col-xs-12 text-center">
	                                    <div>${indicador.unidad}</div>
		                            </div>
								</div> --}%
	                        </div>
	                    </div>
	                </div>
	            </g:each>
                %{-- fin indicador --}%
            </div>
            %{-- Fin estadisticas --}%

	</div>
<g:javascript>
 	$('[data-toggle="tooltip"]').tooltip(); 
</g:javascript>
</body>
</html>

<%@ page import="estats.SessionManager" %>
<%@ page import="modelo.Carrera" %>
<%@ page import="modelo.Materia" %>
<%@ page import="estats.AutoridadModulos" %>
<%def modulo_nombre = "nuevaCarrera"%>
<%def modulo = AutoridadModulos.getByName(modulo_nombre)%>
<!DOCTYPE html>
<html>
<head>
	%{-- Incluir logica javascript --}%
	<g:javascript src="carrera/manejoArchivos.js" />
	%{-- Incluir cabeceras de estilos --}%
	<meta name="layout" content="main">
	%{-- Titulo de la pagina --}%
	<title>Carrera</title>
</head>
<body>

		%{-- Titulo de la pagina --}%
		<div class="row">
      <div class="col-lg-12">
        <h1 class="page-header"><i class="${modulo.icono}"></i> ${modulo.titulo}</h1>
      </div>
    </div>		
	
    <div class="panel panel-default">
      <div class="panel-heading">
        <label>Nueva carrera</label>
      </div>
      <div id="1" class="panel-body">
        Cargar archivo json con nueva carrera
        %{-- <span class="label label-warning"> --}%
          <a href="https://es.wikipedia.org/wiki/JSON" target="_blank">
            Cómo es el formato?
          </a>
        %{-- </span> --}%
        <br><br>
        <input type="file" id="nuevaCarrera"> 
      </div>%{-- /panel body --}%
    </div>%{-- /panel default --}%
		
		<div class="panel panel-default">
				<div class="panel-heading"> <label>Carreras en el sistema</label> </div>
				<div id="1" class="panel-body">
           <table class="table">
              <thead>
                  <tr>
                      <th>ID</th>
                      <th>Codigo</th>
                      <th>Nombre de Carrera</th>
                      <th>Cantidad de Materias</th>
                      <th>Carrera Activa</th>
                      <th>Acciones</th>
                  </tr> 
              </thead>
              <tbody> 
                  <!-- Listamos los usuarios en el sistema -->
                  <g:each var="carrera" in="${Carrera.list()}">
                      <tr>
                          <th scope="row">
                              ${carrera.id}
                          </th>
                          <td>
                              ${carrera.codigo}
                          </td>
                          <td>
                              ${carrera.nombre}
                          </td>
                          <td>
                              ${carrera.materias.size()}
                          </td>
                          <td>
                              <g:if test="${carrera.activa}">
                                <i class="fa fa-check">
                              </g:if>
                              <g:else>
                                <i class="fa fa-times">
                              </g:else>
                          </td>
                          <td>
                              <a href="/carrera/editarCarrera?id=${carrera.id}" class="btn btn-default">
                                <i class="fa fa-pencil"></i> Editar
                              </a>
                          </td>
                      </tr>
                  </g:each>
              </tbody> 
          </table> 
        
        </div>
        <div class="panel-footer">
          <br><br>
        </body>
		</div>

		
	%{-- Logica Javascript --}%
	<g:javascript src="carrera/carrera.js" />
  <g:javascript>
    // Logica para editar una carrera
    function editarCarrera(id){

    }
  </g:javascript>

</body>
</html>
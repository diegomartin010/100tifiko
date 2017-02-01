<!DOCTYPE html>
<html>
<head>
	%{-- Incluir cabeceras de estilos --}%
	<meta name="layout" content="main">
	%{-- Titulo de la pagina --}%
	<title>Editar</title>
</head>
<body>

		%{-- Titulo de la pagina --}%
		<div class="row">
      <div class="col-lg-12">
        <h1 class="page-header">Editar Carrera</h1>
      </div>
    </div>		
	  <a href="/carrera" class="btn btn-info">
      <i class = "fa  fa-arrow-left "></i> Carreras del Sistema
    </a>
    <br><br>
		<div class="panel panel-default">
				<div class="panel-heading"> 
          <i class = "fa fa-th-list"></i>
          <label>Datos de Carrera: </label> ${carrera.codigo} ${carrera.nombre}
          <button class="btn btn-default pull-right" onclick="nuevaMateria()"><i class="fa fa-arrow-up"></i> Nueva Materia</button>
          <a href="/correlatividad/renderCorrelatividades?cid=${carrera.id}" class="btn btn-default pull-right">
            <i class="fa  fa-pencil"></i> Editar Correlativas
          </a>
          
          <br><br>
        </div>
				<div class="panel-body">
          <div class="col-md-2">
            <div class="form-group">
              <label>Codigo</label>
              <input class="form-control" value="${carrera.codigo}" disabled>
            </div>  
          </div>
          <div class="col-md-4">
            <div class="form-group">
              <label>Nombre</label>
              <input id="nombre" class="form-control" value="${carrera.nombre}">
            </div>  
          </div>
            <div class="form-group">
              <label>Estado</label><br>
                      <g:if test="${carrera.activa}">
                        <input id="activa" type="checkbox" checked>Carrera Activa
                      </g:if>
                      <g:else>
                        <input id="activa" type="checkbox" >Carrera Activa
                      </g:else>
            </div>
          <table class="table">
              <thead>
                  <tr>
                      <th>ID</th>
                      <th>Codigo</th>
                      <th>Nivel</th>
                      <th>Nombre de Materia</th>
                      <th>Tipo</th>
                      <th>Acciones</th>
                  </tr> 
              </thead>
              <tbody> 
                  <!-- Listamos los usuarios en el sistema -->
                  <g:each var="materia" in="${carrera.materias}">
                      <tr>
                          <th scope="row">
                              ${materia.id}
                          </th>
                          <td>
                              ${materia.codigo}
                          </td>
                          <td>
                              ${materia.nivel}
                          </td>
                          <td>
                              ${materia.nombre}
                          </td>
                          <td>
                              ${materia.tipo}
                          </td>
                          <td>
                              <a href="/materia/editarMateria?id=${materia.id}&cid=${carrera.id}" class="btn btn-default">
                                 <i class="fa fa-pencil"></i> Editar
                              </a>
                          </td>
                      </tr>
                  </g:each>
              </tbody> 
          </table> 

        </div>
        <div class="panel-footer">
          <button class="btn btn-primary pull-right" onclick="guardarCarrera(${carrera.id})"><i class="fa fa-save"></i> Guardar</button>
          <a href="/carrera" class="btn btn-warning pull-right"><i class="fa fa-arrow-left"></i> Cancelar</a>
          <br><br>
        </div>
		</div>
		
    <g:javascript>
      function guardarCarrera(id){
        var carreraEdit = {
            id: id,
            nombre: $("#nombre").val(),
            activa: $("#activa").is(':checked')
        }

        console.log(carreraEdit)
        $.post( "/carrera/guardarCarrera", carreraEdit ).done(
          function() {
            alert( "Carrera Guardada" )
          }
        )
      }

      function nuevaMateria(){
        alert("BASICAMENTE - Esta funcionalidad no anda todavia.")
      }
      
    </g:javascript>

</body>
</html>
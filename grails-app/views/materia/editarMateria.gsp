<!DOCTYPE html>
<html>
<head>
	%{-- Incluir cabeceras de estilos --}%
	<meta name="layout" content="main">
	%{-- Titulo de la pagina --}%
	<title>Nueva Materia</title>
</head>
<body>

		%{-- Titulo de la pagina --}%
		<div class="row">
      <div class="col-lg-12">
        <h1 class="page-header">Materia</h1>
      </div>
    </div>		
	  <a href="/carrera/editarCarrera?id=${cid}" class="btn btn-info">
      <i class = "fa  fa-arrow-left "></i> Editar Carrera
    </a>
    <br><br>
		<div class="panel panel-default">
				<div class="panel-heading"> 
          <i class = "fa fa-th-list"></i>
          <label>Materia: </label> ${materia.nombre}
        </div>
				<div class="panel-body">
          <div class="col-md-2">
            <div class="form-group">
              <label>Codigo</label>
              <input id = "codigo" class="form-control" value="${materia.codigo}" disabled>
            </div>  
          </div>
          <div class="col-md-3">
            <div class="form-group">
              <label>Nombre</label>
              <input id = "nombre" class="form-control" value="${materia.nombre}">
            </div>  
          </div>
          <div class="col-md-2">
            <div class="form-group">
              <label>Tipo</label>
              <select id = "tipo" class="form-control">
                <g:if test="${materia.tipo == 'O'}">
                  <option value="O"  selected>Obligatoria</option>
                  <option value="E" >Electiva</option>
                </g:if>
                <g:else>
                  <option value="O" >Obligatoria</option>
                  <option value="E" selected>Electiva</option>
                </g:else>
                  
              </select>
            </div>
          </div>
          <div class="col-md-2">
            <div class="form-group">
              <label>Nivel</label>
              <input id="nivel" class="form-control" value="${materia.nivel}">
            </div>
          </div>

        </div>
        <div class="panel-footer">
          <button class="btn btn-primary pull-right" onclick='guardarMateria()'><i class="fa fa-save"></i> Guardar</button>
          <a href="/carrera/editarCarrera?id=${cid}" class="btn btn-warning pull-right"><i class="fa fa-arrow-left"></i> Cancelar</a>
          <br><br>
        </div>
		</div>
		
    <g:javascript>
        function guardarMateria(){
            
            var materiaEdit = {
              nombre: $('#nombre').val(),
              codigo: $('#codigo').val(),
              nivel: parseInt( $('#nivel').val() ),
              tipo: $('#tipo').val()
            }

            console.log(materiaEdit)
            $.post( "/materia/guardarMateria", materiaEdit ).done(
              function() {
                alert( "Materia Guardada" )
              }
            )
        }
        
    </g:javascript>

</body>
</html>
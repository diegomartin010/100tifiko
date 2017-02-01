<!DOCTYPE html>
<html>
<head>
	%{-- Incluir cabeceras de estilos --}%
	<meta name="layout" content="main">
	%{-- Titulo de la pagina --}%
	<title>Correlatividades</title>
</head>
<body>

		%{-- Titulo de la pagina --}%
		<div class="row">
      <div class="col-lg-12">
        <h1 class="page-header">Correlatividades</h1>
      </div>
    </div>		
	  <a href="/carrera/editarCarrera?id=${carrera.id}" class="btn btn-info">
      <i class = "fa  fa-arrow-left "></i> Editar Carrera
    </a>
    <br><br>
		<div class="panel panel-default">
				<div class="panel-heading"> 
          <i class = "fa fa-th-list"></i>
          <label>Correlatividades de : </label> ${carrera.nombre}
        </div>
				<div class="panel-body">
          %{-- Iteracion sobre todas las correlatividades --}%
            %{-- Criterio para materia 1 --}%
            <div class="col-md-2">
              <div class="form-group">
              <label>Carrera ID</label>
              <input value = "${carrera.id}" class="form-control" placeholder="Enter text" disabled>
              </div>  
            </div>
            <div class="col-md-3">
              <div class="form-group">
              <label>Carrera Codigo</label>
              <input class="form-control" value = "${carrera.codigo}" placeholder="Enter text" disabled="">
              </div>  
            </div>

            <%
              def criterios = [
                [ caracter:"C", texto:"Para cursar..."],
                [ caracter:"F", texto:"Para rendir final..."]
              ]
              def requisitos = [
                [ caracter:"R", texto:"Haber regularizado..."],
                [ caracter:"A", texto:"Haber aprobado..."]
              ]
            %>
           <table class="table">
              <thead>
                  <tr>
                      <th>Criterio</th>
                      <th>Materia 1</th>
                      <th>Requisito</th>
                      <th>Materia 2</th>
                      <th>Acciones</th>
                  </tr> 
              </thead>
              <tbody> 
                  <!-- Listamos los usuarios en el sistema -->
                  <g:each var="c" in="${correlativas}">
                    <tr>
                        <th scope="row">
                              <select class="form-control">
                                  <g:each var="cr" in="${criterios}">
                                    <g:if test="${cr.caracter == c.criterio}">
                                      <option value="${cr.caracter}" selected>${cr.texto}</option>    
                                    </g:if>
                                    <g:else>
                                      <option value="${cr.caracter}" >${cr.texto}</option>    
                                    </g:else>
                                  </g:each>
                              </select>
                        </th>
                        <td>
                              <select class="form-control">
                                <g:each var="m" in="${materias}">
                                  <g:if test="${c.materia.id == m.id}">
                                    <option value="${m.id}" selected>[${m.nivel}] ${m.nombre}</option>    
                                  </g:if>
                                  <g:else>
                                    <option value="${m.id}">[${m.nivel}] ${m.nombre}</option>
                                  </g:else>
                                  
                                </g:each>
                              </select>
                        </td>
                        <th scope="row">
                              <select class="form-control">
                                <g:each var="re" in="${requisitos}">
                                  <g:if test="${re.caracter == c.criterio}">
                                    <option value="${re.caracter}" selected>${re.texto}</option>    
                                  </g:if>
                                  <g:else>
                                    <option value="${re.caracter}" >${re.texto}</option>    
                                  </g:else>
                                </g:each>
                              </select>
                        </th>
                        <td>
                              <select class="form-control">
                              <g:each var="m" in="${materias}">
                                <g:if test="${c.materiaCorrelativa.id == m.id}">
                                  <option value="${m.id}" selected>[${m.nivel}] ${m.nombre}</option>    
                                </g:if>
                                <g:else>
                                  <option value="${m.id}">[${m.nivel}] ${m.nombre}</option>
                                </g:else>
                                
                              </g:each>
                          </select>
                        </td>
                        <td>
                          <button class="btn btn-xs btn-danger">
                            Eliminar
                          </button>
                        </td>
                    </tr>
                  </g:each>
              </tbody> 
          </table> 


        </div>
        <div class="panel-footer">
          <button class="btn btn-primary pull-right" ><i class="fa fa-save"></i> Guardar</button>
          <a href="/carrera/editarCarrera?id=${carrera.id}" class="btn btn-warning pull-right"><i class="fa fa-arrow-left"></i> Cancelar</a>
          <br><br>
        </div>
		</div>
	
  <g:javascript>
      alert("BASICAMENTE - Esta parte no esta funcional.")
  </g:javascript>

</body>
</html>
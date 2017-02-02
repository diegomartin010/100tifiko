<%@ page import="estats.*" %>
<%@ page import="modelo.*" %>
<%@ page import="security.*" %>
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
           
            <%
              /*Basicamente esta porqueria que estoy haciendo aca me sirve para
              laburar con todo el tema de los textos y demas.
              Cristina nos va a meter una patada en el orto si muestro cosas como
              C F R A .... */
              def criterios = [
                [ caracter:"C", texto:"Para cursar..."],
                [ caracter:"F", texto:"Para rendir final..."]
              ]
              def requisitos = [
                [ caracter:"R", texto:"Haber regularizado..."],
                [ caracter:"A", texto:"Haber aprobado..."]
              ]
            %>

            <table class="table table-hover">
              <thead>
                  <tr>
                      <th>ID</th>
                      <th>Criterio</th>
                      <th>Materia 1</th>
                      <th>Requisito</th>
                      <th>Materia 2</th>
                      <th>Acciones</th>
                  </tr> 
              </thead>
              <tbody> 
                  <!-- Listamos las correlativas -->
                  <g:each var="c" in="${correlativas}">
                    <tr>
                        <td>
                          ${c.id}
                        </td>
                        <th scope="row" onclick="editCorrelativa(${c.id})" >
                            <g:each var="cr" in="${criterios}">
                              <g:if test="${cr.caracter == c.criterio}">
                                  ${cr.texto}
                              </g:if>
                            </g:each>
                        </th>
                        <td onclick="editCorrelativa(${c.id})" >
                            [${c.materia.nivel}] ${c.materia.nombre}
                        </td>
                        <th scope="row" onclick="editCorrelativa(${c.id})" >
                              <g:each var="re" in="${requisitos}">
                                <g:if test="${re.caracter == c.requisito}">
                                  ${re.texto}
                                </g:if>
                              </g:each>
                        </th>
                        <td onclick="editCorrelativa(${c.id})" >
                            [${c.materiaCorrelativa.nivel}] ${c.materiaCorrelativa.nombre}
                        
                        </td>
                        <td>
                          <button onclick="eliminarCorrelativa(${c.id})" class="btn btn-xs btn-danger">
                            Eliminar
                          </button>
                        </td>
                    </tr>
                  </g:each>
              </tbody> 
          </table> 

        </div>
        <div class="panel-footer">
          <a href="/carrera/editarCarrera?id=${carrera.id}" class="btn btn-warning pull-right"><i class="fa fa-arrow-left"></i> Cancelar</a>
          <br><br>
        </div>
		</div>

    <!-- Modal de edicion correlativas -->
    <div id="myModal" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal editar correlativas contenido-->
        <div class="modal-content modal-success">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title" id="titleCorr">Editar Correlatividad #</h4>
          </div>
          %{-- Vamos a llenar los select con las materias y toda la onda --}%
          <div class="modal-body">
                <label>Criterio:</label>
                <select id="criterio" class="form-control">
                    <g:each in="${criterios}">
                      <option name="criterio" value="${it.caracter}">${it.texto}</option>    
                    </g:each>  
                </select>
                <label>Materia 1:</label>
                <select id="materia" class="form-control">
                    <g:each in="${materias}">
                      <option name="materia1" value="${it.id}">[${it.nivel}] ${it.nombre}</option>    
                    </g:each>
                </select>
                <label>Requisito:</label>
                <select id="requisito" class="form-control">
                   <g:each in="${requisitos}">
                      <option name="requisito" value="${it.caracter}">${it.texto}</option>    
                    </g:each>  
                </select>
                <label>Materia 2:</label>
                <select id="materiaCorrelativa" class="form-control">
                    <g:each in="${materias}">
                      <option name="materia2" value="${it.id}">[${it.nivel}] ${it.nombre}</option>    
                    </g:each>
                </select>
          </div>
          <div class="modal-footer">
            <button id="guardar" value="" onclick="guardarCorrelativa()" class="btn btn-primary pull-right"><i class="fa fa-save"></i> Guardar</button>
            <button class="btn btn-warning pull-right" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Cancelar</button>
          </div>
        </div>

      </div>
    </div>


  <g:javascript>
      
      // Bien.... voy a ser sincero....
      // Me enoje mucho con la vida haciendo esta pantalla, la puta madre.
      // Honestamente odio la aplicacion del orto que estamos haciendo...

      // Basicamente hacemos que las rows de la tabla tengan un puntero.
      $("tr").css('cursor','pointer');
      
      // Funcion para editar correlatividades.
      function editCorrelativa(paramId){

        // Basicamente traigo todas las correlatividades.
        var query = jQuery.parseJSON('${Correlatividad.getAll().encodeAsJSON()}')
        
        // Elijo la correlatividad cuyo id es el que paso como parametro.
        // ese id es el de la correlatividad en la que hice click.
        // El [0] es por cosas raras de javascript, que se yo.
        var corr = $.grep(query, function(e){ return e.id == paramId })[0]

        // Lanzamos la ventana modal.
        $('#myModal').modal('show');


        // Ahora me voy a poner a pelotudear con temas graficos....
        // Esto es un enojo con la vida mal.

        // Recordar que los select ya fueron previamente llenados con materias.
        // eso lo hice con codigo grails.

        // En la modal busco todos los select cuyo nombre sea "criterio"
        $( "[name='criterio']" ).each(
          
          function() {
            
            /*Por cada uno, si el value del select es == al del criterio
            de la correlativa que quiero modificar, entonces setear
            para que este SELECCIONADO. de otro modo no voy a ver la materia.*/
            if($( this ).val() == corr.criterio){
                $( this ).attr("selected","selected")
            }

          }
        )
        
        // Misma cuestion que lo anterior, pero con la materia.
        $( "[name='materia1']" ).each(
          function() {
            if($( this ).val() == corr.materia.id){
                $( this ).attr("selected","selected")
            }
          }
        )

        // Misma cuestion que lo anterior pero con el requisito
        $( "[name='requisito']" ).each(
          function() {
            if($( this ).val() == corr.requisito){
                $( this ).attr("selected","selected")
            }
          }
        )

        // bla bla bla... pero con la MateriaCorrelativa
        $( "[name='materia2']" ).each(
          function() {
            if($( this ).val() == corr.materiaCorrelativa.id){
                $( this ).attr("selected","selected")
            }
          }
        )

        // Negrada: Seteamos el valor del boton guardar del modal
        // con el id de la correlatividad a modificar.
        $("#guardar").val(corr.id)
        $("#titleCorr").text("Editar Correlatividad #"+corr.id)

      }
      

      // Esta funcion la vamos a usar para guardar.
      function guardarCorrelativa(){
        
        // Capturo todos los datos, y los meto en un objeto json.
        var correlativa = {
          id: $("#guardar").val()
          ,criterio: $("#criterio").val()
          ,materiaId:  $("#materia").val()
          ,materiaCorrelativaId:  $("#materiaCorrelativa").val()
          ,requisito:  $("#requisito").val()
        }

        // tiro el Post y refresco la pantalla.
        $.post("/correlatividad/guardarCorrelativa", correlativa).done(
          function(){
            location.reload()
          }
        )

        // Basicamente eso es todo.

      }

      // Movida para eliminar.
      function eliminarCorrelativa(id){
        // Capturo todos los datos, y los meto en un objeto json.
        var correlativa = {
          id: id
        }

        if(confirm("Desea Eliminar Correlatividad?")){
          // tiro el Post y refresco la pantalla.
          $.post("/correlatividad/eliminarCorrelativa", correlativa).done(
            function(){
              alert("Correlativa Eliminada")
              location.reload()
            }
          )  
        }
        
      }

  </g:javascript>

</body>
</html>
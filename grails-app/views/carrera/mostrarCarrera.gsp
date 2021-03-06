<%@ page import="estats.*" %>
<%@ page import="security.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>	
		<title>100tifiko</title>

	</head>
	<body>

	 <!-- Estilo body de la pagina  -->
	
		<!-- Titulo de la pagina  -->
		<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-university"></i> Carrera</h1>
            </div>
        </div>
        <!-- ./row  
        <a href="/carrera/informacionCarreras" class="btn btn-info">
            <i class = "fa  fa-arrow-left "></i> 
            Lista de Carreras
        </a>
        <br><br> -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <p>
                    <i class = "fa fa-th-list"></i>
                    <label>Lista de Materias de: </label> ${carrera.codigo} ${carrera.nombre}
                </p>
            </div>
            <div class="panel-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Código</th>
                                <th>Tipo</th>
                                <th>Materia</th>
                                <th>Regularizando.<br>Habilita a cursar <br>las Materias ...</th>
                                <th>Aprobando.<br>Habilita a cursar <br>las Materias ...</th>                            
                            </tr> 
                        </thead>
                        <tbody> 
                            <!-- Listamos los usuarios en el sistema -->
                            <g:each var="materia" in="${carrera.materias.sort{it.nivel}}">
                                <tr>
                                    <th scope="row">${materia.id}</th>
                                    <td>${materia.codigo}</td>
                                    <td>
                                        <g:if test="${materia.tipo == 'O'}">
                                            Obligatoria
                                        </g:if>
                                        <g:else>
                                            Electiva
                                        </g:else>
                                            
                                    </td>
                                    <td>
                                        <i class="fa  fa-book "></i> 
                                        [${materia.nivel}] 
                                        <a href="/materia/mostrarMateria?id=${materia.id}&cid=${carrera.id}">
                                            ${materia.nombre}
                                        </a>
                                    </td>
                                    <td>
                                        <g:each var="mat" in="${materia.ifR_GetNodeS2C()}">
                                            <i class="fa  fa-book "></i> 
                                            [${mat.nivel}] 
                                            <a href="/materia/mostrarMateria?id=${mat.id}&cid=${carrera.id}">
                                                ${mat.nombre} <br>
                                            </a>
                                        </g:each>
                                    </td>
                                    <td>
                                        <g:each var="mat" in="${materia.ifA_GetNodeS2C()}">
                                            <i class="fa  fa-book "></i> 
                                            [${mat.nivel}]
                                            <a href="/materia/mostrarMateria?id=${mat.id}&cid=${carrera.id}">
                                               ${mat.nombre} <br>
                                            </a>
                                        </g:each>
                                    </td>
                                </tr>
                            </g:each>
                        </tbody> 
                    </table> 
                
            </div>
            <!-- ./Panel body -->
            <div class="panel-footer">
            <a href="/carrera/informacionCarreras" class="btn btn-warning pull-right">
            <i class = "fa  fa-arrow-left "></i> 
            Lista de Carreras
        </a>
            <br><br>
            </div>
        </div>

</body>
</html>

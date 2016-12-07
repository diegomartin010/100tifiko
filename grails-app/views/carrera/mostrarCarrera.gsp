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
                <h1 class="page-header"><i class="fa fa-th-list"></i> Carrera</h1>
            </div>
        </div>
        <!-- ./row  -->
        <a href="/carrera/gestionCarreras" class="btn btn-info"><i class = "fa fa-university"></i> Lista de Carreras</a><br><br>
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
                                <th>Codigo</th>
                                <th>Tipo</th>
                                <th>[nivel] Materia</th>
                                <th>Regularizando.<br>Habilita a cursar:<br>[nivel] Materia.</th>
                                <th>Aprobando.<br>Habilita a cursar:<br>[nivel] Materia.</th>                            
                            </tr> 
                        </thead>
                        <tbody> 
                            <!-- Listamos los usuarios en el sistema -->
                            <g:each var="materia" in="${carrera.materias}">
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
                <br>
            </div>
        </div>

</body>
</html>

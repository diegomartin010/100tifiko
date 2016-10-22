//js Usado en "/views/estadisticas/index.gsp"

$(document).ready(function(){
	calcularExamenes();
	calcularMaterias();
});

	function calcularExamenes(){
		var contador = 0;
		var contadorAprob = 0;
		var acumulador = 0;
		var acumuladorAprob = 0;
		var contadorDesaprob = 0;
		$.post("examen/getExamenes",function(data){
			$.each(data, function(index, examen){
				if(examen.nota>3){
					acumuladorAprob+=examen.nota;
					contadorAprob++;
				}else{
					contadorDesaprob++;
				}
				acumulador+=examen.nota;
				contador++;
			});
		var promedioConAplazos = acumulador/contador;
		console.log ("promedio con aplazos: "+promedioConAplazos);
		document.getElementById("1").innerHTML = promedioConAplazos;
		var promedioSinAplazos = acumuladorAprob/contadorAprob;
		console.log("promedio sin aplazos: "+promedioSinAplazos);
		document.getElementById("2").innerHTML = promedioSinAplazos;
		//ESTO ÑO: console.log("cantidad de materias aprobadas: "+contadorAprob);
		console.log("cantidad de finales desaprobados: "+contadorDesaprob);
		document.getElementById("4").innerHTML = contadorDesaprob;
		});
	};
	function calcularMaterias(){
		var materiasAprobadas;
		//calculo materias aprobadas
		$.post("estadoAcademico/getMateriasByEstado",{
        	estado: "A"
        }).done(function(d) {
         	 materiasAprobadas= d.length;
        	console.log("cantidad de materias aprobadas: "+materiasAprobadas);
        	document.getElementById("3").innerHTML = materiasAprobadas;
		});

        //calculo materias regularizadas
		$.post("estadoAcademico/getMateriasByEstado",{
        	estado: "R"
        }).done(function(d) {
         		var materiasRegularizadas= d.length;
		        console.log("cantidad de materias regularizadas: "+materiasRegularizadas);
		        document.getElementById("5").innerHTML = materiasRegularizadas;
		});
        //calculo materias cursando actualmente
		$.post("estadoAcademico/getMateriasByEstado",{
			estado: "C"
		}).done(function(d){
			var materiasEnCurso = d.length;
			console.log("cantidad de materias cursando: "+materiasEnCurso);
			document.getElementById("6").innerHTML = materiasEnCurso;
		});
		//Esto se viene romerizado:
		//Agregar materias pendientes a las estadísticas del alumno
		$.post("estadoAcademico/getMateriasByEstado",{
			estado: "P"
		}).done(function(d){
			var materiasPendientes = d.length;
			console.log("cantidad de materias pendientes: "+materiasPendientes);
			document.getElementById("7").innerHTML = materiasPendientes;
		});
		//var totalMaterias = 0;
		//totalMaterias = materiasAprobadas+materiasRegularizadas+materiasEnCurso+materiasPendientes;
		//var porcentajeDeRealizacion = materiasAprobadas/totalMaterias;
		//console.log("porcentaje de realización de la carrera: "+porcentajeDeRealizacion);
	};

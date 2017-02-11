package estats

import modelo.*;
import security.*;
import estats.*;
import groovy.time.*

class EstadisticasManager {

	static def getEstadisticas(){
		
		// variable que se va a usar para elegir el color.
		def i = 0

		return([
			
			[
				descripcion: 'Promedio Calculado Con Aplazos'
				, valor: getPromedioConAplazos()
				, unidad: ""
				, color: getColor(i++)
				, formula: "Sumatoria de las notas de todos los examenes, dividido el total de examenes. Los examenes desaprobados, se tienen en cuenta."

			],

			[
				descripcion: "Promedio Calculado Sin Aplazos"
				, valor: getPromedioSinAplazos()
				, unidad: ""
				, color: getColor(i++)
				, formula: "Sumatoria de todas las notas de los finales aprobados, dividido el total de examenes aprobados. Los examenes desaprobados, no influyen en este calculo."
			],

			[
				descripcion: "Cantidad de Materias Aprobadas"
				, valor: getCantidadMateriasAprobadas()
				, unidad: "Materias"
				, color: getColor(i++)
				, formula: "Cantidad de materias para las cuales se ha cargado un final con nota > 4"
			],

			[
				descripcion: "Cantidad de Finales Desaprobados"
				, valor: getCantidadFinalesDesaprobados()
				, unidad: "Finales"
				, color: getColor(i++)
				, formula: "Cantidad de finales cuya nota es < 4."
			],

			[
				descripcion: "Cantidad de Materias Regularizadas"
				, valor: getCantidadMateriasEstadoRegular()
				, unidad: "Materias"
				, color: getColor(i++)
				, formula: "Cantidad de materias que el alumno ha regularizado."
			],

			[
				descripcion: "Cantidad de Materias Cursando"
				, valor: getCantidadMateriasCursaActualmente()
				, unidad: "Materias"
				, color: getColor(i++)
				, formula: "Cantidad de materias que el alumno esta cursando."
			],

			[
				descripcion: "Cantidad de Materias Pendientes"
				, valor: getCantidadMateriasPendientes()
				, unidad: "Materias"
				, color: getColor(i++)
				, formula: "Cantidad de materias que todavia no han sido aprobadas (Nota de final > 4)."
			],

			[
				descripcion: "Hace cuantos años venis cursando la carrera"
				, valor: getTiempoCarrera()
				, unidad: "Anios"
				, color: getColor(i++)
				, formula: "Diferencia en anios, entre la fecha actual, y la fecha en la que el alumno inicio su carrera."
			],

			[
				descripcion: "Porcentaje completado, de la carrera"
				, valor: getPorcentajeCarrera()
				, unidad: "%"
				, color: getColor(i++)
				, formula: "Basicamente, cuanto completaste de la carrera que cursas. Cantidad de Materias Aprobadas (nota > 4), dividido la cantidad de materias total de la carrera."
			],

			[
				descripcion: "Tiempo Hasta Proximo Examen"
				, valor: getTiempoProximoExamen()
				, unidad: "Dias"
				, color: getColor(i++)
				, formula: "Cuantos dias faltan hasta el evento del tipo EXAMEN, mas cercano a la fecha actual, cargado en la agenda."
			]
			
		])

	}

	static def getColor(int i){
		// Paleta de colores.
		def colores = [
			'primary'
			// ,'green'
			// ,'yellow'
			// ,'red'
			// ,'success'
			// ,'warning'
			// ,'info'
			// ,'default'
			// ,'danger'
		]
		return colores[(i%colores.size())]
	}
	
	// Calcula el promedio con aplazos
	static def getPromedioConAplazos(){

		def u = SessionManager.getCurrentUser()
		def e = u.estadoAcademico.examenes
		def prom = 0
		if(e.size()){
			prom = e.sum{it.calificacion} / e.size()
		}		
		return prom.toDouble().round(2)

	}

	// Calcula el promedio sin aplazos
	static def getPromedioSinAplazos(){
		
		def u = SessionManager.getCurrentUser()
		def e = u.estadoAcademico.examenes
		def aprobados = e.findAll{it.calificacion >= 4 }
		def prom = 0
		if(e.size()){
			prom = aprobados.sum{it.calificacion} / aprobados.size()
		}		
		return prom.toDouble().round(2)

	}

	// Calcula la cantidad de materias aprobadas
	static def getCantidadMateriasAprobadas(){
		
		def u = SessionManager.getCurrentUser()
		def e = u.estadoAcademico.estadoMaterias
		def cap = e.count{it.estado == "A"}
		return cap

	}

	// calcula la cantidad de finales desaprobados
	static def getCantidadFinalesDesaprobados(){
		
		def u = SessionManager.getCurrentUser()
		def e = u.estadoAcademico.examenes
		def car = e.count{it.calificacion < 4}
		return car

	}

	// Calcula la cantidad de materias en estado regular
	static def getCantidadMateriasEstadoRegular(){
		
		def u = SessionManager.getCurrentUser()
		def e = u.estadoAcademico.estadoMaterias
		def car = e.count{it.estado == "R"}
		return car
	}

	// calcula la cantidad de materias que esta cursando
	static def getCantidadMateriasCursaActualmente(){
		
		def u = SessionManager.getCurrentUser()
		def e = u.estadoAcademico.estadoMaterias
		def car = e.count{it.estado == "C"}
		return car
	}

	// calcula la cantidad de materias pendientes
	static def getCantidadMateriasPendientes(){
		
		def u = SessionManager.getCurrentUser()
		def ea = u.estadoAcademico
		def aprob = ea.examenes.findAll{it.calificacion >= 4 }.size()
		def totalMat = ea.carrera.materias.size()
		return (totalMat - aprob)

	}

	// Devuelve el tiempo que le esta tomando la carrera en anios
	static def getTiempoCarrera(){
		// fecha hardcode.
		// Date dateFrom = Date.parse("yyyy-MM-dd", "2012-01-01")
		def u = SessionManager.getCurrentUser()
		def ea = u.estadoAcademico
		Date dateFrom = ea.fechaInicio
		// fecha actual hardcode 2.
		Date dateTo = new Date()
		// Date dateTo = Date.parse("yyyy-MM-dd", "2013-01-01")
		return (int)((dateTo - dateFrom)/365).toDouble().round(0) +1
	}

	// Devuelve el porcentaje de la carrera.
	static def getPorcentajeCarrera(){
		
		// Se copypastea codigo a lo negro. Nada de reutilizar.
		def u = SessionManager.getCurrentUser()
		def ea = u.estadoAcademico
		def aprob = ea.examenes.findAll{it.calificacion >= 4 }.size()
		def totalMat = ea.carrera.materias.size()
		return (aprob/totalMat*100).toDouble().round(2)

	}

	// Devuelve el tiempo que tenes hasta el proximo examen
	static def getTiempoProximoExamen(){
		
		Date dateFrom = new Date()
		// fecha actual hardcode 2.
		Date dateTo = Date.parse("yyyy-MM-dd", "2018-01-01")
		return (dateTo - dateFrom).toDouble().round(0)
		
	}

}

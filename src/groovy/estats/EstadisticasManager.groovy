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
				descripcion: 'Promedio Con Aplazos'
				, valor: getPromedioConAplazos()
				, unidad: ""
				, color: getColor(i++)

			],

			[
				descripcion: "Promedio Sin Aplazos"
				, valor: getPromedioSinAplazos()
				, unidad: ""
				, color: getColor(i++)
			],

			[
				descripcion: "# Materias Aprobadas"
				, valor: getCantidadMateriasAprobadas()
				, unidad: "Materias"
				, color: getColor(i++)
			],

			[
				descripcion: "# Finales Desaprobados"
				, valor: getCantidadFinalesDesaprobados()
				, unidad: "Finales"
				, color: getColor(i++)
			],

			[
				descripcion: "Materias Regularizadas"
				, valor: getCantidadMateriasEstadoRegular()
				, unidad: "Materias"
				, color: getColor(i++)
			],

			[
				descripcion: "# Materias Cursando"
				, valor: getCantidadMateriasCursaActualmente()
				, unidad: "Materias"
				, color: getColor(i++)
			],

			[
				descripcion: "# Materias Pendientes"
				, valor: getCantidadMateriasPendientes()
				, unidad: "Materias"
				, color: getColor(i++)
			],

			[
				descripcion: "Tiempo de Carrera"
				, valor: getTiempoCarrera()
				, unidad: "Anios"
				, color: getColor(i++)
			],

			[
				descripcion: "Porcentaje de Realizacion"
				, valor: getPorcentajeCarrera()
				, unidad: "%"
				, color: getColor(i++)
			],

			[
				descripcion: "Tiempo Hasta Proximo Examen"
				, valor: getTiempoProximoExamen()
				, unidad: "Dias"
				, color: getColor(i++)
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

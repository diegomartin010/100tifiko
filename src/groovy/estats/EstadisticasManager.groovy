package estats

import modelo.*;
import security.*;
import estats.*;

class EstadisticasManager {

	static def getEstadisticas(){
		
		// variable que se va a usar para elegir el color.
		def i = 0

		return([
			[
				descripcion: getPromedioConAplazos().descripcion
				, valor: getPromedioConAplazos().valor
				, unidad: getPromedioConAplazos().unidad
				, color: getColor(i++)

			],

			[
				descripcion: getPromedioSinAplazos().descripcion
				, valor: getPromedioSinAplazos().valor
				, unidad: getPromedioSinAplazos().unidad
				, color: getColor(i++)
			],

			[
				descripcion: getCantidadMateriasAprobadas().descripcion
				, valor: getCantidadMateriasAprobadas().valor
				, unidad: getCantidadMateriasAprobadas().unidad
				, color: getColor(i++)
			],

			[
				descripcion: getCantidadFinalesDesaprobados().descripcion
				, valor: getCantidadFinalesDesaprobados().valor
				, unidad: getCantidadFinalesDesaprobados().unidad
				, color: getColor(i++)
			],

			[
				descripcion: getCantidadMateriasEstadoRegular().descripcion
				, valor: getCantidadMateriasEstadoRegular().valor
				, unidad: getCantidadMateriasEstadoRegular().unidad
				, color: getColor(i++)
			],

			[
				descripcion: getCantidadMateriasCursaActualmente().descripcion
				, valor: getCantidadMateriasCursaActualmente().valor
				, unidad: getCantidadMateriasCursaActualmente().unidad
				, color: getColor(i++)
			],

			[
				descripcion: getCantidadMateriasPendientes().descripcion
				, valor: getCantidadMateriasPendientes().valor
				, unidad: getCantidadMateriasPendientes().unidad
				, color: getColor(i++)
			],

			[
				descripcion: getTiempoCarrera().descripcion
				, valor: getTiempoCarrera().valor
				, unidad: getTiempoCarrera().unidad
				, color: getColor(i++)
			],

			[
				descripcion: getPorcentajeCarrera().descripcion
				, valor: getPorcentajeCarrera().valor
				, unidad: getPorcentajeCarrera().unidad
				, color: getColor(i++)
			],

			[
				descripcion: getTiempoProximoExamen().descripcion
				, valor: getTiempoProximoExamen().valor
				, unidad: getTiempoProximoExamen().unidad
				, color: getColor(i++)
			]
			
		])

	}

	static def getColor(int i){
		// Paleta de colores.
		def colores = [
			'primary'
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
		
		return([
			descripcion: "Promedio Con Aplazos"
			,valor: prom
			,unidad:''
		])
	}

	// Calcula el promedio sin aplazos
	static def getPromedioSinAplazos(){
		return [
			descripcion: "Promedio Sin Aplazos"
			,valor: 9.5
			,unidad:''
		]
	}

	// Calcula la cantidad de materias aprobadas
	static def getCantidadMateriasAprobadas(){
		
		def u = SessionManager.getCurrentUser()
		def e = u.estadoAcademico.estadoMaterias

		def cap = e.count{it.estado == "A"}

		return([
			descripcion: "# Materias Aprobadas"
			,valor: cap
			,unidad:'Materias'
		])
	}

	// calcula la cantidad de finales desaprobados
	static def getCantidadFinalesDesaprobados(){
		
		def u = SessionManager.getCurrentUser()
		def e = u.estadoAcademico.examenes

		def car = e.count{it.calificacion < 4}


		return([
			descripcion: "# Finales Desaprobados"
			,valor: 0
			,unidad:'Finales'
		])
	}

	// Calcula la cantidad de materias en estado regular
	static def getCantidadMateriasEstadoRegular(){
		
		def u = SessionManager.getCurrentUser()
		def e = u.estadoAcademico.estadoMaterias

		def car = e.count{it.estado == "R"}

		return([
			descripcion: "# Materias Regularizadas"
			,valor: car
			,unidad:'Materias'
		])
	}

	// calcula la cantidad de materias que esta cursando
	static def getCantidadMateriasCursaActualmente(){
		
		def u = SessionManager.getCurrentUser()
		def e = u.estadoAcademico.estadoMaterias

		def car = e.count{it.estado == "C"}

		return([
			descripcion: "# Materias Cursando"
			,valor: car
			,unidad:'Materias'
		])
	}

	// calcula la cantidad de materias pendientes
	static def getCantidadMateriasPendientes(){
		return([
			descripcion: "# Materias Pendientes"
			,valor: 50
			,unidad:'Materias'
		])
	}

	// Devuelve el tiempo que le esta tomando la carrera en anios
	static def getTiempoCarrera(){
		return([
			descripcion: "Tiempo Total de Carrera"
			,valor: 4.5
			,unidad:'Anhos'
		])
	}

	// Devuelve el porcentaje de la carrera.
	static def getPorcentajeCarrera(){
		return([
			descripcion: "Porcentaje de Carrera"
			,valor: 70
			,unidad:'%'
		])
	}

	// Devuelve el tiempo que tenes hasta el proximo examen
	static def getTiempoProximoExamen(){
		return([
			descripcion: "Tiempo Proximo Examen"
			,valor: 9.5
			,unidad:'Dias'
		])
	}

}

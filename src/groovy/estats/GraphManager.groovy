package estats
import security.*;
import modelo.*;
import estats.*;

class GraphManager {

	static def getByNivel(){
		def m = SessionManager
			.getCurrentUser()
			.getEstadoAcademico()
			.getCarrera()
			.getMaterias()

		def arrayMaterias = []
		for(elem in m) {
			arrayMaterias[elem.nivel] =	m.findAll{ it.nivel == elem.nivel }
			// Borrar repetidos
			arrayMaterias[elem.nivel].unique()
		}
		// arrayMaterias - null
		return (arrayMaterias - null)

	}

	static def getNombres(){
		def array_grafo = [
			  nodos:[]
			, dependencias:[]
		]
		// def x = 0
		for(elem in getByNivel() ) {
			// if(elem == null) continue
			println("aca entra")
			println("Materia ${elem.nombre} nombre")
			elem.each{
				println("Voy a cargar materia ${it.nombre}")
				if(!array_grafo.nodos[it.nivel]){
					array_grafo.nodos[it.nivel]= []
				}
				array_grafo.nodos[it.nivel].push(it.nombre)
				array_grafo.nodos[it.nivel].push("${it.nombre}(F)")
				array_grafo.nodos[it.nivel].unique()
			}
			array_grafo.nodos = array_grafo.nodos - null
		}
		return (array_grafo - null)
	}


}

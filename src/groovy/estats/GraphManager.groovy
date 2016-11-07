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

	static def getDataNodes(){
		
		def array_grafo = [ nodos:[], dependencias:[] ]

		def colores = [
			pendiente: "#E2E1E1",
			cursando: "#FFF7D5" ,
			regular: "#B1E6FF",
			aprobada: "#BEFFAD"
		]

		def m = SessionManager
			.getCurrentUser()
			.getEstadoAcademico()
			.getCarrera()
			.getMaterias()

		def ea = SessionManager
			.getCurrentUser()
			.getEstadoAcademico()
			def escX = 300;
			def escY = 150;
			def i = 0
			def nivelact = 0
		m.each{
			
			if(nivelact != it.nivel) i = 0
			def elColor
			if(ea.isEstado(it, "P")) elColor = colores.pendiente
			if(ea.isEstado(it, "C")) elColor = colores.cursando
			if(ea.isEstado(it, "R")) elColor = colores.regular
			if(ea.isEstado(it, "A")) elColor = colores.aprobada
			
			array_grafo.nodos.push([
				  id : it.codigo
				, label : "${it.nombre} (Nivel:${it.nivel})"
				, shape : "box"
				, shadow : true
				, color : elColor
				// ,size:50
				, x:escX*it.nivel , y:escY*(i)
				, fixed : [ x : true, y : true ]
				, level : it.nivel

			])
			println("Esto cursando ${it.nombre}?" + ea.isEstado(it, "C"))
			if(!ea.isEstado(it, "A")){
				array_grafo.nodos.push([
					  id : "${it.codigo}F"
					, label : "${it.nombre}(Final)"
					, shape : "dot"
					, shadow : true
					, color : "#FFAAAA"
					, x:escX*(it.nivel+1) , y:(escY*i+70)
					, fixed : [ x : true, y : true ]
					, level : (it.nivel + 1)

				])
			}
			i++;
			array_grafo.nodos.unique()

			// Creamos las dependencias R --> C
			it.ifR_GetNodeS2C().each{ matSig->
				array_grafo.dependencias.push([
					  from: it.codigo
					, to: matSig.codigo
					// , arrows:[to:'disabled']
					,shadow:"enabled"
				])
			}
			
			// Creamos las dependencias A --> C
			it.ifA_GetNodeS2C().each{ matSig->
				array_grafo.dependencias.push([
					  from: "${it.codigo}F"
					, to: "${matSig.codigo}"
					// , arrows:[to:'enabled']
					// ,shadow:"enabled"
				])
			}

			array_grafo.dependencias.push([
					  from: "${it.codigo}"
					, to: "${it.codigo}F"
					// , arrows:[to:'enabled']
					// ,shadow:"enabled"
				])

			array_grafo.dependencias.unique()
			
			nivelact = it.nivel

		}/*m.each{}*/	
						
		array_grafo.nodos = array_grafo.nodos - null
		return(array_grafo)
	
	}

}

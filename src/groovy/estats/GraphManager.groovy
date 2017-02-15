package estats
import security.*;
import modelo.*;
import estats.*;

class GraphManager {

	// Metodo para configurar cosas raras
	static def configuracion(){
		def config = [
			colores:[
				pendiente: "#d9534f",
				permitida: "#5cb85c",
				cursando: "#ffb733" ,
				regular: "#2e9fff",
				aprobada: "blue",
				finalAlerta: "#5cb85c",
				// finalAlerta: "#933",
				finalBloqueado: "#d9534f",
				defecto: "#E2E1E1"
			]
			, shape:[
				materias:"box",
				examenes:"dot"
			]
			, fontSize: 24
			, fixed: [
				x: true,
				y: true
			]
			, shadow:[
				nodosMaterias: false,
				nodosExamenes: false,
				aristasMaterias: false,
				aristasExamenes: false
			]
			, arrows: [ to:true ]
			, escX: 500
			, escY: 300
			, escYExam: 120
		]

	}

	static def getColorByEstado(String estado){
		def color = null
		switch(estado) {
			case "P":
				color = configuracion().colores.pendiente
			break
			case "C":
				color = configuracion().colores.cursando
			break
			case "R":
				color = configuracion().colores.regular
			break
			case "A":
				color = configuracion().colores.aprobada
			break
			default:
				color = configuracion().colores.defecto
			break
		}
	}

	static def getShapes(){
		configuracion().shapes
	}

	static def getX(){
		configuracion().escX
	}

	static def getY(){
		configuracion().escY
	}

	static def getYExam(){
		configuracion().escYExam
	}

	static def materias(){
		SessionManager
		.getCurrentUser()
		.getEstadoAcademico()
		.getCarrera()
		.getMaterias()
		
	}

	static def estadoAcademico(){
		SessionManager
		.getCurrentUser()
		.getEstadoAcademico()

	}

	// Devuelve el Json con nodos
	static def getDataNodes(){
		
		// Objeto json a devolver
		def array_grafo = [ nodos:[], dependencias:[] ]	
		def m = materias()
		def ea = estadoAcademico()
		
		// variable de control. No dar bola.
		def nivelact = 0
		// Nodo con el que se labura.
		def i = 0
		
		// Iteramos sobre las materias de la carrera del flaco.
		m.each{
			
			// Cuando terminamos de recorrer todas las materias de un nivel
			// Reiniciamos el contador.
			if(nivelact != it.nivel) i = 0
			
			// Segun el estado de la materia, seteamos los colores
			def colorMateria = getColorByEstado(it.getEstado())
			if(
				it.knIcurse() && 
				it.getEstado() == "P"
			){
				colorMateria = configuracion().colores.permitida
			}
			def colorFinal = configuracion().colores.finalBloqueado
			if(it.knIfinal()){
				colorFinal = configuracion().colores.finalAlerta	
			}
			
			
			array_grafo.nodos.push([
				  id : it.codigo
				, label :/* "(nivel: ${it.nivel})"+*/"${it.nombre}".take(30)
				, shape :  configuracion().shape.materias
				, shadow : configuracion().shadow.nodosMaterias
				, color : colorMateria
				, font: [ size: configuracion().fontSize, color:"white" ]
				, x:getX()*it.nivel , y:getY()*(i)
				, fixed : configuracion().fixed
				, level : it.nivel

			])

			// Si la materia no fue aprobada, agregamos un nodo
			// Que representa que todavia tengo que rendir final.
			if(!ea.isEstado(it, "A")){
				array_grafo.nodos.push([
					  id : "${it.codigo}F"
					, label : "(final) ${it.nombre}".take(30)
					, shape : configuracion().shape.examenes
					, shadow : configuracion().shadow.nodosExamenes
					, color : colorFinal
					, font: [ size: configuracion().fontSize ]
					, x:(getX())*(it.nivel+1) , y:(getY()*i+getYExam())
					, fixed : configuracion().fixed
					, level : (it.nivel + 1)

				])
			}
			
			// Eliminamos los repetidos.
			array_grafo.nodos.unique()

			// Dependencias de la materia, hacia la materia siguiente.
			it.ifR_GetNodeS2C().each{ matSig->
				array_grafo.dependencias.push([
					  from: it.codigo
					, to: matSig.codigo
					, arrows: configuracion().arrows
					, shadow: configuracion().shadow.aristasMaterias
					// , width: 3
				])
			}
			
			// Creamos las dependencias finales -> materias siguientes.
			it.ifA_GetNodeS2C().each{ matSig->
				array_grafo.dependencias.push([
					  from: "${it.codigo}F"
					, to: "${matSig.codigo}"
					, arrows: configuracion().arrows
					,shadow: configuracion().shadow.aristasExamenes
					, hoverWidth:0.5
					, width: 3
				])
			}

			// Creamos las dependencias Materias --> Finales.
			array_grafo.dependencias.push([
				  from: "${it.codigo}"
				, to: "${it.codigo}F"
				, arrows: configuracion().arrows
				, shadow: configuracion().shadow.aristasExamenes
				, width: 3
			])

			// Eliminamos elementos repetidos
			array_grafo.dependencias.unique()
			
			// cuadramos el nivel sobre el cual estamos tratando
			nivelact = it.nivel
			// Aumentamos el item con el que laburamos.
			i++;

		}/*m.each{}*/	
		
		// Eliminamos los que son nulos.
		array_grafo.nodos = array_grafo.nodos - null
		return(array_grafo)
	
	}

}

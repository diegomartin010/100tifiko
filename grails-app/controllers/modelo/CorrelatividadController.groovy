package modelo

class CorrelatividadController {

    def index() { }

    def renderCorrelatividades(Integer cid){
    
    	render(
    		view:"/correlatividad/editarCorrelativas"
    		,model:[
    			correlativas: Correlatividad.findAll().findAll{ it.carreraId == cid }
    			,materias: Carrera.get(cid).materias
    			,carrera: Carrera.get(cid)
    		]
    	)
    }

    def guardarCorrelativa(){
    	
    	def c = Correlatividad.get(params.id)
    	c.materia = Materia.get(params.materiaId)
    	c.materiaCorrelativa = Materia.get(params.materiaCorrelativaId)
    	c.criterio = params.criterio
    	c.requisito = params.requisito

    	c.save(flush:true)

    	render(true)

    }

    def eliminarCorrelativa(){
    	Correlatividad.get(params.id).delete(flush:true)
    	render(true)
    }

}

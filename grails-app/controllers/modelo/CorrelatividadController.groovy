package modelo

class CorrelatividadController {

    def index() { }

    // Renderiza la pagina de las correlatividades
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

    // Guarda una correlatividad actualizada
    def guardarCorrelativa(){
    	
    	def c = Correlatividad.get(params.id)
    	c.materia = Materia.get(params.materiaId)
    	c.materiaCorrelativa = Materia.get(params.materiaCorrelativaId)
    	c.criterio = params.criterio
    	c.requisito = params.requisito

    	c.save(flush:true)

    	render(true)

    }

    // Elimina una correlatividad
    def eliminarCorrelativa(){
    	Correlatividad.get(params.id).delete(flush:true)
    	render(true)
    }

    // Crea una nueva correlatividad
    def nuevaCorrelativa(){
        
        new Correlatividad(
            carreraId: params.carreraId
            ,carreraCodigo: params.carreraCodigo
            ,criterio: params.criterio
            ,materia: Materia.get(params.materiaId)
            ,materiaCorrelativa: Materia.get(params.materiaCorrelativaId)
            ,requisito: params.requisito
        ).save(flush:true)
        
        render(true)
    }

}

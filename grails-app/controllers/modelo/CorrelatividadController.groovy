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
}

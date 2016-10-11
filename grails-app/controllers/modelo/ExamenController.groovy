package modelo

class ExamenController {

    def index() { 
    	render(view:'index')
    }

 /*   def getNombreMaterias( ){
        def e = request.getParameter("estado")
		def user = SessionManager.getCurrentUser()
        
        def result = []
        user.estadoAcademico.estadoMaterias.findAll{ it.estado == e }.each{em->
         result.push(nombre : em.materia.nombre)
        }
    render(contentType: 'text/json') {
        result
        }
    } */
}

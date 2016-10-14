package modelo
import estats.SessionManager

class ExamenController {

    def index() { 
    	render(view:'index')
    }

    def getExamenes(){
        def user = SessionManager.getCurrentUser()
        def result = []
        user.estadoAcademico.examenes.findall().each{ex->
            result.push(examen:ex)
        }
        render(contentType: 'text/json') {
            result
        }
    }

    def getNombreMaterias( ){
        //def e = request.getParameter("estado")
		def user = SessionManager.getCurrentUser()
        
        def result = []
        user.estadoAcademico.estadoMaterias.findAll().each{em->
         result.push(nombre : em.materia.nombre)
        }
    render(contentType: 'text/json') {
        result
        }
    }

    def guardar(){
    	def fec = request.getParameter("fecha")
    	def mat = request.getParameter("materia")
    	def nota = request.getParameter("nota")
    	//capturo el usuario
    	def user = SessionManager.getCurrentUser()

    	//básicamente añado a la materia, la fecha y nota del examen.
    	//además, si la nota es mayor o igual a 4, cambio el estado a aprobado.
    		def m = user.estadoAcademico.estadoMaterias.find { it.materia == mat }	
    		//if (nota >= 4){
    		//	m.estado="A"
            //}
            //creo el examen y lo guardo.
            user.estadoAcademico.examenes.push(
                new Examen (
                    fecha  : fec,
                    materia : mat,
                    nota : nota
                ).save()
            )
    		//guardo
    		//m.save()
    		//valor de retorno
    		

    } 
}

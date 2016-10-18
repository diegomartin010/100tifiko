package modelo
import estats.SessionManager

class ExamenController {

    def index() { 
    	render(view:'index')
    }

    def getExamenes(){
        def user = SessionManager.getCurrentUser()
        def result = []
        user.estadoAcademico.examenes.findAll().each{ex->
            result.push(ex)
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
    	

        println("Controlador guardar Examenes")
        
        

        // Usuario en sesion.
    	def user            = SessionManager.getCurrentUser()
        // Estado academico del tipo.
        def ea              = user.estadoAcademico

        

        // Parametros de formulario por POST.
        // Convertimos fecha ingresado como string, en una fecha piola.
        def fecha           = new Date().parse("dd/MM/yy" , params.fecha)
        // Este queda como esta ...
        def nombreMateria   = params.materia
        // El formulario lo pasa en String, el dato tiene que ser en integer.
        def nota            = params.nota.toInteger()          
        println("Parametros Fecha: ${fecha} Materia:${nombreMateria} Nota:${nota}")
        


        // Busco en la carrera del tipo, si hay una materia con el nombre pasado en el param.
        def laMateria = 
            ea
            .carrera
            .materias
            .find{ it.nombre == nombreMateria }
        


        println("voy a crear un examen con materia ${laMateria.nombre} ${laMateria.codigo}")
        def nex = 
            new Examen (
                // Paso parametro de fecha.
                fecha:  fecha,
                // Paso la materia recien traida.
                materia : laMateria,
                // Paso la nota en integer. El atributo del examen es Calificacion.
                calificacion : nota,
                // No cargo ninguna observacion.
                observaciones: null
            ).save( flush:true )
        ea.examenes.push(nex)
        
        println("guardado")
        
        user.save( flush:true )
        
        // Martin es un Tape!!!.
        render(contentType: 'text/json') {[
            examen: nex,
            result: true
        ]}
    		

    } 
}

package modelo
import estats.SessionManager

class ExamenController {

    def index() { 
    	render(view:'index')
    }

    def getExamenes(){
        def user = SessionManager.getCurrentUser()
        def result = []
        result = user.estadoAcademico.examenes.findAll().collect{ ex->
                    [
                         id: ex.id,
                         nombre : ex.materia.nombre,
                         nota : ex.calificacion,
                         fecha : ex.fecha
                    ]
                }  
        // Renderizar el json
        render(contentType: 'text/json'){
           result 
        }

    }
  /*  def getNombreMateria (){
        def user = SessionManager.getCurrentUser()
        def idmateria = params.id
        println(params.id)
        def materia = user.estadoAcademico.estadoMaterias.materia.find{it.codigo == idmateria}
        println(materia.nombre)
        def mat = materia.nombre
    render(contentType: 'text/json') {[
            nombre: mat,
            result: true
        ]}
    }
*/
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
        //Básicamente es el formato de la fehca ES HORRIBLE usa este FORMATO: Sun Jul 10 00:00:00 ART 2016
        //Por defecto es: 10/06/2016 , mucho mejor. Pero no funciona :C
        //Convertimos fecha ingresado como string, en una fecha piola.
        def fecha           = new Date().parse("dd/MM/yy" , params.fecha)
        //def fecha = params.fecha
        // Este queda como esta ...
        def nombreMateria   = params.materia
        // El formulario lo pasa en String, el dato tiene que ser en integer.
        def nota            = params.nota.toInteger()          
        println("Parametros Fecha: ${fecha} Materia:${nombreMateria} Nota:${nota}")
        


        // Busco en la carrera del tipo, si hay una materia con el nombre pasado en el param.
        def laMateria = ea.carrera.materias.find{ it.nombre == nombreMateria }
        //intento cambiarle el nombre para ver si debugeo la tabla

        println("voy a crear un examen con materia ${laMateria.nombre} ${laMateria.codigo} " )
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
        if (nota > 3){
            def estadoMateriaAModificarEstado = ea.estadoMaterias.find{it.materia.nombre == nombreMateria}
            estadoMateriaAModificarEstado.estado = "A";
            println("se aprobó la materia: "+estadoMateriaAModificarEstado.materia.nombre)
        }
        user.save( flush:true )

        def cantidadexamenes = ea.examenes.size()
        println("guardado, cantidad de examenes guardados: "+cantidadexamenes)
        
        
        // Martin es un Tape!!!.
        render(contentType: 'text/json') {[
            examen: nex,
            result: true
        ]}
    		

    } 
}


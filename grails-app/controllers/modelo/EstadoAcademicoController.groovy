package modelo

import estats.*

/**
* @tipo Controlador
* @descripcion Se utiliza para manejar el Estado Academico del Usuario.
* Todas las operaciones de Vincular, Desvincular un Nuevo estado academico,
* etc. seran ejecutadas en este controlador.
*/
class EstadoAcademicoController {
    /**
    * Renderiza la vista /estadoAcademico/index.gsp.
    * @url localhost:8080/estadoAcademico/
    * @param Ninguno
    * @desc Ninguna
    */
    def index() { 
	   def u = SessionManager.getCurrentUser()
       // println("Usuario actual en sesion: ${SessionManager.getCurrentUser().nombre}")
       render( view: "index" , model:[user:u])
       // render("Usuario: ${u} Nombre: ${u.nombre} Apellido: ${u.apellido}")
	}
    

   /**
    * Renderiza la vista /estadoAcademico/index.gsp.
    * @desc ninguno
    * @url localhost:8080/estadoAcademico/verEstado
    * @param ninguno
    * @desc ninguna
    */
    def verEstado() { 
       render(view: "estadoAcademico")
    }


    /**
    * Crea un nuevo Estado Academico, y se lo asigna
    * al usuario actual logeado en sesion.
    * @desc Crea un estado academico en base a los parametros
    * capturados, y se lo asigna al usuario. El estado academico consta de
    * una carrera, de la cual, todas las materias se inicializan en estado "P".
    * hace .save() sobre el usuario, el estado academico y el estado de las materias.
    * @url localhost:8080/estadoAcademico/
    * @param legajo required Integer pasado por POST.
    * @param carrera required Integer pasado por POST.
    */
    def crear() { 
        // Molestar al mudo 5/11 8:29am
        try {
        
            // Se captura el legajo y el id del formulario y se parse a Integer.            
            def legajo = params.legajo.toInteger()
            def idCarrera = params.carrera.toInteger()    
            // Se trae de la db la carrera elgida.
            def carrera = 
                Carrera.get( idCarrera )
            // Se captura el usuario actual en sesion.
    		def usuario = 
                SessionManager.getCurrentUser()         
            
            // Se crea el estado academico y se lo setea al estado del usuario
            usuario
                .setEstadoAcademico(
                    new EstadoAcademico (
                          legajo  : legajo
                        , carrera : carrera
                    ).save( flush:true )
                )
            
            // Por cada materia de la carrera
            carrera
                .getMaterias()
                // Que son obligatorias ...
                .findAll{ it.tipo == "O" }
                .each{ unaMateria->   
                    usuario
                        .estadoAcademico
                        .estadoMaterias
                        .push(
                            // Se crea un estado Materia con la materia, y se la vincula al usuario.
                            new EstadoMateria(
                                  estadoAcademico: usuario.estadoAcademico
                                , materia: unaMateria
                                , estado: "P"
                            ).save( )  
                        )
                }
            
            // Guardar el usuario
            usuario.save( flush:true )
            
            render(contentType: 'text/json') { result = false }


        }catch(Exception e){
            render(contentType: 'text/json') { result = true }
        }

    }


    /**
    * Elimina el Estado Academico del Alumno. Un alumno sin estado academico
    * no puede cargar examenes, ver correlatividades, etc.
    * @desc destruye el estado academico del alumno.
    * @url localhost:8080/estadoAcademico/eliminar
    * @param Ninguno
    */
    def eliminar() { 

        try {
                    
            // Se captura el usuario actual en sesion.
            def usuario = SessionManager.getCurrentUser()
            println(usuario.estadoAcademico.carrera.nombre)
            def eAcad = usuario.estadoAcademico
            usuario.estadoAcademico = null
            eAcad.delete(flush:true)
            usuario.save(flush:true)

            
            render(contentType: 'text/json') { 
                result = false
            }

        }catch(Exception e){
            render(contentType: 'text/json') { 
                result = true
            }

        }

    }


    /**
    * Devuelve una lista de materias por estado: pendiente, cursando, regular, aprobada.
    * @desc filtra las materias del usuario segun el parametro que se le pase.
    * @url localhost:8080/estadoAcademico/getMateriasByEstado
    * @param estado tipo String pasado por POST. Valores "P" (pendiente), "R" (regular),
    * "C" (cursando), "A" (aprobada).
    */
    def getMateriasByEstado( ){
        /*Como probar ...
            $.post( "http://localhost:8080/estadoAcademico/getMateriasByEstado", {
                estado: "P"
            }).done(function(d) {
                console.log(d)
            });
        */
        
        // Hacer un collect a lo paradigmas.
        def result = 
            SessionManager
                .getCurrentUser()
                .estadoAcademico
                .estadoMaterias
                .findAll{ it.estado == params.estado && it.materia.knIcurse()}
                .collect{ em->
                    [
                          id: em.materia.id
                        , nombre : em.materia.nombre
                        , estadoActual : em.estado
                        , codigo : em.materia.codigo
                        , tipo : em.materia.tipo
                        , nivel : em.materia.nivel
                    ]
                } 
        println(result) 
        // Renderizar el json
        render(contentType: 'text/json'){
           result 
        }

    }


    /**
    * Devuelve todas las carreras que hay en el sistema.
    * @url localhost:8080/estadoAcademico/getAllCarreras
    * @param Ninguno
    */
    def getAllCarreras(){ 	
    	render(contentType: 'text/json') {
    		Carrera.list().findAll{it.activa}
    	}
    }


    /**
    * Cambia el estado de una materia del Usuario.
    * @url localhost:8080/estadoAcademico/cambiarEstadoMateria
    * @param idMateria Integer pasado por POST
    * @param nuevoEstado String parado por POST. Valores 'C', 'R', 'A', 'P'
    */
    def cambiarEstadoMateria(){

        /*Como probar ...
            $.post( "http://localhost:8080/estadoAcademico/cambiarEstadoMateria", {
                idMateria: 1,
                nuevoEstado: "C"
            }).done(function(d) {
                console.log(d)
            });
        */

        // Usuario actual en sesion.
        def user = SessionManager.getCurrentUser()
        
        // Parametro estado. Captura por post.
        def idMateriaParam = params.idMateria.toInteger()
        def nuevoEstadoParam = params.nuevoEstado     

        // Traemos una materia cuyo id sea el pasado como parametro.
        def m = Materia.get(idMateriaParam)
        
        // Se ebusca en el estado acdemico del flaco, un estado cuya materia sea la elegida "m".
        def em = user.estadoAcademico.estadoMaterias.find{ it.materia == m }       
            // Cambiamos el estado academico
            em.estado = nuevoEstadoParam  
            em.save(flush:true)
            // println("estado Elegido"+em.id+em.materia.nombre+em.estado+" nuevo param"+nuevoEstadoParam)

            // Renderizar resultado operacion
            render(contentType: 'text/json') {
                result = false
            }

    }

}

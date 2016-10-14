package modelo

import estats.SessionManager
import security.User;


class EstadoAcademicoController {

    def index() { 
	   render(view: "index")
	}
	
    def verEstado() { 
       render(view: "estadoAcademico")
    }

    def crear() { 
        
        try {
        
            // Se captura el legajo y el id del formulario y se parse a Integer.
            // def legajo    =    request.getParameter("legajo").toInteger()
            // def idCarrera =    request.getParameter("carrera").toInteger()
            
            def legajo    =    params.legajo.toInteger()
            def idCarrera =    params.carrera.toInteger()
            
            // Se captura el usuario actual en sesion.
    		def u = SessionManager.getCurrentUser()         

            def carrera = Carrera.get(idCarrera)

            // Se crea el estado academico y se lo setea al estado del usuario
            u.estadoAcademico = new EstadoAcademico (
               legajo  : legajo,
               carrera : carrera
            ).save()
            
            // Creamos los estados de materias pendientes para la primera vez.
            def nuevoEstadoMaterias = []
            carrera.materias.findAll{it.tipo == "O"}.each{ unaMateria->
                // Creamos estados de materias
                nuevoEstadoMaterias.push(
                    new EstadoMateria(
                        // Los asignamos la eacad previamente creado.
                        estadoAcademico: u.estadoAcademico,
                        materia: unaMateria,
                        estado: "P"
                    ).save()
                )
            }

            // Asinamos al conjunto estado de Materias, los estados  de materias.
            u.estadoAcademico.estadoMaterias = nuevoEstadoMaterias
            u.save(flush: true)
            
            render(contentType: 'text/json') { result = false }


        }catch(Exception e){
            render(contentType: 'text/json') { result = true }
        }

    }

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

    def getMateriasByEstado( ){
        /*Como probar ...
            $.post( "http://localhost:8080/estadoAcademico/getMateriasByEstado", {
                estado: "P"
            }).done(function(d) {
                console.log(d)
            });
        */
        
        // Parametro estado. Captura por post.
        def e = params.estado
        // Usuario actual en sesion.
        def user = SessionManager.getCurrentUser()
        // Hacer un collect a lo paradigmas.
        def result = user.estadoAcademico.estadoMaterias.findAll{ it.estado == e }.collect{em->
            [
                  id: em.materia.id
                , nombre : em.materia.nombre
                , estadoActual : em.estado
                , codigo : em.materia.codigo
                , tipo : em.materia.tipo
                , nivel : em.materia.nivel
            ]
        }  
        // Renderizar el json
        render(contentType: 'text/json'){
           result 
        }

    }

    // Devuelve el conjunto de las carreras en el sistema
    def getAllCarreras(){ 	
    	render(contentType: 'text/json') {
    		Carrera.list()
    	}
    }

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

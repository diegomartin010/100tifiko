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
            def legajo    =    request.getParameter("legajo").toInteger()
            def idCarrera = request.getParameter("carrera").toInteger()
            
            // Se captura el usuario actual en sesion.
    		def u = SessionManager.getCurrentUser()         

            // Se crea el estado academico y se lo setea al estado del usuario
            u.estadoAcademico = new EstadoAcademico (
               legajo  : legajo,
               carrera : Carrera.get(idCarrera)
            ).save()
            
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

    // Devuelve todas las materias en el sistema
    def getMaterias(){

    }

    // Devuelve el conjunto de las carreras en el sistema
    def getAllCarreras(){ 	
    	render(contentType: 'text/json') {
    		Carrera.list()
    	}
    }

}

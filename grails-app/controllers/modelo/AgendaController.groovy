package modelo

import estats.SessionManager
import security.User;

class AgendaController {

    def index() { 
    	render(view:'index')
    }

    def nuevoEvento(){

	   	/*Como probar ...
            $.post( "http://localhost:8080/agenda/nuevoEvento", {
                  fecha: "27/02/93"
                , tipo: "E"
                , descripcion: "Prueba Examen: Analisis XXX"
            })
        */

        // Obtenemos usuario en sesion
    	SessionManager
    		.getCurrentUser()
    		.estadoAcademico
    		.eventos
    		.push(
    			// Le seteamos un nuevo evento a y guaramos evento
    			new Evento( 	
		    		  fecha : new Date().parse("dd/MM/yy" , params.fecha)
					, tipo : params.tipo
					, descripcion : params.descripcion		
    			).save(flush : true)

    		)
    		// Guardamos usuario
    		.save(flush:true)

    }
}

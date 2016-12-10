package modelo
import estats.SessionManager
import security.User;
 /**
* Controlador que se encarga de manejar la agenda
* del usuario.
*/
class AgendaController {
    /**
    * Renderiza la pagina principal de agenda
    * @url localhost:8080/agenda/
    */
    def index() { 
    	render(view:'index')
    }


    /**
    * Guarda un evento en la agenda.
    * @url localhost:8080/agenda/guardarEvento
    * @param params.titulo      required Integer via POST. ej "hola"
    * @param params.fecha       required Date via POST. ej "27/02/93"
    * @param params.tipo        required String via POST. Valores "E" "A"
    * @param params.descripcion required String via POST. ej. "Analisis XXX"
    */
    def guardarEvento(){
        /*Como probar ...
            $.post( "http://localhost:8080/agenda/guardarEvento", {
                  fecha: "27/02/93"
                , tipo: "E"
                , descripcion: "Prueba Examen: Analisis XXX"
            })
        */
        //println(params.id)
        println(params.titulo)
        // println(params.fecha)
        def user = SessionManager.getCurrentUser()
        // Obtenemos usuario en sesion
        println("imprimo cantidad de eventos PRE guardado: "+user.estadoAcademico.eventos.size())
    		// Le seteamos un nuevo evento a y guaramos evento
    	def nevento = new Evento(
		        fecha : new Date().parse("d/M/yyyy" , params.fecha),
				tipo : "E",
                //id : params.id,
				descripcion : params.titulo
    		).save(flush : true)
        user.estadoAcademico.eventos.push(nevento)
        println("se procede a guardar el Evento: Título: "+params.titulo+" Fecha: "+params.fecha)
    	
    	// Guardamos usuario
    	user.save(flush:true)
        println("imprimo cantidad de eventos Post guardado: "+user.estadoAcademico.eventos.size())

    
    render(view:'index')
    } 


     /**
    * Devuelve todos los eventos de agenda guardados en el
    * estado academico del usuario.
    * @url localhost:8080/agenda/getEventos
    */
    def getEventos(){
        def user = SessionManager.getCurrentUser()
        def result = []
        result = user.estadoAcademico.eventos.findAll().collect{ev->
            [   fecha : ev.fecha,
                tipo : ev.tipo,
                descripcion : ev.descripcion
            ]
        }
        render(contentType: 'text/json'){
           result 
        }
    }


     /**
    * Elimina un evento de la agenda.
    * @url localhost:8080/agenda/eliminarEvento
    * @param param.id Parametro del evento
    */
    def eliminarEvento(){
        def user = SessionManager.getCurrentUser()
        def eventoAEliminar = Evento.get(params.id)
        println("imprimo evento y su id: "+eventoAEliminar+" "+params.id)
        println("cantidad de eventos antes de eliminar: "+user.estadoAcademico.eventos.size())
        user.estadoAcademico.eventos.remove(eventoAEliminar)
        user.estadoAcademico.save(flush:true)
        user.save(flush:true)
        println("cantidad de eventos desp de eliminar: "+user.estadoAcademico.eventos.size())
    }


      /**
    * Guarda un evento desde la vista /simulacion/index.
    * @url localhost:8080/agenda/guardarEventosSimulacion
    * @param params.fecha Date POST. ej '27/07/93'
    * @param params.tipo Sring POST ['E','A']. ej. 'E'
    * @param params.descripcion String POST. ej. "Nuevo Evento"
    */
    def guardarEventoSimulacion(){
        /*Como probar ...
            $.post( "http://localhost:8080/agenda/guardarEvento", {
                  fecha: "27/02/93"
                , tipo: "E"
                , descripcion: "Prueba Examen: Analisis XXX"
            })
        */

        def user = SessionManager.getCurrentUser()
        // Obtenemos usuario en sesion
        println("imprimo cantidad de eventos PRE guardado: "+user.estadoAcademico.eventos.size())
        // Le seteamos un nuevo evento a y guaramos evento
        def nevento = new Evento(
            fecha : new Date().parse("d/M/yyyy" , params.fecha),
            tipo : params.tipo,
            descripcion : params.descripcion
        ).save(flush : true)
        
        user.estadoAcademico.eventos.push(nevento)
        println("se procede a guardar el Evento: Título: "+params.titulo+" Fecha: "+params.fecha)
        
        // Guardamos usuario
        user.save(flush:true)
        println("imprimo cantidad de eventos Post guardado: "+user.estadoAcademico.eventos.size())
    }
}
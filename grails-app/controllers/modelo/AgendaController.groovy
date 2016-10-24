package modelo
import estats.SessionManager
import security.User;

class AgendaController {

    def index() { 
    	render(view:'index')
    }

    def guardarEvento(){
        //println(params.id)
        println(params.titulo)
       // println(params.fecha)
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
		        fecha : new Date().parse("dd/MM/yy" , params.fecha),
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
}
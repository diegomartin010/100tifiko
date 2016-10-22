package modelo
import estats.SessionManager
//import security.User;

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
        println("Nombre: "+user.nombre)
        // Obtenemos usuario en sesion
        println("imprimo cantidad de eventos PRE guardado: "+user.estadoAcademico.eventos.size())
    		// Le seteamos un nuevo evento a y guaramos evento
    	def nevento = new Evento(
		        //fecha : new Date().parse("dd/MM/yy" , params.fecha),
				tipo : "E",
                //id : params.id,
				descripcion : params.titulo
    		).save(flush : true)
        user.estadoAcademico.eventos.push(nevento)
       // println("se procede a guardar el Evento: Título: ${descripcion}")
    	
    	// Guardamos usuario
    	user.save(flush:true)
        println("imprimo cantidad de eventos Post guardado: "+user.estadoAcademico.eventos.size())

    
    render(view:'index')
    } 
}

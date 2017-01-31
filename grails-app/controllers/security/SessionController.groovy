package security
import estats.*
import modelo.*

class SessionController {

    /**
    * Por default es el metodo que se ejecuta cuando se va al index de la pagina.
    * @url localhost:8080/
    */
    def index() { 

        def slides = [
            admin:[],
            user:[]
        ]

        // Se captura la sesion actual.
    	def s = SessionManager.getCurrentUser()
        
        // Ruta de donde se van a tomar los tutoriales
        def route = "grails-app/assets/images/tutoriales/"

        def user_route = new File("${route}/ROLE_USER")
        user_route.eachFile(){
          slides.user += it.getName()
        }
        // Administradores
        // def admin_route = new File("${route}/ROLE_ADMIN")
        // admin_route.eachFile(){
        //   slides.admin += it.getName()
        // }


        // Si hay una sesion activa...
    	if(s){
            
            // Esta variable contiene TRUE o FALSE.
            def admin = SessionManager.currentUserIsRole('ROLE_ADMINISTRADOR')

            // Si el usuario es admin? ...
            if (admin){
                
                // Cargar la vista de los tutoriales, con las imagenes user_admin.
                render( 
                    view:"/usuarios/tutoriales"
                    , model: [ imagenes: slides.admin ]
                )
            
            // fin if(admin)
            // Si no es admin ... 
            // entonces es alumno ...
            }else{
                    
                    // Como es alumno comprueba si hay un estado acadmeico.
                    if (!s.getEstadoAcademico()){
                       
                        // Si no tiene estado acaedmico, carga los tutoriales del alumno.
                        render(
                            view:"/usuarios/tutoriales"
                            , model: [
                                imagenes: slides.user
                            ]
                        )
                    
                    // fin if(!s.get...)
                    }else{
                    
                        // Si es alumno y tiene estado academico, mostrar un index con 
                        // los proximos eventos en su agenda academica.
                        redirect(uri: "/agenda/eventosProximos")

                    }
                    // fin else

            }
            // fin else

        // fin if(s)
        // Si no tiene una sesion activa, entonces, mandar al login ....
    	}else{
    		render(view:"/login/auth")
    	}

    }

    def setSession(){
    	
    	// buscamos un usuario
    	def u = User.findByUsernameAndPassword( params.username , params.password )
    	
    	// Si el usuario que buscamos existe, es porque estaban bien el user y pass.
    	if(u){
    		
    		// Si el usuario no esta activo
    		if( !u.enabled ){
    			
    			// Decimos que salio todo bien, pero que no esta activo. Por ende no se puede logear.
    			render(contentType: 'text/json') {[
    				// El usuario existe
    				  result: true
    				, enabled: false
    			]}

    		}else{

    			// Si esta activo, entonces lo guardamos en sesion, y decimos que esta todo bien.
    			SessionManager.setUser(u)	
    			render(contentType: 'text/json') {[
    				  result: true
    			    , enabled: true
    			]}
    		}
    	// Si el usuario no existe, es porque la pass y user estan mal.
    	}else{
    		// Decimos que esta todo mal, y que no te podes logear.
    		render(contentType: 'text/json') {[
    			  result: false
    			, enabled:false
    		]}
    	}
    	
    }

    def destroySession(){
    	session.invalidate()
        redirect(uri: "/")
    }
}

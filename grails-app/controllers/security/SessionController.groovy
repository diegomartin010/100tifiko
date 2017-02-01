package security
import estats.*
import modelo.*

class SessionController {

    /**
    * Por default es el metodo que se ejecuta cuando se va al index de la pagina.
    * @url localhost:8080/
    */
    def index() { 

    	def s = SessionManager.getCurrentUser()
        
        // Si no hay una sesin activa ?
    	if(!s){
            
            // Lanzar el login ...
            render(view:"/login/auth")             
        
        // Si hay una sesion activa ?
    	}else{
    		
            // En caso de que el usuario no tenga estado Acdemico ...
            if (!s.getEstadoAcademico()){
                // Mostrar tutoriales.
                redirect(controller: "session", action: "renderTutorials")
            }else{
                // Si tiene estado academico es proque es alumno. 
                // Mostrar la pagina de eventos proximos.
                redirect(uri: "/agenda/eventosProximos")
            }
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

    

    /**
    * Metodo que se utilizara para renderizar los tutoriales
    * @url localhost:8080/session/renderTutorials
    */
    def renderTutorials(){
        
        // Lo que vamos a pasar como parametro
        def slides = [
            admin:[],
            user:[]
        ]

        // Ruta de donde se van a tomar los tutoriales
        def route = "grails-app/assets/images/tutoriales/"

        // Para usuarios
        def user_route = new File("${route}/ROLE_USER")
        user_route.eachFile(){
            slides.user += it.getName()
        }

        // Administradores
        def admin_route = new File("${route}/ROLE_ADMIN")
        admin_route.eachFile(){
            slides.admin += it.getName()
        }

        // Esta variable contiene TRUE o FALSE.
        def isAdmin = SessionManager.currentUserIsRole('ROLE_ADMINISTRADOR')

        // Si el usuario es admin? ...
        if (isAdmin){
            
            // Cargar la vista de los tutoriales, con las imagenes user_admin.
            render( 
                view:"/usuarios/tutoriales"
                , model: [ 
                    imagenes: slides.admin ,
                    route: "/assets/tutoriales/ROLE_ADMIN"
                ]
            )

        }else{
           
            // Cargar la vista de los tutoriales, con las imagenes user_alumno.
            render( 
                view:"/usuarios/tutoriales"
                , model: [ 
                    imagenes: slides.user ,
                    route: "/assets/tutoriales/ROLE_USER"
                ]
            )

        }

    }
}

package security
import estats.*
import modelo.*
class SessionController {

    def index() { 
    	def s = SessionManager.getCurrentUser()
        def user_admin = ["nuevousuario.png","hola"]
        def user_default = ["vincularse.png"]
    	if(s){
            def admin = SessionManager.currentUserIsRole('ROLE_ADMINISTRADOR')
                if (admin)
                     render(view:"/usuarios/tutoriales"
                        , model: [imagenes: user_admin])
                else {
                    if (!s.getEstadoAcademico())
                        render(view:"/usuarios/tutoriales"
                        , model: [imagenes: user_default])
                    else
                        redirect(uri: "/agenda/eventosProximos")
                }
    	}
    	else{
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

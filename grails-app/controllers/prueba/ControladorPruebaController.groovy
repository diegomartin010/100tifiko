package prueba

// import java.security.Security;

// import org.springframework.security.core.context.SecurityContextHolder;
// import org.springframework.security.core.userdetails.UserDetails

// import grails.plugin.springsecurity.SpringSecurityService;
import modelo.*
import estats.*
import security.*

class ControladorPruebaController {

    def index() {
        
       	render(SessionManager.getCodigoActivacion())

	}
}


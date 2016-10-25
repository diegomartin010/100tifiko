package prueba

// import java.security.Security;

// import org.springframework.security.core.context.SecurityContextHolder;
// import org.springframework.security.core.userdetails.UserDetails

// import grails.plugin.springsecurity.SpringSecurityService;
import modelo.Examen;
import modelo.Materia
import modelo.EstadoAcademico
import modelo.Correlatividad
import estats.SessionManager
class ControladorPruebaController {

    def index() {
        SessionManager.permitirRoles(["ROLE_ASD","ROLE_ADMINISTRADOR"])

    	println("------------------------ control VILLERO de prueba.")
    	Materia.getAll().each{
    		println("Regularizando: ${it.nombre}")
    		it.ifR_GetNodeS2C().each{ m->
    			println("Habilito cursar ${m.nombre}")	
    		}
    		println("Aprobando: ${it.nombre}")
    		it.ifA_GetNodeS2C().each{ m->
    			println("Habilito cursar ${m.nombre}")	
    		}

    	}
	}
}


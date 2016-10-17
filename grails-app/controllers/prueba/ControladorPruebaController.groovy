package prueba

import java.security.Security;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails

import grails.plugin.springsecurity.SpringSecurityService;
import modelo.Examen;
import modelo.Materia
import modelo.EstadoAcademico
import modelo.Correlatividad
import estats.SessionManager
class ControladorPruebaController {

    def index() {
    	println("Puedo Cursar*******")
		render(SessionManager.getCurrentUser().estadoAcademico.getCursables())

	}
}


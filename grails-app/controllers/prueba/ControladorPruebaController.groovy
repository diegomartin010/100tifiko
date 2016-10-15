package prueba

import java.security.Security;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails

import grails.plugin.springsecurity.SpringSecurityService;
import modelo.Examen;
import modelo.Materia
import estats.SessionManager
class ControladorPruebaController {

    def index() {

		def mc = SessionManager.getCurrentUser().estadoAcademico.getCursables()
		mc.each{
			println("PUEDE CURSAR")
			println("nombre: "+it.nombre+" cod: "+it.codigo)
		}
					
	}
}


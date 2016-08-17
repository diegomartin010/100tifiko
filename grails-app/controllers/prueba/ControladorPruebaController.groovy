package prueba

import java.security.Security;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails

import grails.plugin.springsecurity.SpringSecurityService;
import modelo.Examen;
import modelo.Materia

class ControladorPruebaController {

    def index() {
		
		def materia = new Materia("analisi1", "obligatoria")
		def examen = new Examen(materia,new Date(),10,"Ninguno")
		
		println(examen.materia.nombre)
		println(examen.calificacion)

		// Asi es como se captura el usuario en sesion actual
		def loggedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal()
		println(loggedUser.id)
		
	}
}


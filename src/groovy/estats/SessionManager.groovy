package estats

// import java.security.Security;

// import org.springframework.security.core.context.SecurityContextHolder;
// import org.springframework.security.core.userdetails.UserDetails

import org.codehaus.groovy.grails.web.util.WebUtils
import security.User;
// import grails.plugin.springsecurity.SpringSecurityService;
import modelo.Examen;
import modelo.Materia;

class SessionManager {

	static def getCurrentUser(){
		// def sess = SecurityContextHolder.getContext().getAuthentication().getPrincipal()
		// def currUsr = User.get(sess.id)
		// def currUsr = User.get(1)
		def session = WebUtils.retrieveGrailsWebRequest().getSession();
		// setUser(User.get(1))
		def u = session["CURRENT_USER"]
		// println("ID del loco logueado ${u.id}")
		if(u){
			return User.get(u.id)
		}else{
			return null
		}
		return User.get(1)
		
	}
	
	static def isLogged(){
		// def sess = SecurityContextHolder.getContext().getAuthentication().getPrincipal()
		// if(sess)
		// 	return true
		// else
		// 	return false
		def session = WebUtils.retrieveGrailsWebRequest().getSession();
		if(session["CURRENT_USER"] != null){
			return true	
		}else{
			return false
		}
		
	}

	static def permitirRoles(List permisos){
		def auth = getCurrentUser().getAuthorities()
		
		def result = false		
		auth.each{
			result = 
				(it.authority.toString() in permisos)||result
		}
		// NEGRADA MULTINACIONAL
		// Abortar controlador --> divido por cero.
		if(!result){0/0}
		
		return result
	}

	static def setUser(User usuario){
		// Capturamos la sesion actualmente en grails.
		def session = WebUtils.retrieveGrailsWebRequest().getSession();
		session["CURRENT_USER"] = usuario
	}

	static def getCodigoActivacion(){
		Math.abs(new Random().nextInt() % 100000) + 1
	}
}

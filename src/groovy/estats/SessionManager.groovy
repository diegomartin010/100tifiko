package estats

// import java.security.Security;

// import org.springframework.security.core.context.SecurityContextHolder;
// import org.springframework.security.core.userdetails.UserDetails

import security.User;
// import grails.plugin.springsecurity.SpringSecurityService;
import modelo.Examen;
import modelo.Materia

class SessionManager {
		
	static def getCurrentUser(){
		// def sess = SecurityContextHolder.getContext().getAuthentication().getPrincipal()
		// def currUsr = User.get(sess.id)
		def currUsr = User.get(1)
	}
	
	static def isLogged(){
		// def sess = SecurityContextHolder.getContext().getAuthentication().getPrincipal()
		// if(sess)
		// 	return true
		// else
		// 	return false
		return true
	}
}

import javax.servlet.http.HttpSession;

class UrlMappings {

	static mappings = {
        
			
			"/$controller/$action?/$id?(.$format)?"{
	            constraints {
	                // apply constraints here
	            }
	        }
		
		
	        "/"(controller: "session", action: "index")
	        "/auth"(view:"/login/auth")
	        "500"(view:'/error')
			// "/carrera"(view:"/estadoAcademico/index")
			"/nofunciona"(view:"/noFunciona")
			"/mail"(view:"/mail/index")
			
	}
}

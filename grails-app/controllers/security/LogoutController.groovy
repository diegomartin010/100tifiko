package security

class LogoutController {

    def index() { 
    	session.invalidate()
        redirect(uri:'/')
    }
}

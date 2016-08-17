package security
import estats.SessionManager
class SessionController {

    def index() { }

    def get(){
    	def usuario = SessionManager.getCurrentUser()
    }
}

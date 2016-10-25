package modelo
import estats.SessionManager
class SimulacionController {

    def index() { 
    	render(view: "index")
    }

    def getSim2Curse(){
    	def eA = SessionManager.getCurrentUser().estadoAcademico
    	def permitidas = eA.getPerm2Curse();
    	def puedoCursar = eA.getAll4Curse();

    	def result = [
    		permitidas: permitidas - puedoCursar ,
    		puedoCursar: puedoCursar
    	]

    	render(contentType: 'text/json') { result }
    }
}

package modelo
import estats.*
import security.*
class SimulacionController {

    def index() { 
        SessionManager.permitirRoles(["ROLE_ALUMNO"])
    	render(view: "index")
    }

    def grafo() {
        render(view: "grafo")
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

    def getGraph(){
        render(contentType: 'text/json') { GraphManager.getDataNodes() }
    }
}

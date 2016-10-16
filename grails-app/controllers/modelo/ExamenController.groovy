package modelo
import estats.SessionManager

class ExamenController {

    def index() { 
    	render(view:'index')
    }

    def getExamenes(){
        def user = SessionManager.getCurrentUser()
        def result = []
        user.estadoAcademico.examenes.findAll().each{ex->
            result.push(examen : ex)
            println("nota: "+ex.calificacion)
            println("fecha: "+ex.fecha)
        }
        render(contentType: 'text/json') {
            result
        }
    }

    def getNombreMaterias( ){
        //def e = request.getParameter("estado")
		def user = SessionManager.getCurrentUser()
        
        def result = []
        user.estadoAcademico.estadoMaterias.findAll().each{em->
         result.push(nombre : em.materia.nombre)
        }
    render(contentType: 'text/json') {
        result
        }
    }

    def guardar(){
    	def fec = request.getParameter("fecha")
    	def mat = request.getParameter("materia").toString()
    	def nota = request.getParameter("nota").toInteger()
    	//capturo el usuario
    	def user = SessionManager.getCurrentUser()

    	//básicamente añado a la materia, la fecha y nota del examen.
    	//además, si la nota es mayor o igual a 4, cambio el estado a aprobado.
    		//capturo m, materia
            def em = user.estadoAcademico.estadoMaterias.find { it.materia.nombre == mat }	
            //capturo em, el estado materia
            def m = em.materia
            println("se capturó la materia" + m.nombre)
            if (nota > 3){
    		em.estado="A"
            }
            em.save()
            //creo el examen y lo guardo.
            def tamaño = user.estadoAcademico.examenes.size()
            println(tamaño)
            user.estadoAcademico.examenes.push(
                new Examen (
                    fecha  : fec,
                    materia : m,
                    nota : nota
                ).save()
            )
            def i = 1
            def listarandom = ["caca","123","diego"]
            tamaño = user.estadoAcademico.examenes.size()
            def tamaño1 = listarandom.size()

            println("tamaño lista de prueba, debería dar 3:    "+tamaño1)
            println("procedo a mostrar los examenes guardados. Cantidad de examenes: " + tamaño)
          //  for (i=0;i<user.estadoAcademico.examenes.size();i++){
          //      println(user.estadoAcademico.examenes.get(i).nota)
          //  }
            redirect(action: "index")

    } 
}

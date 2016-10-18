package modelo

import security.User

class EstadoAcademico {
    Integer legajo
	Carrera carrera
	List examenes = []
	List estadoMaterias = []
	List eventos = []
	
	static hasMany = [
		examenes: Examen,
		estadoMaterias: EstadoMateria,
		eventos: Evento
	]

	static constraints = {
		examenes nullable: true
		estadoMaterias nullable: true
		eventos nullable: true
		legajo unique: true, blank: false		
    }

    // Dame todas las materias que puedo cursar, y estan en pendiente.
    def getAll4Curse(){
        def cursables = 
            this
            .carrera
            .materias
            .findAll{ 
                it.knIcurse() &&
                it.getEstado() == "P"
            }
    }

    // Dame las materias que tengo PERMISO para cursar ---> Cumplo las correlatividades.
    def getPerm2Curse(){

        def cursables = 
            this
            .carrera
            .materias
            .findAll{ 
                it.knIcurse() 
            }
        
    }

}

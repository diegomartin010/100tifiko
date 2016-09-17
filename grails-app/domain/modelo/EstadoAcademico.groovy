package modelo

import security.User

class EstadoAcademico {
    Integer legajo
	Carrera carrera
	List examenes = []
	List estadoMaterias = []
	static hasMany = [
		examenes: Examen,
		estadoMaterias: EstadoMateria,
	]
	
	static constraints = {
		examenes nullable: true
		estadoMaterias nullable: true
		legajo unique: true, blank: false		
    }

}

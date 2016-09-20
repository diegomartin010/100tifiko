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

}

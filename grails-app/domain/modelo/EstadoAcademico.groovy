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
	//static hasOne = [usuario:User]
	
	static constraints = {
		examenes nullable: true
		estadoMaterias nullable: true
		legajo unique: true, blank: false		
    }

    EstadoAcademico(Integer leg, Integer idCarrera){
    	this.legajo = leg	
		def carrera = Carrera.get(idCarrera)
		println("estado Academico Carrerra" + carrera)
		this.carrera = carrera 	
    }

}

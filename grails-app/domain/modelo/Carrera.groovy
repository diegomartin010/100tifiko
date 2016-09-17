package modelo

class Carrera {
	String nombre
	String codigo
	List materias = []
	static hasMany = [
		materias: Materia
	]
	
    static constraints = {
		nombre unique: true, blank: false
    }
		
}

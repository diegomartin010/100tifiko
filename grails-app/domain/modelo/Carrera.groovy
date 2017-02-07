package modelo
 /**
* Carrera que forma parte de un estado academico.
*/
class Carrera {
	String nombre
	String codigo
	Boolean activa = true
	List materias = []
	static hasMany = [
		materias: Materia
	]
	
    static constraints = {
		nombre unique: true, blank: false
    }
		
}

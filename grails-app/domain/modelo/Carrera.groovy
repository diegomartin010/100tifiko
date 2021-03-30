package modelo
 /**
* Carrera que forma parte de un estado academico.
comentario de Feliz Cumpleaño para el mudo (21/03/29) Salu2.
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

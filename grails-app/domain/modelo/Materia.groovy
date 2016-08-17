package modelo

class Materia {
	String nombre
	String tipo
    static constraints = {
		nombre unique: true, blank: false
		tipo blank: false, nullable:true
    }
	
	Materia(String nombre, String tipo) {
		this()
		this.nombre = nombre
		this.tipo = tipo
	}
	
}

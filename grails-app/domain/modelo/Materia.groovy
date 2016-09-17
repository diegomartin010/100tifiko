package modelo

class Materia {
	String nombre
	String tipo
	String codigo
	Integer nivel
    
    static constraints = {
		nombre unique: true, blank: false
		codigo unique: true, blank: false, nullable:true
		nivel nullable:true, blank:true
		// o: obligatoria, e:electiva
		tipo blank: false, nullable:true, inList: ["O","E"]
    }

}

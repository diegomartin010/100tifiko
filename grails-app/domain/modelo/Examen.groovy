package modelo

class Examen {
	Materia materia
	Date fecha
	Integer calificacion
	String observaciones
    static constraints = {
		fecha nullable:false
		calificacion blank:false
		observaciones blank:true, nullable: true
		materia nullable:false		
    }

    @Override
    boolean equals(other) {
        is(other) || (other instanceof Examen && other == this)
    }

    @Override
    String toString() {
        materia
    }
	
	// Examen(Materia mat, Date fech, Integer cal, String obs) {
	// 	this()
	// 	this.materia = mat 
	// 	this.fecha = fech
	// 	this.calificacion = cal
	// 	this.observaciones = obs
	// }
}

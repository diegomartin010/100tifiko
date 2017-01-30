package modelo

class Evento {

	Date fecha
	String tipo
	String descripcion
	boolean activo = true

    static constraints = {
    	fecha nullable:true
    	// E: Examen. A: Alerta.
		tipo nullable:true, inList: ["E","A"]
		descripcion nullable:true
    }
}
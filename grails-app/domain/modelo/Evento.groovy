package modelo

class Evento {

	Date fecha
	String tipo
	String descripcion

    static constraints = {
    	fecha nullable:true
    	// E: Examen. N: Notificacion.
		tipo nullable:true, inList: ["E","N"]
		descripcion nullable:true
    }
}
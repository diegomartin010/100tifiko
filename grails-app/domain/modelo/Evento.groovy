package modelo

class Evento {

	Date fecha
	String tipo
	String descripcion
	boolean activo = true

    static constraints = {
    	fecha nullable:true
    	// E: Examen. N: Notificacion.
		tipo nullable:true, inList: ["E","A"]
		descripcion nullable:true
    }
}
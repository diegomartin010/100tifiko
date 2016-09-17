package modelo

class EstadoMateria {
	Materia materia
	String estado
    static constraints = {
    	estado inList: ["P","C","R","A"]
    }
}

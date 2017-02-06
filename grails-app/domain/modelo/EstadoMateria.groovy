package modelo

class EstadoMateria {
	Materia materia
	String estado
    static constraints = {
    	estado inList: ["P","C","R","A"]
    }

    @Override
    boolean equals(other) {
        is(other) || (other instanceof EstadoMateria && other == this)
    }

    @Override
    String toString() {
        materia
    }
}

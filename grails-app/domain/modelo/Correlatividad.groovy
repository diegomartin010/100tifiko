package modelo

class Correlatividad {
	String criterio
	Materia materia
	Materia materiaCorrelativa
	String requisito
    static constraints = {
    	// Criterio = c: cursar f:dar final
    	criterio inList: ["C", "F"]
    	// Requisito = R: regularizada A:aprobada
    	requisito inList: ["R", "A"]
        	// Ejemplo: Para cursar AM2 hay que haber regularizado AM1. Setear de esta forma
        	// materia: am2
        	// criterio: "c"
        	// materiaCorrelativa: am1
        	// requisito: "r"
	    materia nullable: false
	    materiaCorrelativa nullable: false
    }

}

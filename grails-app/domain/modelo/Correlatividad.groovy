package modelo

import estats.SessionManager

class Correlatividad {
	Integer carreraId
    String carreraCodigo
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
        carreraId nullable: false, blank: false
	    materiaCorrelativa nullable: false
    }

    @Override
    boolean equals(other) {
        is(other) || (other instanceof Correlatividad && other == this)
    }

    @Override
    String toString() {
        carreraCodigo
    }

    def cumpleRequisito(){
        
        def usuario = SessionManager.getCurrentUser()
        def estadoMaterias = usuario.estadoAcademico.estadoMaterias

        def estadoCorrelativa = 
            estadoMaterias
            .find{ it.materia == this.materiaCorrelativa }
            .estado

        def result = true
        
        if( estadoCorrelativa != this.requisito && estadoCorrelativa != "A" )
            result = false

        return result

    }

    // La materia de esta correlatividad, cumple todos los requisitos?
    def goal4all( String c){
        
        // Variable que pregunta si puedo hacerlo o no.
        def knIcurse = true
        // Verifico si cumple todas las correlatividades
        def corr = 
            Correlatividad
            .getAll()
            .findAll{ it.criterio == c && it.materia == this.materia }

        corr
        .each{
            knIcurse = knIcurse && it.cumpleRequisito()
        }

        return knIcurse
    }

}

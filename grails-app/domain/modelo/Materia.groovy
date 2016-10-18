package modelo
import security.User
import estats.SessionManager

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
		tipo blank: false, nullable:false, inList: ["O","E"]
    }

    def getEstado(){
        
        def usuario = 
            SessionManager
            .getCurrentUser()
        
        def estadoMaterias = 
            usuario
            .estadoAcademico
            .estadoMaterias

        return estadoMaterias.find{ it.materia == this }.estado

    }

    def matchea(String s){

        def c = 
            Correlatividad
            .getAll()
            .findAll{ it.materia == this}

        if( c.size() == 0 ) return true
        
        return c.first().goal4all(s)
    }

    def knIcurse(){
        def s = this.getEstado()
        // def isntApr = ( s != "A" && s != "R" && s == "P")
    	// return this.matchea("C") && isntApr
        return this.matchea("C") 
    }

    def knIfinal(){
        def s = this.getEstado()
        // def isntApr = ( s != "A" && s == "R")
        // return this.matchea("F") && isntApr
        return this.matchea("C") 
    }

    // si me Regularizas ESTA!, dame el nodo siguiente, para cursar.
    def ifR_GetNodeS2C(){
        
        def materiasHabilitadas = 
            Correlatividad
            .getAll()
            .findAll{ 
                it.materiaCorrelativa == this &&
                it.requisito == "R"
            }
            .collect{ it.materia }

    }

    // si me aprobas ESTA!, dame el nodo siguiente, para cursar.
    def ifA_GetNodeS2C(){
        
        def materiasHabilitadas = 
            Correlatividad
            .getAll()
            .findAll{ 
                it.materiaCorrelativa == this &&
                it.requisito == "A"
             }
             // Elimino de la lista las materias que ya fueron habilitadas regularizando.
            .collect{ it.materia } - this.ifR_GetNodeS2C()
           
    }


}

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
		tipo blank: false, nullable:true, inList: ["O","E"]
    }

    def puedeCursar(){
    	return this.matchea("C")
    }

    def puedeFinal(){
    	return this.matchea("F")
    }

    def matchea(String param){
	
    	// Traemos el estado actual de materias....
    	def estMateriasAct = SessionManager.getCurrentUser().getEstadoAcademico().getEstadoMaterias()
        
        // Esto va a determinar si cursa o no...
    	def result = true
    	
    	// Traemos todas las correlativas con el criterio deseado, de la materia This.
    	def correlativas = Correlatividad.getAll().findAll{ it.materia == this && it.criterio == param }

    	// vemos si todas las condiciones correlativas, machean contra el estado actual.
    	correlativas.each{ corr ->	

    		// Si la materia del estado academico machea todas correlativas
    		def op = estMateriasAct.findAll{ em ->
		    	corr.materiaCorrelativa == em.materia && corr.requisito == em.estado
	    	}.size() > 0
   	
    		result = result && op   		
    			
			// movida para verificar resultado, nomas...
			if(!result) println(
				"Error. Queres Cursar: "
				+ corr.materia.nombre
				+ "Pero ..."
				+ corr.materiaCorrelativa.nombre 
				+ ": no cumple "
				+ corr.requisito
			)

	    } 

    	return result
    }
}

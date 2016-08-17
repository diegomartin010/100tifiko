package modelo

class Carrera {
	String nombre
	List materias = []
	List materiasObligatorias = []
	List materiasElectivas = []
	static hasMany = [
		materias: Materia,
		materiasObligatorias: Materia,
		materiasElectivas: Materia
	]
	
    static constraints = {
		nombre unique: true, blank: false
    }
	
	// Constructor nulo de la clase
	Carrera(String nombre , List materiasOblig , List materiasElect) {
		this()
		this.nombre = nombre
	
		// materias.each { nombreMateria->
		// 	this.addMateria(nombreMateria,"Obligatoria")
		// }

		this.addObligatorias(materiasOblig)
		this.addElectivas(materiasElect)
		

		// Mensajes
		println("Nueva Materia: "+this.nombre)
		materiasObligatorias.each { m->
			println("   obligatoria: "+m.nombre)
		}
		materiasElectivas.each { m->
			println("   electiva: "+m.nombre)
		}

	}

	// Agrega una materia a las listas de materias
	def addMateria(String nombreMateria, String tipo){
		
		// Verificamos primero si no esta cargada ya la materia.
		def materia = Materia.findByNombre(nombreMateria)
		
		if(materia == null){
				// Si no esta, la creamos y la agregamos.
				if(tipo == "Obligatorias"){
					this.materiasObligatorias.push(new Materia(nombreMateria, null).save())
				}
	
				if(tipo == "Electivas"){
					this.materiasElectivas.push(new Materia(nombreMateria, null).save());
				}

		}else{
				// Si la materia ya esta creada, solo la vinculamos
				if(tipo == "Obligatorias"){
					this.materiasObligatorias.push(materia)
				}
				if(tipo == "Electivas"){
					this.materiasObligatorias.push(materia)
				}
		}
	}

	// Agrega un conjunto de materias a la lista de materias obligatorias
	def addObligatorias(List materias){
		materias.each { nombreMateria->
			this.addMateria(nombreMateria,"Obligatorias")
		}
	}

	// Agrega un conjunto de materias a la lista de materias electivas
	def addElectivas(List materias){
		materias.each { nombreMateria->
			this.addMateria(nombreMateria,"Electivas")
		}
	}
	
}

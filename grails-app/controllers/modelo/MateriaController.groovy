package modelo

class MateriaController {


    def mostrarMateria(Integer id, Integer cid){
    	def m = Materia.get(id)
    	def c = Carrera.get(cid)
    	render(view:"/materia/mostrarMateria", model:[ materia: m , carrera: c])
    }

     /**
    * Renderiza la vista nuevaMateria, pasando como parametro
    * la carrera que se captura al recibir el id
    * @url localhost:8080/materia/editarMateria?id=1
    * @param id Integer debe pasarse por URL.
    */
    def editarMateria(Integer id, Integer cid){
    	render(
    		view:"/materia/editarMateria",
    		model:[ 
    			materia: Materia.get(id),
    			cid: cid
    		]
    	)	
    }
    
    def guardarMateria(){
    	
    	def m = Materia.findByCodigo(params.codigo)
    	println(m.nombre)
    	m.nombre = params.nombre
    	m.tipo =  params.tipo
    	m.nivel = params.nivel.toInteger()
    	m.save(flush:true)

    	render(true)

    }

    def nuevaMateria(){
    	
        def nm = new Materia(
            nombre: params.nombre
            ,codigo: params.codigoMateria
            ,tipo: params.tipo
            ,nivel: params.nivel.toInteger()
        ).save(flush:true)

        def c = Carrera.get( params.carreraId.toInteger() )
        c.materias += nm

        c.save(flush:true)

        render(true)

    }

    def eliminarMateria(){

        def c = Carrera.get( params.idCarrera.toInteger() )
        def m = Materia.get( params.idMateria.toInteger() )
        
        c.materias.removeAll{it == m}
        
        c.save(flush:true)
        m.delete(flush:true)

        render(true)
    }
}

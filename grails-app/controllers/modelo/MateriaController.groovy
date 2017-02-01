package modelo

class MateriaController {

    def index() { }

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

    def nuevaMateria(Integer id, Integer cid){
    	
    }
}

package modelo

class MateriaController {

    def index() { }

    def mostrarMateria(Integer id, Integer cid){
    	def m = Materia.get(id)
    	def c = Carrera.get(cid)
    	render(view:"/materia/mostrarMateria", model:[ materia: m , carrera: c])
    }
}

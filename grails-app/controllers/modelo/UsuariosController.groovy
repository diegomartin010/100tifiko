package modelo
import security.*

class UsuariosController {

    def index() { 
    	render(view:"usuariosList")
    }

    def createEdit(){
    }

    def editar(Integer uid){
    	def usuario = User.get(uid)
    	render(view:"usuariosAdminEdit", model:[ usuario:usuario ] )
    }

    def saveEdited(){
    	
    	println("saveEdited")

    	def id = params.id.toInteger()
    	def usuario = User.get(id)

    	usuario.setNombre(   params.nombre )
    	usuario.setApellido( params.apellido )
    	usuario.setUsername( params.username )
    	usuario.setEmail(    params.email )
    	usuario.setEnabled(  params.enabled.toBoolean( ) )
    	
  		// Guardamos el usuario modificado
		usuario.save(flush:true)

		render("hola")

    }
}

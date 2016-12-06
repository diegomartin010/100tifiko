package modelo
import security.*
import estats.*

class UsuariosController {

    def index() { 
    	render(view:"usuariosList")
    }

    def newUser(){
        render(view:"/usuarios/usuarioNuevo")
    }

    def recuperar(){
        render(view:"/usuarios/usuariosRecuperarContrasenia")
    }

    def saveNewUser(){
        try {
            def codigo = SessionManager.getCodigoActivacion() 
            def nu = new User([
                  nombre:  params.nombre
                , apellido: params.apellido
                , email: params.email
                , username: params.username
                , password: params.password
                , codigoActivacion: codigo
                , enabled: false
            ]).save(flush:true)  
           
            redirect(controller: "gestionCuentas", action: "activarUsuarioMail", params: [usuarioId : nu.id , codigoActivacion: codigo])

        }
        catch(Exception e) {
           
            render(contentType: 'text/json') {[
                  result: false
                , mensaje: "ERROR!.<br>El usuario no ha podido ser registrado.<br>Pruebe con otros datos, o intente nuevamente mas tarde."
            ]}  

        }
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

    // Resetear el password del usuario, pasando como parametro el email.
    def resetearPassword(){
        def username = params.username
        
        try {
            def u = User.findByUsername(username)   
            // Ejecutamos el controlador que reinicia la contraseña de usuario y manda el mail.
            redirect(
                  controller: "gestionCuentas"
                , action: "resetearPassword"
                , params: [
                      id : u.id
                ]
            )
        }
        catch(Exception e) {
            
            render(contentType: 'text/json') {[
                  result: false
                , mensaje: "ERROR!. No se ha podido resetear la contraseña. Verifique que el email ingresado, es correcto."
            ]}  

        }
    }

}
package security
import estats.*
class GestionCuentasController {

	def index() { 

	}
	
	// Envia un mail solicitando al usuario que haga click en un link para activar la cuenta.
	// http://localhost:8080/GestionCuentas/activarUsuarioMail?usuarioId=1&codigoActivacion=12454
    def activarUsuarioMail(Integer usuarioId , Integer codigoActivacion) { 
    	// Capturar la url de la aplicacion
    	// Puede devolver localhost:8080 o 100tifiko.net:8080 ...
    	def url = 
    		request
    		.getRequestURL()
    		.toString()
    		.split('/')
    	
    	def baseURL =
    		 "http://${url[2]}/GestionCuentas/activarUsuario?usuarioId=${usuarioId}&codigoActivacion=${codigoActivacion}"
    	
    	// Creamos los parametros que vamos a pasar a la vista del mail que se va a enviar.
    	def parametros = [
    		  usuario : User.get(usuarioId)
    		, codigo : codigoActivacion
    		, url : "${baseURL}"
    	]

    	// render("usuario ${parametros.usuario.nombre} ${parametros.codigo}")
    	println("Controlador mandar mails")
    	
    	// Mangamos el mail
    	sendMail {     
  			to "diegomartin010@gmail.com"
  			subject "100tifiko. Activacion de Cuenta"     
  			html g.render( template:"/mail/activarUsuario", model: [ parametros: parametros ] ) 
		}

		render("se ha enviado un mail a asd@gmail.com")

    }

 	
 	// Activa el usuario cuando hace click en el link. Se requiere un codigo de activacion.
    // http://localhost:8080/GestionCuentas/activarUsuario?usuarioId=1&codigoActivacion=12454
    def activarUsuario(Integer usuarioId , Integer codigoActivacion){
    	
    	def usuario = User.get(usuarioId)
    	def codigo = codigoActivacion

    	println("ActivarUsuario codigo Activacion ${codigoActivacion}")
    	if( (usuario.enabled == false) && (usuario.codigoActivacion==codigo) ){
    		usuario.enabled = true
    		usuario.save(flush:true)
    		render ("Se ha activado el usuario")
    	}else{
    		render("error")
    	}

    }

    // Reseteamos el password y enviamos un link al tipo, para que ingrese con la
    // contraseña reseteada y active la cuenta.
    def resetearPassword(){
    	
    	// Reseteamos el usuario.
    	def usuario = User.get(params.id)
    	usuario.password = usuario.username
    	usuario.enabled = false
    	usuario.codigoActivacion = SessionManager.getCodigoActivacion()
    	usuario.save(flush:true)
   		
   		// Puede devolver localhost:8080 o 100tifiko.net:8080 ...
    	def url = request.getRequestURL().toString().split('/')
    	def baseURL = "http://${url[2]}/GestionCuentas/activarUsuario?usuarioId=${params.id}&codigoActivacion=${usuario.codigoActivacion}"

    	// Creamos los parametros que vamos a pasar a la vista del mail que se va a enviar.
    	def parametros = [
    		usuario : usuario
    		, codigo: usuario.codigoActivacion
    		, url: "${baseURL}"
    	]

    	// se manda el mail
    	sendMail {     
  			to "${usuario.email}"
  			subject "100tifiko. Reinicio de Contraseña"     
  			html g.render( template:"/mail/resetearPassword", model: [ parametros: parametros ] ) 
		}

		render("se ha enviado un mail a asd@gmail.com")



    }
}

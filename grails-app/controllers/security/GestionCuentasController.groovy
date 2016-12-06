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
    	
        def u = User.get(usuarioId) 
    	// Creamos los parametros que vamos a pasar a la vista del mail que se va a enviar.
    	def parametros = [
    		  usuario : u
    		, codigo : codigoActivacion
    		, url : "${baseURL}"
    	]

    	// render("usuario ${parametros.usuario.nombre} ${parametros.codigo}")
    	println("Controlador mandar mails")
    	
    	// Mangamos el mail
    	sendMail {     
  			to "${u.email}"
  			subject "100tifiko. Activacion de Cuenta"     
  			html g.render( template:"/mail/activarUsuario", model: [ parametros: parametros ] ) 
		}

	    render(contentType: 'text/json') {[
              result: true
            , mensaje: "Usted se ha registrado satisfactoriament.<br>La cuenta esta momentaneamente bloqueada.<br>Se ha enviado un e-mail a ${u.email}."
        ]}

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
    		render (view:"/login/passwordReseted")
    	}else{
    		render("Error en Activacion de Usuario")
    	}

    }

    // Reseteamos el password y enviamos un link al tipo, para que ingrese con la
    // contraseña reseteada y active la cuenta.
    def resetearPassword(){
    	
    	// Capturamos el usuario, pasado como parametro el id.
    	def usuario = User.get(params.id)
        // Hacemos que la contraseña sea el username
    	usuario.password = usuario.username
        // Bloqueamos el usuario.
    	usuario.enabled = false
        // Seteamos un codigo de activacion
    	usuario.codigoActivacion = SessionManager.getCodigoActivacion()
        // Actualizamos el usuario.
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

    	// Mandamos el email.
    	sendMail {     
  			to "${usuario.email}"
  			subject "100tifiko. Reinicio de Contraseña"     
  			html g.render( template:"/mail/resetearPassword", model: [ parametros: parametros ] ) 
		}

		render(contentType: 'text/json') {[
              result: true
            , mensaje: "La contraseña ha sido reiniciada. Por seguridad se ha bloqueado la cuenta. Se ha enviado un mail al email del usuario."
        ]}  



    }
}

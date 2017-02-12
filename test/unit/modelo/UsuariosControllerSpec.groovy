package modelo

import grails.test.mixin.TestFor
import spock.lang.Specification
import security.*
import estats.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(UsuariosController)
@Mock([User])
class UsuariosControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
    }


    void "Prueba dar de alta nuevo usuario"() {
		
		given: "Se crea un nuevo usuario con datos correctos"
			def nu = new User([
                  nombre:  'prueba'
                , apellido: 'probando'
                , email: 'galeanomarting@gmail.com'
                , username: 'mudo'
                , password: 'mudo1234'
                , codigoActivacion: 1
                , enabled: false
            ])
							
		when: "Se intenta guardar el usuario en la base de datos"
			nu.save(flush: true)
			
		then: "Se comprueba la cantidad de usuarios guardados en la base de datos"
			User.count() == 1
	}

    void "Probar render vista de recuperar contraseña "() {

        when:"Se crea un nuevo usuario"
            populateValidParams(params)
            def usuario = new User(params).save(flush: true)
            controller.recuperar()

        then:"Se redirige a la vista de recuperar contraseña"
            view == '/usuarios/usuariosRecuperarContrasenia'
    }

}


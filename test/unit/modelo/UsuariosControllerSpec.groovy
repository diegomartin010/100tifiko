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


     void "Test the create action returns the correct model"() {

        when:"The create action is executed"
        populateValidParams(params)
            controller.saveNewUser()

        then:"The model is correctly created"
            
    }

    void "Prueba dar de alta nuevo usuario"() {
		
		given: "Se crea un nuevo usuario con datos incorrectos y ya existe un torneo"
			def nu = new User([
                  nombre:  'prueba'
                , apellido: 'probando'
                , email: 'galeanomarting@gmail.com'
                , username: 'mudo'
                , password: 'mudo1234'
                , codigoActivacion: 1
                , enabled: false
            ])
							
		when: "Se intenta guardar el equipo en la base de datos"
			nu.save(flush: true)
			
		then: "Se comprueba la cantidad de equipos guardados en la base de datos"
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

   


    void "Prueba error crear un usuario con credenciales erroneas"() {


        given:"Se crea mal al usuario"
            def nu = new User([
                      nombre: ''  
                    , apellido: ''
                    , email: 123
                    , username: ''
                    , password: ''
                    , codigoActivacion: ''
                    , enabled: false
                ])

        when:"Se intenta guardar"
            nu.save(flush: true)

        then:"Lanza una excepcion"            
            Exception e
    }
}


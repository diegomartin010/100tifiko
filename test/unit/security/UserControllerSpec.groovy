package security

import grails.test.GrailsUnitTestCase
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(UserController)
@Mock(User)
class UserControllerSpec extends Specification {

	  def populateValidParams(params) {
        assert params != null
    }
	void "Test metodo show() "(){

		when:"Show() con parametro null"
			controller.show(null)

		then:"Reponse 404"
			response.status == 404

	}

	void "Eliminar usuario"(){

		given:"Creo usuario"
			def nu = new User([
                  nombre:  'prueba'
                , apellido: 'probando'
                , email: 'galeanomarting@gmail.com'
                , username: 'mudo'
                , password: 'mudo1234'
                , codigoActivacion: 1
                , enabled: false
            ])

		when:"Guardo usuario"
			nu.save(flush:true)

		then: "Verifico cantidad de usuarios"
			User.count() == 1

		/*when: "Elimino usuario"
			controller.delete(nu)

		then: "Verifico cantidad de usuarios"
			User.count() == 0 */

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

	void "test an invalid request method"() {
        when:
        request.method = 'GET'
        controller.save()

        then:
        response.status == 405
    }


}
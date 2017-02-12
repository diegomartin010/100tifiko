package modelo

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(CarreraController)
@Mock([Carrera])
class CarreraControllerSpec extends Specification {


    void "vista editar carrera"() {

    	when: "llamo al metodo editarCarrera"
    		controller.editarCarrera()

    	then: "Se cambia a la vista de editar carrera "
    		view == "/carrera/editCarrera"
    }
}

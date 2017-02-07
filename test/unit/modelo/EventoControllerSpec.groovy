package modelo

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(EstadisticasController)
@Mock([Evento])
class EventoControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "prueba constraints"() {

    	when: "inicializo mal un evento"
    		def e = new Evento([
    			fecha:null
    		,	tipo:null
    		,	descripcion:null
    		,	activo:'noesboolean'])

    	then: "el campo activo no es boolean "
    		!e.validate()
    }
}

package modelo

import grails.test.GrailsUnitTestCase
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(AgendaController)
class AgendaControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void testIndex() {
        assert view == "/agenda"
        assert model.title == "ad"
    }
}

/*
@TestFor(SimpleController)
class SimpleControllerTests  {
    void testIndex() {
        controller.home()

        assert view == "/simple/homePage"
        assert model.title == "Hello World"
    }
} */
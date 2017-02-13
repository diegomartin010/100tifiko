import grails.test.mixin.TestFor
import grails.test.mixin.Mock
import spock.lang.Specification
import security.SessionController
@TestFor(UrlMappings)
@Mock(SessionController)
class UrlMappingsSpec extends Specification {

    void "test forward mappings"() {
        expect:
        assertForwardUrlMapping("/",controller:"session", action: 'index')
        //assertForwardUrlMapping("/nofunciona",controller:"",view:"/nofunciona")
    }
}
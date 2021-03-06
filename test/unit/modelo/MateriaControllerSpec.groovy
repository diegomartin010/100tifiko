package modelo

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(MateriaController)
@Mock([Materia,Carrera])
class MateriaControllerSpec extends Specification {


      void "Prueba crear una materia"() {
        
        given: "Se crea una nueva materia"
		
		def m = new Materia(
								nombre:"Algebra",
								codigo:"V2016BU1",
								nivel :1,
								tipo  :"O"
							)
                                    
        when: "Se intenta guardar la materia en la base de datos"
            m.save(flush: true)
            
        then: "Se comprueba la cantidad de materias guardadas en la base de datos"
            Materia.count() == 1
    }



    void "Prueba metodo mostrar materia"(){

        when: "Llamo al método mostrarMateria"
            controller.mostrarMateria()

        then: "Se verifica que el modelo exista"
        !model.materia

    }


}

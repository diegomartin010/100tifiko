package modelo

class CarreraController {

    def index() { }

    def nuevaCarrera(){
        try {
           def carreraJSON = request.JSON
            println(carreraJSON.nombre)

            def nombre    = carreraJSON.nombre + " (" + carreraJSON.plan + ")"
            def obligatorias  = carreraJSON.materiasObligatorias
            def electivas  = carreraJSON.materiasElectivas

            new Carrera(nombre, obligatorias, electivas).save(flush:true)

            render(contentType: 'text/json') {result = false}
        
        }catch(Exception e) {
            render(contentType: 'text/json') {result = true} 
        }

    }
}

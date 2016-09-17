package modelo

class CarreraController {

    def index() { }

    def nuevaCarrera(){
        try {
            // Captura del json
            def carreraJSON = request.JSON
            
            // Se crea la nueva carrera pero no se guarda.
            def nuevaCarrera = new Carrera(
                // K2016 -> sistemas plan 2016
                codigo: carreraJSON.codigo + carreraJSON.plan,
                nombre: carreraJSON.nombre
            )
            
            // Iteracion sobre las materias del json
            carreraJSON.materias.each { unaMat ->
                
                // Se lee del json y se crea 1x1 las materias. Se guarda.
                def nuevaMateria = new Materia(
                    nombre: unaMat.nombre,
                    tipo:   unaMat.tipo,
                    // K2016AM2 -> Analisis 2, sistemas, plan 2016.
                    codigo: nuevaCarrera.codigo + unaMat.codigo,
                    nivel:  unaMat.nivel
                ).save()
                
                // Se asignan las materias la carrera nueva.
                nuevaCarrera.materias.push(nuevaMateria)

            }

            // Guardamos la carrera.
            nuevaCarrera.save(flush:true)

            // El controlador devuelve el resultado de la operacion en json
            render(contentType: 'text/json') {result = false}
        
        }catch(Exception e) {
            // El controlador devuelve el resultado de la operacion en json
            render(contentType: 'text/json') {result = true} 
        }

    }
}

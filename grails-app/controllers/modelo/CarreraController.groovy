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
            carreraJSON.materias.each { m ->
                
                // Se lee del json y se crea 1x1 las materias. Se guarda.
                def nuevaMateria = new Materia(
                    nombre: m.nombre,
                    tipo:   m.tipo,
                    // K2016AM2 -> Analisis 2, sistemas, plan 2016.
                    codigo: nuevaCarrera.codigo + m.codigo,
                    nivel:  m.nivel
                ).save()

                // Se asignan las materias la carrera nueva.
                nuevaCarrera.materias.push(nuevaMateria)

            }

            def codigoCarrera = carreraJSON.codigo + carreraJSON.plan
            
            // Creamos y guardamos correlatividades
            carreraJSON.correlatividades.each { c ->
               
                def nuevaCorrelatividad = new Correlatividad(
                    // Se busca la materia en la db.
                    materia: Materia
                        .findByCodigo(codigoCarrera + c.codigoMateria)
                    , criterio: c.criterio
                    // Se busca la correlativa en la db.
                    , materiaCorrelativa: Materia.
                        findByCodigo(codigoCarrera + c.codigoCorrelativa)
                    , requisito: c.requisito
                ).save()

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


    def gestionCarreras(){
        def c = Carrera.findAll()
        render(view:'/carrera/carrerasList', model:[carreras:c] )
    }

    def verCarrera(Integer id){
        def c = Carrera.get(id)
        render(view:'/carrera/mostrarCarrera', model:[carrera:c] )
    }

}

package modelo
/**
* Maneja todo el tema relacionado con la creacion de carreras.
*/
class CarreraController {
      /**
    * Renderiza la pagina principal Actualmente no se usa.
    */
    def index(){
        render view:"index"
    }

      /**
    * Crea una nueva carrera en el sistema. Este metodo
    * esta hecho muy a lo negro.
    * @url localhost:8080/agenda/nuevaCarrera
    * @param JSON. Recibe un JSON.
    * @see Ver /web-app/js/carrera/manejoArchivos.js
    */
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
            if(carreraJSON.materias){
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
            }

            def codigoCarrera = carreraJSON.codigo + carreraJSON.plan
            
            // Guardamos la carrera.
            def nc = nuevaCarrera.save(flush:true)

            // Creamos y guardamos correlatividades
            if(carreraJSON.correlatividades){
                carreraJSON.correlatividades.each { c ->
                   
                    def nuevaCorrelatividad = new Correlatividad(
                       carreraId: nc.id
                        , carreraCodigo: nc.codigo
                        // Se busca la materia en la db.
                        , materia: Materia
                            .findByCodigo(codigoCarrera + c.codigoMateria)
                        , criterio: c.criterio
                        // Se busca la correlativa en la db.
                        , materiaCorrelativa: Materia.
                            findByCodigo(codigoCarrera + c.codigoCorrelativa)
                        , requisito: c.requisito
                    ).save()

                }
            }       

            // El controlador devuelve el resultado de la operacion en json
            render(contentType: 'text/json') {result = false}
        
        }catch(Exception e) {
            // El controlador devuelve el resultado de la operacion en json
            render(contentType: 'text/json') {result = true} 
        }

    }


    /**
    * devuelve todas las carreras del sistema.
    * Las renderiza en la vista carrerasList.gsp
    * @url localhost:8080/carrera/infomacionCarreras
    */
    def informacionCarreras(){
        def c = Carrera.findAll()
        render(view:'/carrera/carrerasList', model:[carreras:c] )
    }


    /**
    * Renderiza la vista mostrarCarrera, pasando como parametro
    * la carrera que se captura al recibir el id
    * @url localhost:8080/carrera/verCarrera?id='1'
    * @param id Integer debe pasarse por URL.
    */
    def verCarrera(Integer id){
        def c = Carrera.get(id)
        render(view:'/carrera/mostrarCarrera', model:[carrera:c] )
    }

     /**
    * Renderiza la vista editarCarrera, pasando como parametro
    * la carrera que se captura al recibir el id
    * @url localhost:8080/carrera/editarCarrera?id='1'
    * @param id Integer debe pasarse por URL.
    */
    def editarCarrera(Integer id){
        
        render(
            view: "/carrera/editCarrera",
            model:[
                carrera: Carrera.get(id)
            ]
        )
    }

    def guardarCarrera(){
        
        def c = Carrera.get(params.id)

        c.nombre = params.nombre
        c.activa = params.activa.toBoolean()
        c.save(flush:true)
        render(true)
    }

}

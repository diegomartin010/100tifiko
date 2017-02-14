ruleset {
    ToStringReturnsNull {
        name = "Retorno null de toString()"
        description = "Indica cuando el método 'toString()' retorna un valor null"
        priority = 3
    }

    MethodSize {
         maxLines = 150
         name = "Tamaño de los métodos"
         description = "La cantidad de líneas de los métodos no puede ser superior a 150"
         priority = 1
    }

    MethodCount{
        name = "Cantidad de métodos"
        description = "Cantidad de métodos permitidos en una clase (7)"
        maxMethods = 7
        priority = 1
    }

    ClassSize {
        name = "Tamaño de las clases"
        description = "La cantidad de líneas de los métodos no puede ser superior a 500"
        maxLines = 500
        priority = 1
    }

    DuplicateCaseStatement {
        name = "Declaración CASE duplicada "
        description = "Indica cuando hay duplicidad en la declaración de un CASE"
        priority = 2
    }

    EmptyClass {
        name = "Clase vacía"
        description = "Reporta clases sin métodos ni atributos"
        priority = 3
    }

    EmptyElseBlock {
        name = "Bloque ELSE vacío "
        description = "Indica cuando un bloque ELSE está vacío"
        priority = 1
    }

    UnusedImport {
        name = "Imports no usados"
        description = "Reporta los imports que no son utilizados - Esta regla solo es aplicable a EstadisticasController.groovy"
        applyToFileNames = "EstadisticasController.groovy"
        priority = 2
    }

    VariableName {
        name = "Nombre de las variables"
        description = "El nombre de la variable debe ser de la forma: [a-z][a-zA-Z0-9]* "
        regex = "[a-z][a-zA-Z0-9]*"
        priority = 1
    }

    CyclomaticComplexity {
        name = "Complejidad Ciclomática"
        description = "Proporciona una medición cuantitativa de la complejidad lógica de un método"
        maxMethodComplexity = 3
        ignoreMethodNames="eventosProximos"
        priority = 1
    }

    NestedBlockDepth {
        name = "Cantidad de bloques anidados"
        description = "La cantidad de bloques anidados permitidos no debe ser superior a 3"
        maxNestedBlockDepth=3
        priority = 3
    }

    ParameterCount {
        name = "Cantidad de parámetros"
        description = "Verifica que la cantidad de parámetros que recibe un método no sea superior a 3"
        maxParameters = 3
        priority = 2
    }

    AbcMetric{
        name = "Métrica ABC"
        description = "Verifica la métrica ABC "
        priority = 3
    }

    UnnecessaryBooleanExpression {
        name = "Expresión booleana innecesaria"
        description = "Verifica que no haya expresiones booleanas innecesarias "
        priority = 2
    }

    UnusedMethodParameter {
        name = "Parámetros no usados"
        description = "Mide la cantidad de parámetros no usados en los métodos.Esta regla no incluye al parámetro PARAM"
        ignoreRegex = 'param'
        priority = 1
    }

    UnusedVariable {
        name = "Variable no usada"
        description = "Verifica que no haya variables sin usar. Esta regla excluye a las variables 'cursables' y 'materiasHabilitadas"
        ignoreVariableNames = 'cursables,materiasHabilitadas'
        priority = 1
    }

    GrailsDuplicateConstraint {
        name = "Constraints duplicados"
        description = "Verifica que no haya constraints duplicados"
        priority = 1
    }

    BracesForIfElse {
        name = "Llaves del IF"
        description = "Verifica que las llaves del IF se encuentren en la misma linea.Al igual que el else y la llave que abre"
        sameLine = true 
        elseOnSameLineAsClosingBrace = true
        elseOnSameLineAsOpeningBrace = true
        priority = 1
    }

    LineLength {
        name = "Longitud de línea"
        description = "Verifica que la línea no sea mayor a 130 caracteres. Esta regla excluye a los imports"
        length = 130
        ignoreImportStatements = true
    }

    SpaceAfterOpeningBrace{
        name = "Espacio luego de una llave que abre"
        description = "Verifica que haya un espacio luego de una llave que abre"
    }
}
import modelo.*
import security.*


class BootStrap {
    def init = { servletContext ->
		
		// Hardcodeando roles
      	def admin = new Role('ROLE_ADMINISTRADOR').save()
      	def alumno = new Role('ROLE_ALUMNO').save()	
	
      	// Hardcodeando usuarios
		def user = 
			new User(
				  nombre: "Matias"
				, apellido: "Rios"
				, email: "diegomartin010@gmail.com"
				, username: "mrios"
				, password: "mrios1"
			).save() 
		
		new UserRole(	
			user,
			alumno
		).save()

		new UserRole(	
			new User(
				  nombre: "Diego Martin"
				, apellido: "Colussi"
				, email: "diegomartin010@gmail.com"
				, username: "dcol"
				, password: "dcol1"
			).save() 
			, alumno
		).save()

		new UserRole(	
			new User(
				  nombre: "Antonio"
				, apellido: "Moretti"
				, email: "diegomartin010@gmail.com"
				, username: "admin"
				, password: "admin"
			).save() 
			, admin
		).save()

		// Se crea una carrera hardcode
		def nuevaCarrera = new Carrera(
		  	nombre: "Contador",
			codigo: "V2016",
			fechaInicio: Date.parse("dd/MM/yyyy", '10/02/2014'),
			materias: [
				
				new Materia(
					nombre:"Evasion Impositiva",
					codigo:"V2016BU1",
					nivel :1,
					tipo  :"O"
				).save(),
				
				new Materia(
					nombre:"Intr. al lavado de dinero",
					codigo:"V2016ML1",
					nivel :1,
					tipo  :"O"
				).save(),

				, new Materia(
					nombre:"Malversacion de fondos",
					codigo:"V2016BU2",
					nivel :2,
					tipo  :"O"
				).save()

				, new Materia(
					nombre:"Corrupcion en cargos publicos",
					codigo:"V2016BU3",
					nivel :3,
					tipo  :"O"
				).save()

				, new Materia(
					nombre:"bullingElectivo",
					codigo:"V2016BU3",
					nivel :2,
					tipo  :"E"
				).save()
			]
		).save()

		// Seteamos un estado academico a mrios
		user.setEstadoAcademico(
            new EstadoAcademico (
                  legajo  : 9158
                , carrera : nuevaCarrera
            ).save()
        )
		user.save()

		// println("lista de materias: ${nuevaCarrera.materias}")
		nuevaCarrera.materias.findAll{ it != null }.findAll{ it.tipo == "O" }.each{ unaMateria->   

			user.estadoAcademico.estadoMaterias.push(
				new EstadoMateria(
					estadoAcademico: user.estadoAcademico ,
					materia: unaMateria ,
					estado: "P"
				).save()
			)
			
		}

		// nuevaCarrera.materias.each{
		// 	println("Materias: ${it}")
		// }
		user.save(flush:true)

		

		// Correlatividades hardcode
		// Para cursar bulling 2 tengo que tener regular bulling 1.
		new Correlatividad(
			  criterio: "C"
			, materia:             Materia.findByCodigo("V2016BU2")
			, materiaCorrelativa:  Materia.findByCodigo("V2016BU1")
			, requisito: "R"
			// Basicamente
			, carreraId: 1
           	, carreraCodigo: "C2016"
		).save()

		new Correlatividad(
			  criterio: "C"
			, materia:             Materia.findByCodigo("V2016BU2")
			, materiaCorrelativa:  Materia.findByCodigo("V2016ML1")
			, requisito: "R"
			// Basicamente
			, carreraId: 1
           	, carreraCodigo: "C2016"
		).save()
		
		// Para cursar bulling 3 tengo que tener aprobada bulling 1
		new Correlatividad(
			  criterio: "C"
			, materia: 			   Materia.findByCodigo("V2016BU3")
			, materiaCorrelativa:  Materia.findByCodigo("V2016BU1")
			, requisito:"A"
			// Basicamente
			, carreraId: 1
           	, carreraCodigo: "C2016"
		).save()
		
		// ... y regular bulling 2.
		new Correlatividad(
			  criterio: "C"
			, materia: 			 Materia.findByCodigo("V2016BU3")
			, materiaCorrelativa:  Materia.findByCodigo("V2016BU2")
			, requisito:"R"
			// Basicamente
			, carreraId: 1
           	, carreraCodigo: "C2016"
		).save()

		// para final bulling 2.
		new Correlatividad(
			  criterio: "F"
			, materia: 			 Materia.findByCodigo("V2016BU2")
			, materiaCorrelativa:  Materia.findByCodigo("V2016BU1")
			, requisito:"A"
			// Basicamente
			, carreraId: 1
           	, carreraCodigo: "C2016"
		).save()

		// para final bulling 3.
		new Correlatividad(
			  criterio: "F"
			, materia: 			 Materia.findByCodigo("V2016BU3")
			, materiaCorrelativa:  Materia.findByCodigo("V2016BU2")
			, requisito:"A"
			// Basicamente
			, carreraId: 1
           	, carreraCodigo: "C2016"
		).save()

	   
    }
    def destroy = {
    }
}

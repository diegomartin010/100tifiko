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
		  	nombre: "Carrera BootStrap",
			codigo: "C2016",
			materias: [
				
				new Materia(
					nombre:"Algebra",
					codigo:"V2016BU1",
					nivel :1,
					tipo  :"O"
				).save(),
				
				new Materia(
					nombre:"Discreta",
					codigo:"V2016ML1",
					nivel :1,
					tipo  :"O"
				).save(),

				, new Materia(
					nombre:"Sintaxis",
					codigo:"V2016BU2",
					nivel :2,
					tipo  :"O"
				).save()

				, new Materia(
					nombre:"Gestion de datos (No se cursa)",
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
		).save()

		new Correlatividad(
			  criterio: "C"
			, materia:             Materia.findByCodigo("V2016BU2")
			, materiaCorrelativa:  Materia.findByCodigo("V2016ML1")
			, requisito: "R"
		).save()
		
		// Para cursar bulling 3 tengo que tener aprobada bulling 1
		new Correlatividad(
			  criterio: "C"
			, materia: 			   Materia.findByCodigo("V2016BU3")
			, materiaCorrelativa:  Materia.findByCodigo("V2016BU1")
			, requisito:"A"
		).save()
		
		// ... y regular bulling 2.
		new Correlatividad(
			  criterio: "C"
			, materia: 			 Materia.findByCodigo("V2016BU3")
			, materiaCorrelativa:  Materia.findByCodigo("V2016BU2")
			, requisito:"R"
		).save()

		// para final bulling 2.
		new Correlatividad(
			  criterio: "F"
			, materia: 			 Materia.findByCodigo("V2016BU2")
			, materiaCorrelativa:  Materia.findByCodigo("V2016BU1")
			, requisito:"A"
		).save()

		// para final bulling 3.
		new Correlatividad(
			  criterio: "F"
			, materia: 			 Materia.findByCodigo("V2016BU3")
			, materiaCorrelativa:  Materia.findByCodigo("V2016BU2")
			, requisito:"A"
		).save()

	   
    }
    def destroy = {
    }
}

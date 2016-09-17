import modelo.Carrera
import modelo.Correlatividad
import modelo.Materia
import security.Role
import security.User
import security.UserRole

class BootStrap {
    def init = { servletContext ->
		
		// Hardcodeando roles
      	def admin = new Role('ROLE_ADMINISTRADOR').save()
      	def alumno = new Role('ROLE_ALUMNO').save()	
	
      	// Hardcodeando usuarios
		new UserRole(	
			new User(
				  nombre: "Matias"
				, apellido: "Rios"
				, email: "mrios@hotmail.com"
				, username: "mrios"
				, password: "mrios1"
			).save() 
			, alumno
		).save()

		new UserRole(	
			new User(
				  nombre: "Diego Martin"
				, apellido: "Colussi"
				, email: "dcol@hotmail.com"
				, username: "dcol"
				, password: "dcol1"
			).save() 
			, alumno
		).save()


		// Se crea una carrera hardcode
		new Carrera(
		  	nombre: "CarreraVillera0",
			codigo: "C2016",
			materias: [
				
				new Materia(
					nombre:"Bulling1",
					codigo:"V2016BU1",
					nivel :5,
					tipo  :"O"
				).save()

				, new Materia(
					nombre:"Bulling2",
					codigo:"V2016BU2",
					nivel :5,
					tipo  :"O"
				).save()

				, new Materia(
					nombre:"Bulling3",
					codigo:"V2016BU3",
					nivel :5,
					tipo  :"O"
				).save()
			]
		).save()

		// Correlatividades hardcode
		// Para cursar Bulling 2 tengo que tener regular bulling 1.
		new Correlatividad(
			  criterio: "C"
			, materia:             Materia.findByCodigo("V2016BU2")
			, materiaCorrelativa:  Materia.findByCodigo("V2016BU1")
			, requisito: "R"
		).save()

		// Para cursar Bulling 3 tengo que tener aprobada bulling 1
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

	   
    }
    def destroy = {
    }
}

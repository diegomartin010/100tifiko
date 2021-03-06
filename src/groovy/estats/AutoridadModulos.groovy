package estats

// import java.security.Security;

// import org.springframework.security.core.context.SecurityContextHolder;
// import org.springframework.security.core.userdetails.UserDetails

import security.User;
// import grails.plugin.springsecurity.SpringSecurityService;
import modelo.Examen;
import modelo.Materia;
import estats.SessionManager;

class AutoridadModulos {

	static def getFeatures(){
		[
			[
				modulo: "index"
				, titulo: "Inicio"
				, permisos:["ROLE_ALUMNO","ROLE_ADMINISTRADOR"]
				, url:"/"
				, icono:"fa fa-home fa-fw"
				, target:""
			]
			, [
				modulo: "carrera"
				, titulo: "Mi Carrera"
				// , permisos:["ROLE_ALUMNO","ROLE_ADMINISTRADOR"]
				, permisos:["ROLE_ALUMNO"]
				, url: "/estadoAcademico"
				, icono:"fa fa-road fa-fw"
				, target:""
			]
			, [
				modulo: "estadoAcademico"
				, titulo: "Estado Académico"
				// , permisos:["ROLE_ALUMNO","ROLE_ADMINISTRADOR"]
				, permisos:["ROLE_ALUMNO"]
				, url: "/estadoAcademico/verEstado"
				, icono:"fa fa-thumbs-o-up fa-fw"
				, target:""
			]
			, [
				modulo: "estadisticas"
				, titulo: "Estadísticas"
				// , permisos:["ROLE_ALUMNO","ROLE_ADMINISTRADOR"]
				, permisos:["ROLE_ALUMNO"]
				, url:"/estadisticas"
				, icono:"fa fa-bar-chart-o fa-fw"
				, target:""
			]
			, [
				modulo: "examenes"
				, titulo: "Exámenes"
				// , permisos:["ROLE_ALUMNO","ROLE_ADMINISTRADOR"]
				, permisos:["ROLE_ALUMNO"]
				, url:"/examen"
				, icono:"fa fa-edit fa-fw"
				, target:""
			]
			, [
				modulo: "agenda"
				, titulo: "Agenda"
				// , permisos:["ROLE_ALUMNO","ROLE_ADMINISTRADOR"]
				, permisos:["ROLE_ALUMNO"]
				, url: "/agenda"
				, icono:"fa fa-calendar"
				, target:""
			]
			// , [
			// 	modulo: "simulacion"
			// 	, titulo: "Eventos y Alarmas"
			// 	// , permisos: ["ROLE_ALUMNO","ROLE_ADMINISTRADOR"]
			// 	, permisos: ["ROLE_ALUMNO"]
			// 	, url: "/simulacion"
			// 	, icono:"fa fa-volume-up"
			// 	, target:""
			// ]
			, [
				modulo: "simulacion"
				, titulo: "Correlatividades"
				// , permisos: ["ROLE_ALUMNO","ROLE_ADMINISTRADOR"]
				, permisos: ["ROLE_ALUMNO"]
				, url: "/simulacion/grafo"
				, icono:"fa fa-share-alt fa-fw"
				, target:"_blank"
			]
			, [
				modulo: "usuarios"
				, titulo: "Usuarios"
				// , permisos:["ROLE_ALUMNO","ROLE_ADMINISTRADOR"]
				, permisos: ["ROLE_ADMINISTRADOR"]
				, url: "/usuarios"
				, icono:"fa fa-users fa-fw"
				, target:""
			]
			
			, [
				modulo: "informacionCarreras"
				, titulo: "Información de Carreras"
				, permisos:["ROLE_ALUMNO","ROLE_ADMINISTRADOR"]
				, url: "/carrera/informacionCarreras"
				, icono:"fa fa-university"
				, target:""
			]
			, [
				modulo: "nuevaCarrera"
				, titulo: "Carreras Del Sistema"
				// , permisos:["ROLE_ALUMNO","ROLE_ADMINISTRADOR"]
				, permisos: ["ROLE_ADMINISTRADOR"]
				, url: "/carrera"
				, icono:"fa fa-book fa-fw"
				, target:""
			]
			, [
				modulo: "tutoriales"
				, titulo: "Tutoriales"
				, permisos:["ROLE_ALUMNO","ROLE_ADMINISTRADOR"]
				, url: "/session/renderTutorials"
				, icono:"fa fa-question-circle "
				, target:""
			]
		]

	}

	static def getByAuth(){
		getFeatures().findAll{
			SessionManager
			.getCurrentUserRoles()
			.intersect(it.permisos)
			.size() > 0
		}
	}

	static def getByName(String mod){
		getFeatures().find{ it.modulo == mod}
	}


}

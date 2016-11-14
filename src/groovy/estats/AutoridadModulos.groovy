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
				, titulo: "Index"
				, permisos:null
				, url:"/"
				, icono:"fa fa-home fa-fw"
			]
			, [
				modulo: "carrera"
				, titulo: "Mi Carrera"
				, permisos:null
				, url: "/estadoAcademico"
				, icono:"fa fa-road fa-fw"
			]
			, [
				modulo: "estadoAcademico"
				, titulo: "Estado Academico"
				, permisos:null
				, url: "/estadoAcademico/verEstado"
				, icono:"fa fa-thumbs-o-up fa-fw"
			]
			, [
				modulo: "estadisticas"
				, titulo: "Estadisticas"
				, permisos:null
				, url:"/estadisticas"
				, icono:"fa fa-bar-chart-o fa-fw"
			]
			, [
				modulo: "examenes"
				, titulo: "Examenes"
				, permisos:null
				, url:"/examen"
				, icono:"fa fa-edit fa-fw"
			]
			, [
				modulo: "agenda"
				, titulo: "Agenda"
				, permisos:null
				, url: "/agenda"
				, icono:"fa fa-calendar"
			]
			, [
				modulo: "simulacion"
				, titulo: "Simulacion"
				, permisos: null
				, url: "/simulacion"
				, icono:"fa fa-plane fa-fw"
			]
			, [
				modulo: "administrarCarreras"
				, titulo: "Administrar Carreras"
				, permisos:null
				, url: "/carrera"
				, icono:"fa fa-book fa-fw"
			]
		]

	}

	static def getByAuth(){
		getFeatures()
	}

	static def getByName(String mod){
		getFeatures().find{ it.modulo == mod}
	}


}

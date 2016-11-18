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
				, target:""
			]
			, [
				modulo: "carrera"
				, titulo: "Mi Carrera"
				, permisos:null
				, url: "/estadoAcademico"
				, icono:"fa fa-road fa-fw"
				, target:""
			]
			, [
				modulo: "estadoAcademico"
				, titulo: "Estado Academico"
				, permisos:null
				, url: "/estadoAcademico/verEstado"
				, icono:"fa fa-thumbs-o-up fa-fw"
				, target:""
			]
			, [
				modulo: "estadisticas"
				, titulo: "Estadisticas"
				, permisos:null
				, url:"/estadisticas"
				, icono:"fa fa-bar-chart-o fa-fw"
				, target:""
			]
			, [
				modulo: "examenes"
				, titulo: "Examenes"
				, permisos:null
				, url:"/examen"
				, icono:"fa fa-edit fa-fw"
				, target:""
			]
			, [
				modulo: "agenda"
				, titulo: "Agenda"
				, permisos:null
				, url: "/agenda"
				, icono:"fa fa-calendar"
				, target:""
			]
			, [
				modulo: "simulacion"
				, titulo: "Simulacion"
				, permisos: null
				, url: "/simulacion"
				, icono:"fa fa-plane fa-fw"
				, target:""
			]
			, [
				modulo: "simulacion"
				, titulo: "Correlatividades"
				, permisos: null
				, url: "/simulacion/grafo"
				, icono:"fa fa-share-alt fa-fw"
				, target:"_blank"
			]
			, [
				modulo: ""
				, titulo: "Usuarios"
				, permisos:null
				, url: "/usuarios"
				, icono:"fa fa-users fa-fw"
				, target:""
			]
			, [
				modulo: "administrarCarreras"
				, titulo: "Administrar Carreras"
				, permisos:null
				, url: "/carrera"
				, icono:"fa fa-book fa-fw"
				, target:""
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

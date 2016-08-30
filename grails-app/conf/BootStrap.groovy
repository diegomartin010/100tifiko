import modelo.Carrera
import security.Role
import security.User
import security.UserRole

class BootStrap {
    def init = { servletContext ->
		
      def admin = new Role('ROLE_ADMINISTRADOR').save()
      def alumno = new Role('ROLE_ALUMNO').save()	
	 
	   def usuario = new User('mrios', 'mrios1')
	   def usuario2 = new User('dcol', 'dcol1')
	   // def usuario3 = new User('usuario', 'usuario123')
	  
	  //def userrole = new UserRole(usuario,alumno)
	  
	  usuario.save()
	  usuario2.save()
	  
	  new UserRole(usuario,alumno).save()
	  new UserRole(usuario2,alumno).save()
	  // new UserRole(usuario3,alumno).save()
	  
	  // movida carreras
	  // new Carrera("Sistemas",['am1','am2','ms'], ['metodos','estadistica']).save()
	  // new Carrera("Quimica",['am1','quim','mei'], null).save()
	  // new Carrera("Ingenieria en sistemas de informacion 2008", ['am1','quim','mei'], null).save()
	  
	   
    }
    def destroy = {
    }
}

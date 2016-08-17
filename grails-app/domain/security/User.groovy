package security

import modelo.EstadoAcademico

class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService
	
	
	EstadoAcademico estadoAcademico
	String nombre
	String apellido
	String email
	String username
	String password
	
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
		
	User(String username, String password) {
		this()
		this.username = username
		this.password = password
		this.nombre = "Matias"
		this.apellido = "Rios"
		this.email = "m@hotmail.com"
		this.estadoAcademico = new EstadoAcademico().save();

	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof User && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		estadoAcademico nullable: true
	}

	static mapping = {
		password column: '`password`'
	}
}

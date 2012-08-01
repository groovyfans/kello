class User {
	static mapping = {
		table 'k_user'
		authorities key:'authority_id', column:'people_id', joinTable:'k_user_role'
	}

	static transients = ['password', 'passwordConfirm']
	static hasMany = [authorities: Role]
	static belongsTo = Role

	/** Username */
	String username
	/** User Real Name*/
	String userRealName
	/** MD5 Password */
	String passwd
	/** enabled */
	boolean enabled = true

	String email
	boolean emailShow = true

	/** description */
	String description = ''

	/** plain password to create a MD5 password */
	String password = ''
	String passwordConfirm = ''

	static constraints = {
		username(blank: false, unique: true)
		userRealName(blank: false)
		passwd(blank: false)
		enabled()
	}

	String toString() {
		username
	}
}

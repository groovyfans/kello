class Role {
	static mapping = {
		table 'k_role'
		people key:'people_id', column:'authority_id', joinTable:'k_user_role'
	}

	static hasMany = [people: User]

	/** description */
	String description
	/** ROLE String */
	String authority = 'ROLE_'

	static constraints = {
		authority(blank: false)
		description()
	}

	String toString() {
		authority
	}
}

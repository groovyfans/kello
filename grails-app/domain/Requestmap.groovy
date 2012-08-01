class Requestmap {
	static mapping = {
		table 'k_requestmap'
	}

	String url
	String configAttribute

	static constraints = {
		url(blank: false, unique: true)
		configAttribute(blank: false)
	}
}

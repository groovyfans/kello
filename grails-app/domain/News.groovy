class News {
	static mapping = {
		table 'k_news'
	}

	static constraints = {
		title(blank : false, unique : true)
		content(blank : true)
	}
	def beforeInsert = {
		createDate = new Date()
		lastModifiedDate = new Date()
	}

	def beforeUpdate = {
		lastModifiedDate = new Date()
	}

	String title
	String content
	boolean isNew
	Date createdDate
	String createdByUserLogin
	Date lastModifiedDate
	String lastModifiedByUserLogin
}

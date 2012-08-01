class ProductCategory {
	static mapping = {
		table 'k_category'
	}

	static hasMany = [products : Product]
	static constraints = {
		name(blank : false, unique : true)
		description(nullable : true, maxSize : 255)
		imageUrl(nullable : true, maxSize : 255, validator : {
			return it ? (it.endsWith('.gif') || it.endsWith('.GIF') || it.endsWith('.jpg') || it.endsWith('.JPG')) : true
		})
	}

	def beforeInsert = {
		createdDate = new Date()
		lastModifiedDate = new Date()
	}

	def beforeUpdate = {
		lastModifiedDate = new Date()
	}

	String name
	String nameEn
	String description
	String descriptionEn
	String imageUrl
	Date createdDate = new Date()
	Date lastModifiedDate = new Date()

	String toString() {
		name
	}
}

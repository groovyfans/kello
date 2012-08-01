class Product {
	static mapping = {
		table 'k_product'
	}

	static belongsTo = [category : ProductCategory]
	static constraints = {
		model(blank : false, unique : true)
		name(blank : false)
		nameEn(blank : false)
		description(nullable : true, maxSize : 1000)
		descriptionEn(nullable : true, maxSize : 1000)
		sequence(range:0..99)
		function(nullable : true)
		functionEn(nullable : true)
		functionImageUrl(nullable : true, maxSize : 255, validator : {
			return it ? (it.endsWith('.gif') || it.endsWith('.GIF') || it.endsWith('.jpg') || it.endsWith('.JPG')) : true
		})
		specification(nullable : true)
		specificationEn(nullable : true)
		specificationImageUrl(nullable : true, maxSize : 255, validator : {
			return it ? (it.endsWith('.gif') || it.endsWith('.GIF') || it.endsWith('.jpg') || it.endsWith('.JPG')) : true
		})
		packaging(nullable : true)
		packagingEn(nullable : true)
		packagingImageUrl(nullable : true, maxSize : 255, validator : {
			return it ? (it.endsWith('.gif') || it.endsWith('.GIF') || it.endsWith('.jpg') || it.endsWith('.JPG')) : true
		})
		accessories(nullable : true)
		accessoriesEn(nullable : true)
		accessoriesImageUrl(nullable : true, maxSize : 255, validator : {
			return it ? (it.endsWith('.gif') || it.endsWith('.GIF') || it.endsWith('.jpg') || it.endsWith('.JPG')) : true
		})
		certificates(nullable : true)
		certificatesEn(nullable : true)
		certificatesImageUrl(nullable : true, maxSize : 255, validator : {
			return it ? (it.endsWith('.gif') || it.endsWith('.GIF') || it.endsWith('.jpg') || it.endsWith('.JPG')) : true
		})
		smallImageUrl(nullable : true, maxSize : 255, validator : {
			return it ? (it.endsWith('.gif') || it.endsWith('.GIF') || it.endsWith('.jpg') || it.endsWith('.JPG')) : true
		})
		largeImageUrl(nullable : true, maxSize : 255, validator : {
			return it ? (it.endsWith('.gif') || it.endsWith('.GIF') || it.endsWith('.jpg') || it.endsWith('.JPG')) : true
		})
		detailImageUrl(nullable : true, maxSize : 255, validator : {
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

	String model
	String name
	String nameEn
	String description
	String descriptionEn
	boolean isNew
	int sequence = 99
	String function
	String functionEn
	String functionImageUrl
	String specification
	String specificationEn
	String specificationImageUrl
	String packaging
	String packagingEn
	String packagingImageUrl
	String accessories
	String accessoriesEn
	String accessoriesImageUrl
	String certificates
	String certificatesEn
	String certificatesImageUrl

	String smallImageUrl
	String largeImageUrl
	String detailImageUrl

	Date createdDate = new Date()
	String createdByUserLogin
	Date lastModifiedDate = new Date()
	String lastModifiedByUserLogin

	String toString() {
		name
	}
}

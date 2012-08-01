class Attachment {
	static mapping = {
		table 'k_attachment'
	}

	static constraints = {
		fileName(blank : false, unique : true)
		contentType(inList:["image/gif", "image/pjpeg"])
	}

	String fileName
	String fileSize
	String contentType
	Date createdDate
	String author

	def beforeInsert = {
		createdDate = new Date()
	}

	String toString() {
		fileName
	}
}

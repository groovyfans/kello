class GuestBook {
	static mapping = {
		table 'k_guestbook'
	}

	static constraints = {
		author(blank : false, maxSize : 255)
		address(blank : false, maxSize : 255)
		companyName(blank : false, maxSize : 255)
		companyAddress(blank : false, maxSize : 255)
		telephone(blank : false, maxSize : 50)
		email(blank : false, maxSize : 100)
		content(blank : false)
	}

	String author
	String address
	String companyName
	String companyAddress
	String postalCode
	String telephone
	String fax
	String email
	String content
	String status
	Date createdDate

	def beforeInsert = {
		createDate = new Date()
	}

}

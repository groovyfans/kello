class Order {
	static mapping = {
		table 'k_order'
	}

	static constraints = {
		productName(blank : false, maxSize : 255)
		quantity(blank : false)
		companyName(blank : false, maxSize : 255)
		address(nullable : true, maxSize : 255)
		telephone(blank : false, maxSize : 50)
		fax(nullable : true, maxSize : 50)
		email(blank : false, maxSize : 100)
		customer(blank : false, maxSize : 255)
		orderDate(nullable : true)
		entryDate(nullable : true)
		handleUser(nullable : true)
	}

	def beforeInsert = {
		createDate = new Date()
	}

	String productName
	Double quantity
	String companyName
	String address
	String postalCode
	String telephone
	String fax
	String email
	String customer
	String status = "NEW"
	Date orderDate
	Date entryDate
	String handleUser
}

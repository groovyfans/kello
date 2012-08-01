class HomeController {

    def index = { 
		if(!params.max) params.max = 12
        // Category 1: self power product
        def category = null
        def categoryList = ProductCategory.list(max:1)
        if (categoryList) {
            category = categoryList.get(0)
        }
		def productList = null
        def otherProductList = null
		params.sort = "sequence"
		params.order = "asc"
        productList = Product.findAllByCategory(category, params )
        otherProductList = Product.findAllByCategoryNot(category, params )
        if (otherProductList.size() > 6) {
            otherProductList = otherProductList[0..5]
        }
		[ category: category, productList:  productList, otherProductList: otherProductList ]
	}
}

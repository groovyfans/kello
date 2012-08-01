class ProductsController {

    
	def index = {
	    if(!params.max) params.max = 12
		params.sort = "sequence"
		params.order = "asc"
		def category = null
		def categoryList = ProductCategory.list()
		def productList = null
		def totalProductCount = null
		if (params.c) {
			category = ProductCategory.get(params.c)
			productList = Product.findAllByCategory(category, params )
            totalProductCount = Product.countByCategory(category)
		}
		else {
            productList = Product.list( params )
            totalProductCount = Product.count()
        }
        [ productList:  productList, totalProductCount: totalProductCount, category: category]
    }

    def view = {
        def product = Product.findByModel( params.id )
        if(!product) {
            flash.message = "product.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Product not found with id ${params.id}"
            redirect(action:index)
        }
        else { 
			def c = Product.createCriteria()
			def others = c.list {
				eq("category", product.category)
				ne("model", params.id)
				maxResults(8)
				order("lastModifiedDate", "desc")
			}
			return [ product: product, otherProducts: others] 
		}
    }
}

class NewsController {

    def index = {
        if(!params.max) params.max = 10
        if(!params.sort) params.sort = "lastModifiedDate"
        if(!params.order) params.order = "desc"
        [ news: News.list( params ) ]
    }

    def view = {
        def news = News.get( params.id )

        if(!news) {
            flash.message = "news.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "News not found with id ${params.id}"
            redirect(action:notfound)
        }
        else { return [ news : news ] }
    }

	def notfound = {

	}
}
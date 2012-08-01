class UrlMappings {
    static mappings = {
		"/home"(controller: 'home', action: 'index')
		"/company"(controller: 'company', action: 'index')
		"/products"(controller: 'products', action: 'index')
		"/products/$id"(controller: 'products', action: 'view')
		"/news"(controller: 'news', action: 'index')
		"/news/$id"(controller: 'news', action: 'view')
		"/order"(controller: 'order', action: 'add')
		"/contact"(controller: 'contact', action: 'index')
		"/jcaptcha/$action?"(controller: 'jcaptcha')
		"/login/$action?"(controller: 'login')
		"/logout/$action?"(controller: 'logout')
		"/admin/$action?/$id?"(controller: 'admin')

		"/$controller/$action?/$id?"{
		  constraints {
			 // apply constraints here
		  }
		}

		//"/"(controller:'home')

		"500"(view:'/error')
	}
}

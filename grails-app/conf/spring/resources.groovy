// Place your Spring DSL code here
beans = {
    commonsMultipartResolver(org.springframework.web.multipart.commons.CommonsMultipartResolver) {
		maxUploadSize = 20480000
	}
}
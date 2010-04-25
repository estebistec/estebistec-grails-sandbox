class UrlMappings {
    static mappings = {
      "/"(view:'/index')
      "400"(view:'/errors/badRequest')
      "404"(view:'/errors/notFound')
      "409"(view:'/errors/conflict')
	  "500"(view:'/errors/error')
	}
}

class DocumentUrlMappings {
    static mappings = {
      "/documents"(controller:'document', action:'list')
      "/documents/$id"(controller:'document', action:[GET:'show', PUT:'createOrUpdate', DELETE:'delete'])
      // TODO 400
      // TODO 409
	}
}

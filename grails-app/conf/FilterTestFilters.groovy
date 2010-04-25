class FilterTestFilters {
	def filters = {
        filterOne(uri:'/filterTest/target') {
            before = {
            	if(!params.one) {
                    redirect(uri:'/filterTest/detourOne')
                    return false
            	}
            	true
            }
        }
        filterTwo(uri:'/filterTest/target') {
            before = {
            	if(!params.two) {
                    redirect(uri:'/filterTest/detourTwo')
                    return false
            	}
            	true
            }
        }
        filterThree(uri:'/filterTest/target') {
            before = {
            	if(!params.three) {
            		flash.message = 'filterTest.filterThree.failure'
                    response.sendError 403
                    return false
            	}
            	true
            }
        }
    }
}

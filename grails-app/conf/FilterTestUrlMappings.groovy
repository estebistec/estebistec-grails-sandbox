class FilterTestUrlMappings {
    static mappings = {
        "/filterTest/target"(controller:'filterTest', action:'index')
        "/filterTest/detourOne"(view:'/filterTest/detourOne')
        "/filterTest/detourTwo"(view:'/filterTest/detourTwo')
  	}
}

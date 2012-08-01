
eventWarStart = { msg ->
    Ant.jar(destfile:"${stagingDir}/WEB-INF/lib/kello.jar") { 
        fileset(dir:"${stagingDir}/WEB-INF/classes") { 
            include(name:"**/**")
            exclude(name:"kello-config.properties")
            exclude(name:"log4j.properties")
        }
    }
    Ant.delete(includeemptydirs:"true") {
        fileset(dir:"${stagingDir}/WEB-INF/classes") {
            include(name:"**/**")
            exclude(name:"kello-config.properties")
            exclude(name:"log4j.properties")
        }
    }
}
import org.codehaus.groovy.grails.commons.GrailsClassUtils as GCU

grailsHome = Ant.project.properties."environment.GRAILS_HOME"

includeTargets << grailsScript ( "Init" )

target('default': "The description of the script goes here!") {
    doStuff()
}

target(doStuff: "The implementation task") {

}
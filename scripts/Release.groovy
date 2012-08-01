/**
 * Gant script that packages a Grails application with source
 *
 * @author rain
 *
 * @since 0.6
 */

import org.codehaus.groovy.grails.commons.GrailsClassUtils as GCU
import groovy.text.SimpleTemplateEngine
import org.springframework.core.io.support.PathMatchingResourcePatternResolver
import org.springframework.core.io.*
import org.codehaus.groovy.grails.plugins.*
import org.codehaus.groovy.grails.commons.*
import org.codehaus.groovy.grails.commons.cfg.*
import org.codehaus.groovy.control.*
import org.springframework.util.Log4jConfigurer
import grails.util.*


Ant.property(environment:"env")
grailsHome = Ant.antProject.properties."env.GRAILS_HOME"

includeTargets << grailsScript ( "Clean" )
includeTargets << grailsScript ( "War" )

target ('default':'''Creates a ZIP archive for Grails binarary files.

Examples:
grails release
''') {
    depends( war )

	release()
}

generateLog4jFile = true

srcName = null

target (release: "The implementation target") {

	try {
        configureFileName()


        Ant.mkdir(dir:tempDir)

		Ant.copy(todir:tempDir, overwrite:true) {
			fileset(dir:"${basedir}") {
				include(name:"*.war")
				include(name:"readme.txt")
				include(name:"install.txt")
			}
		}
		
		Ant.mkdir(dir:"${tempDir}/database")
		Ant.copy(todir:"${tempDir}/database", overwrite:true) {
			fileset(dir:"${basedir}/database", includes:"**")
		}

    	event("ReleaseStart", [srcName])
		Ant.zip(destfile:srcName, basedir:tempDir)
    	event("ReleaseEnd", [srcName])
	}
	finally {
		cleanUpAfterSource()
	}
    event("StatusFinal", ["Done creating Release ${srcName}"])
}

target (configureRunningScript:"Sets the currently running script, in case called directly") {
    System.setProperty('current.gant.script',"release")
}

target(cleanUpAfterSource:"Cleans up after performing a Release") {
	Ant.delete(dir:"${tempDir}", failonerror:true)
}

target(configureFileName: "Configuring File name") {
    tempDir = "${basedir}/temp"

    if(config.grails.src.destFile || args) {
        // Pick up the name of the SOURCE to create from the command-line
        // argument or the 'grails.src.destFile' configuration option.
        // The command-line argument takes precedence.
        srcName = args ? args.trim() : config.grails.src.destFile
        // Find out whether SOURCE name is an absolute file path or a
        // relative one.
        def srcFile = new File(srcName)
        if(!srcFile.absolute) {
            // It's a relative path, so adjust it for 'basedir'.
            srcFile = new File(basedir, srcFile.path)
            srcName = srcFile.canonicalPath
        }

        String parentDir = srcFile.parentFile.absolutePath
        tempDir = "${parentDir}/temp"
    }
    else {
        def fileName = grailsAppName
        def version = Ant.antProject.properties.'app.version'
        if(version) {
            version = '-'+version
        }
        else {
            version = ''
        }
        srcName = "${basedir}/${fileName}${version}-bin.zip"
    }
}
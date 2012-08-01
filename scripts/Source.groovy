/**
 * Gant script that packages a Grails application with source
 *
 * @author rain
 *
 * @since 0.3
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
includeTargets << grailsScript ( "Package" )

target ('default':'''Creates a ZIP archive for Grails source files.

Examples:
grails source
''') {
    depends( configureRunningScript, clean)

	source()
}

generateLog4jFile = true

srcName = null

target (source: "The implementation target") {
	depends( configureRunningScript, clean)

	try {
        configureSourceName()


        Ant.mkdir(dir:tempDir)

		Ant.copy(todir:tempDir, overwrite:true) {
			fileset(dir:"${basedir}") {
				include(name:".classpath")
				include(name:".project")
				include(name:"application.properties")
				include(name:"build.xml")
				include(name:"changelog.txt")
				include(name:"install.txt")
				include(name:"kello.launch")
				include(name:"kello.tmproj")
				include(name:"readme.txt")
				include(name:"todo.txt")
			}
		}
		
		Ant.mkdir(dir:"${tempDir}/database")
		Ant.copy(todir:"${tempDir}/database", overwrite:true) {
			fileset(dir:"${basedir}/database", includes:"**")
		}

		Ant.mkdir(dir:"${tempDir}/demo")
		Ant.copy(todir:"${tempDir}/demo", overwrite:true) {
			fileset(dir:"${basedir}/demo", includes:"**") {
				exclude(name:"**/Thumbs.db")
			}
		}

		Ant.mkdir(dir:"${tempDir}/grails-app")
		Ant.copy(todir:"${tempDir}/grails-app", overwrite:true) {
			fileset(dir:"${basedir}/grails-app", includes:"**") {
				exclude(name:"**/Thumbs.db")
			}
		}

		Ant.mkdir(dir:"${tempDir}/lib")
		Ant.copy(todir:"${tempDir}/lib", overwrite:true) {
			fileset(dir:"${basedir}/lib", includes:"**")
		}

		Ant.mkdir(dir:"${tempDir}/plugins")
		Ant.copy(todir:"${tempDir}/plugins", overwrite:true) {
			fileset(dir:"${basedir}/plugins", includes:"**") {
				exclude(name:"**/Thumbs.db")
			}
		}

		Ant.mkdir(dir:"${tempDir}/scripts")
		Ant.copy(todir:"${tempDir}/scripts", overwrite:true) {
			fileset(dir:"${basedir}/scripts", includes:"**")
		}

		Ant.mkdir(dir:"${tempDir}/src")
		Ant.copy(todir:"${tempDir}/src", overwrite:true) {
			fileset(dir:"${basedir}/src", includes:"**")
		}

		Ant.mkdir(dir:"${tempDir}/test")
		Ant.copy(todir:"${tempDir}/test", overwrite:true) {
			fileset(dir:"${basedir}/test", includes:"**")
		}

		Ant.mkdir(dir:"${tempDir}/web-app")
		Ant.copy(todir:"${tempDir}/web-app", overwrite:true) {
			fileset(dir:"${basedir}/web-app", includes:"**") {
				exclude(name:"**/Thumbs.db")
			}
		}

    	event("SourceStart", [srcName])
		Ant.zip(destfile:srcName, basedir:tempDir)
    	event("SourceEnd", [srcName])
	}
	finally {
		cleanUpAfterSource()
	}
    event("StatusFinal", ["Done creating Source ${srcName}"])
}

target (configureRunningScript:"Sets the currently running script, in case called directly") {
    System.setProperty('current.gant.script',"source")
}

target(cleanUpAfterSource:"Cleans up after performing a Source") {
	Ant.delete(dir:"${tempDir}", failonerror:true)
}

target(configureSourceName: "Configuring Source name") {
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
        srcName = "${basedir}/${fileName}${version}-src.zip"
    }
}
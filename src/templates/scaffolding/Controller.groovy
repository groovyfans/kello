<%=packageName ? "package ${packageName}\n\n" : ''%>class ${className}Controller {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [remove${className}:'POST', save${className}:'POST', update${className}:'POST']

    def ${domainClass.propertyName}s = {
        if(!params.max) params.max = 10
        [ ${propertyName}List: ${className}.list( params ) ]
    }

    def view${className} = {
        def ${propertyName} = ${className}.get( params.id )

        if(!${propertyName}) {
            flash.message = "${domainClass.propertyName}.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "${className} not found with id \${params.id}"
            redirect(action:${domainClass.propertyName}s)
        }
        else { return [ ${propertyName} : ${propertyName} ] }
    }

    def remove${className} = {
        def ${propertyName} = ${className}.get( params.id )
        if(${propertyName}) {
            ${propertyName}.delete()
            flash.message = "${domainClass.propertyName}.deleted"
            flash.args = [params.id]
            flash.defaultMessage = "${className} \${params.id} deleted"
            redirect(action:${domainClass.propertyName}s)
        }
        else {
            flash.message = "${domainClass.propertyName}.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "${className} not found with id \${params.id}"
            redirect(action:${domainClass.propertyName}s)
        }
    }

    def edit${className} = {
        def ${propertyName} = ${className}.get( params.id )

        if(!${propertyName}) {
            flash.message = "${domainClass.propertyName}.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "${className} not found with id \${params.id}"
            redirect(action:${domainClass.propertyName}s)
        }
        else {
            return [ ${propertyName} : ${propertyName} ]
        }
    }

    def update${className} = {
        def ${propertyName} = ${className}.get( params.id )
        if(${propertyName}) {
            ${propertyName}.properties = params
            if(!${propertyName}.hasErrors() && ${propertyName}.save()) {
                flash.message = "${domainClass.propertyName}.updated"
                flash.args = [params.id]
                flash.defaultMessage = "${className} \${params.id} updated"
                redirect(action:view${className},id:${propertyName}.id)
            }
            else {
                render(view:'edit${className}',model:[${propertyName}:${propertyName}])
            }
        }
        else {
            flash.message = "${domainClass.propertyName}.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "${className} not found with id \${params.id}"
            redirect(action:edit${className},id:params.id)
        }
    }

    def add${className} = {
        def ${propertyName} = new ${className}()
        ${propertyName}.properties = params
        return ['${propertyName}':${propertyName}]
    }

    def save${className} = {
        def ${propertyName} = new ${className}(params)
        if(!${propertyName}.hasErrors() && ${propertyName}.save()) {
            flash.message = "${domainClass.propertyName}.created"
            flash.args = ["\${${propertyName}.id}"]
            flash.defaultMessage = "${className} \${${propertyName}.id} created"
            redirect(action:view${className},id:${propertyName}.id)
        }
        else {
            render(view:'add${className}',model:[${propertyName}:${propertyName}])
        }
    }
}
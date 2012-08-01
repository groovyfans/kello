<% import org.codehaus.groovy.grails.orm.hibernate.support.ClosureEventTriggeringInterceptor as Events %>
<%=packageName%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title><g:message code="${domainClass.propertyName}.edit" default="Edit ${className}" /></title>
    </head>
    <body>

		<g:render template="/includes/admin/message"/>
        <g:hasErrors bean="\${${propertyName}}">
            <div class="errors">
                <g:renderErrors bean="\${${propertyName}}" as="list" />
            </div>
        </g:hasErrors>

		<div class="section">
			<div class="sectionHeading"><g:message code="${domainClass.propertyName}.edit" default="Edit ${className}" /></div>
			<div class="sectionContent">
            <g:form method="post" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
                 <input type="hidden" name="id" value="\${${propertyName}?.id}" />
                 <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
                        <%
                            excludedProps = ['version',
                                             'id',
                                               Events.ONLOAD_EVENT,
                                               Events.BEFORE_DELETE_EVENT,
                                               Events.BEFORE_INSERT_EVENT,
                                               Events.BEFORE_UPDATE_EVENT]
                            props = domainClass.properties.findAll { !excludedProps.contains(it.name) }
                            
                            Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                            props.each { p ->
                                cp = domainClass.constrainedProperties[p.name]
                                display = (cp ? cp.display : true)        
                                if(display) { %>
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="${p.name}"><g:message code="${domainClass.propertyName}.${p.name}" default="${p.naturalName}" /></label>
                                </td>
                                <td valign="top" class="value \${hasErrors(bean:${propertyName},field:'${p.name}','errors')}">
                                    ${renderEditor(p)}
                                </td>
                            </tr> 
                        <%  }   } %>
                        </tbody>
				        <tfoot>
					        <tr>
						        <td colspan="2">
                    <span class="button"><g:actionSubmit class="save" value="\${message(code:'update', 'default':'Update')}" action="update${className}" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('\${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="remove${className}" value="\${message(code:'delete', 'default':'Delete')}" /></span>
							    </td>
						    </tr>
				        </tfoot>
                 </table>
            </g:form>
			</div>
        </div>
    </body>
</html>

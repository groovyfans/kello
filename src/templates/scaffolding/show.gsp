<% import org.codehaus.groovy.grails.orm.hibernate.support.ClosureEventTriggeringInterceptor as Events %>
<%=packageName%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title><g:message code="${domainClass.propertyName}.show" default="Show ${className}" /></title>
    </head>
    <body>

		<g:render template="/includes/admin/message"/>

        <div class="section">
			<div class="sectionHeading"><g:message code="${domainClass.propertyName}.show" default="Show ${className}" /></div>
			<div class="sectionContent">
                <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody>
                    <%
                        excludedProps = ['version',
                                           Events.ONLOAD_EVENT,
                                           Events.BEFORE_DELETE_EVENT,
                                           Events.BEFORE_INSERT_EVENT,
                                           Events.BEFORE_UPDATE_EVENT]
                        props = domainClass.properties.findAll { !excludedProps.contains(it.name) }
                        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                        props.each { p -> %>
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="${domainClass.propertyName}.${p.name}" default="${p.naturalName}" /></td>
                            <% if(p.isEnum()) { %>
                            <td valign="top" class="value">\${${propertyName}?.${p.name}?.encodeAsHTML()}</td>
                            <% } else if(p.oneToMany) { %>
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="${p.name[0]}" in="\${${propertyName}.${p.name}}">
                                    <li><g:link controller="${p.referencedDomainClass?.propertyName}" action="view${className}" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            <%  } else if(p.manyToOne || p.oneToOne) { %>
                            <td valign="top" class="value"><g:link controller="${p.referencedDomainClass?.propertyName}" action="view" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></td>
                            <%  } else  { %>
                            <td valign="top" class="value">\${fieldValue(bean:${propertyName}, field:'${p.name}')}</td>
                            <%  } %>
                        </tr>
                    <%  } %>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="\${${propertyName}?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="\${message(code:'edit', 'default':'Edit')}" action="edit${className}" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('\${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="remove${className}" value="\${message(code:'delete', 'default':'Delete')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

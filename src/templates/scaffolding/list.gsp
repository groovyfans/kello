<% import org.codehaus.groovy.grails.orm.hibernate.support.ClosureEventTriggeringInterceptor as Events %>
<%=packageName%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title><g:message code="${domainClass.propertyName}.list" default="${className} List" /></title>
    </head>
    <body>

		<g:render template="/includes/admin/message"/>

		<div class="section">
			<div class="sectionHeading"><g:message code="${domainClass.propertyName}.list" default="${className} List" /></div>
			<div class="sectionContent">
			<table class="defaultTable" summary="${className} List">
				<thead>
					<tr>
					<%
						excludedProps = ['version',
										   Events.ONLOAD_EVENT,
										   Events.BEFORE_DELETE_EVENT,
										   Events.BEFORE_INSERT_EVENT,
										   Events.BEFORE_UPDATE_EVENT]
						
						props = domainClass.properties.findAll { !excludedProps.contains(it.name) && it.type != Set.class }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
						props.eachWithIndex { p,i ->
							if(i < 6) {
								if(p.isAssociation()) { %>
						<th><g:message code="${domainClass.propertyName}.${p.name}" default="${p.naturalName}" /></th>
					<%          } else { %>
						<g:sortableColumn property="${p.name}" titleKey="${domainClass.propertyName}.${p.name}" />
					<%  }   }   } %>
					</tr>
				</thead>
				<tbody>
				<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
					<tr class="\${(i % 2) == 0 ? 'odd' : 'even'}">
					<%  props.eachWithIndex { p,i ->
							if(i == 0) { %>
						<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean:${propertyName}, field:'${p.name}')}</g:link></td>
					<%      } else if(i < 6) { %>
						<td>\${fieldValue(bean:${propertyName}, field:'${p.name}')}</td>
					<%  }   } %>
					</tr>
				</g:each>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="${props.size()}">
						<g:paginate total="\${${className}.count()}" />
						</td>
					</tr>
				</tfoot>
			</table>
            </div>
        </div>
    </body>
</html>

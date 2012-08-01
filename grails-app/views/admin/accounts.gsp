

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="accounts" />
        <title><g:message code="user.list" default="User List" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="user.list" default="User List" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>

		<div class="section">
			<div class="sectionHeading"><g:message code="user.list" default="User List" /></div>
			<div class="sectionContent">
			<table class="defaultTable" summary="User List">
				<thead>
					<tr>

						<g:sortableColumn property="username" titleKey="user.username" />
					
						<th><g:message code="user.userRealName"/></th>

						<th><g:message code="user.role"/></th>
					
						<th><g:message code="user.email"/></th>

						<th><g:message code="user.description"/></th>
					
						<th><g:message code="operation" default="Operation" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

						<td><g:link action="viewAccount" id="${userInstance.id}">${fieldValue(bean:userInstance, field:'username')}</g:link></td>
					
						<td>${fieldValue(bean:userInstance, field:'userRealName')}</td>
					
						<td>
							<k:isSupervisor user="${userInstance}"><g:message code="user.role.supervisor"/></k:isSupervisor>
							<k:isAdmin user="${userInstance}"><g:message code="user.role.admin"/></k:isAdmin>
						</td>

						<td>${fieldValue(bean:userInstance, field:'email')}</td>

						<td>${fieldValue(bean:userInstance, field:'description')}</td>
						
						<td>
							<g:link action="editAccount" id="${userInstance.id}"><g:message code="edit"/></g:link> | 
							<g:link action="removeAccount" id="${userInstance.id}"><g:message code="delete"/></g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
							<div class="paginateButtons">
								<g:paginate total="${User.count()}" />
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
            </div>
        </div>
    </body>
</html>

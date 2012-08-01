

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="messages" />
        <title><g:message code="guestBook.list" default="GuestBook List" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="guestBook.list" default="GuestBook List" /></a>	
		</div>
	
		<g:render template="/includes/admin/message"/>

		<div class="section">
			<div class="sectionHeading"><g:message code="guestBook.list" default="GuestBook List" /></div>
			<div class="sectionContent">
			<table class="defaultTable" summary="GuestBook List">
				<thead>
					<tr>
										
						<g:sortableColumn property="author" titleKey="guestBook.author" />
					
						<g:sortableColumn property="companyName" titleKey="guestBook.companyName" />

						<g:sortableColumn property="telephone" titleKey="guestBook.telephone" />

						<g:sortableColumn property="createdDate" titleKey="guestBook.createdDate" />

						<g:sortableColumn property="status" titleKey="guestBook.status" />
					
						<th><g:message code="operation" default="Operation" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${guestBookInstanceList}" status="i" var="guestBookInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
										
						<td><g:link action="viewMessage" id="${guestBookInstance.id}">${fieldValue(bean:guestBookInstance, field:'author')}</g:link></td>
					
						<td>${fieldValue(bean:guestBookInstance, field:'companyName')}</td>
										
						<td>${fieldValue(bean:guestBookInstance, field:'telephone')}</td>

						<td><g:formatDate format="yyyy-MM-dd HH:mm" date="${guestBookInstance.createdDate}"/></td>

						<td>${fieldValue(bean:guestBookInstance, field:'status')}</td>

						<td><g:link action="removeMessage" id="${guestBookInstance.id}"><g:message code="delete"/></g:link></td>
					
					</tr>
				</g:each>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
							<div class="paginateButtons">
								<g:paginate total="${GuestBook.count()}" />
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
            </div>
        </div>
    </body>
</html>

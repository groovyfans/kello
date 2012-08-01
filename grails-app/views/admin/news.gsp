

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="news" />
        <title><g:message code="news.list" default="News List" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="news.list" default="News List" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>

		<div class="section">
			<div class="sectionHeading"><g:message code="news.list" default="News List" /></div>
			<div class="sectionContent">
			<table class="defaultTable" summary="News List">
				<thead>
					<tr>
										
						<g:sortableColumn property="title" titleKey="news.title" />
					
						<g:sortableColumn property="createdByUserLogin" titleKey="news.createdByUserLogin" />
					
						<g:sortableColumn property="createdDate" titleKey="news.createdDate" />
					
						<th><g:message code="operation" default="Operation" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${newsInstanceList}" status="i" var="newsInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					
						<td><g:link action="viewNews" id="${newsInstance.id}">${fieldValue(bean:newsInstance, field:'title')}</g:link></td>
					
						<td>${fieldValue(bean:newsInstance, field:'createdByUserLogin')}</td>
					
						<td><g:formatDate format="yyyy-MM-dd HH:mm" date="${newsInstance.createdDate}"/></td>
					
						<td><g:link action="removeNews" id="${newsInstance.id}"><g:message code="delete"/></g:link></td>
					
					</tr>
				</g:each>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
							<div class="paginateButtons">
								<g:paginate total="${News.count()}" />
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
            </div>
        </div>
    </body>
</html>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="categories" />
        <title><g:message code="productCategory.list" default="ProductCategory List" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="productCategory.list" default="ProductCategory List" /></a>	
		</div>
	
		<g:render template="/includes/admin/message"/>

		<div class="section">
			<div class="sectionHeading"><g:message code="productCategory.list" default="ProductCategory List" /></div>
			<div class="sectionContent">
			<table class="defaultTable" summary="ProductCategory List">
				<thead>
					<tr>
					
						<g:sortableColumn property="name" titleKey="productCategory.name" />
					
						<g:sortableColumn property="description" titleKey="productCategory.description" />

						<th><g:message code="operation" default="Operation" /></th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${productCategoryInstanceList}" status="i" var="productCategoryInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
	
						<td width="30%"><g:link action="viewCategory" id="${productCategoryInstance.id}">${fieldValue(bean:productCategoryInstance, field:'name')}</g:link></td>
					
						<td width="69%">${fieldValue(bean:productCategoryInstance, field:'description')}</td>

						<td width="1%" nowrap="nowrap">
						<g:link action="editCategory" id="${productCategoryInstance.id}"><g:message code="edit"/></g:link> | 
						<g:link action="removeCategory" id="${productCategoryInstance.id}"><g:message code="delete"/></g:link></td>
					</tr>
				</g:each>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4">
							<div class="paginateButtons">
								<g:paginate total="${ProductCategory.count()}" />
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
            </div>
        </div>
    </body>
</html>

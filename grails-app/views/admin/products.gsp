

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="products" />
        <title><g:message code="product.list" default="Product List" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="product.list" default="Product List" /></a>
		</div>

		<g:render template="/includes/admin/message"/>

		<div class="section">
			<div class="sectionHeading"><g:message code="product.list" default="Product List" /></div>
			<div class="sectionContent">
			<table class="defaultTable" summary="Product List">
				<thead>
					<tr>

						<g:sortableColumn property="model" titleKey="product.model" />

						<g:sortableColumn property="name" titleKey="product.name" />

						<th><g:message code="product.description" default="Description" /></th>

						<g:sortableColumn property="createdDate" titleKey="product.createdDate" />

						<th><g:message code="operation" default="Operation" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${productInstanceList}" status="i" var="productInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

						<td width="15%" nowrap="nowrap"><g:link action="viewProduct" id="${productInstance.id}">${fieldValue(bean:productInstance, field:'model')}</g:link></td>

						<td width="15%">${fieldValue(bean:productInstance, field:'name')}</td>

						<td width="55%">${fieldValue(bean:productInstance, field:'description')}</td>

						<td width="14%" nowrap="nowrap"><g:formatDate format="yyyy-MM-dd HH:mm" date="${productInstance.createdDate}"/></td>

						<td width="1%" nowrap="nowrap"><g:link action="editProduct" id="${productInstance.id}"><g:message code="edit"/></g:link> | 
						<g:link action="removeProduct" id="${productInstance.id}"><g:message code="delete"/></g:link></td>
					</tr>
				</g:each>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							<div class="paginateButtons">
								<g:paginate total="${Product.count()}" />
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
            </div>
        </div>
    </body>
</html>

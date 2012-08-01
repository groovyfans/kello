

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <meta name="page" content="order" />
        <title><g:message code="order.list" default="Order List" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="order.list" default="Order List" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>

		<div class="section">
			<div class="sectionHeading"><g:message code="order.list" default="Order List" /></div>
			<div class="sectionContent">
			<table class="defaultTable" summary="Order List">
				<thead>
					<tr>
					
						<g:sortableColumn property="customer" titleKey="order.customer" />
					
						<g:sortableColumn property="productName" titleKey="order.productName" />
					
						<th><g:message code="order.quantity" default="Quantity" /></th>
					
						<g:sortableColumn property="companyName" titleKey="order.companyName" />
					
						<g:sortableColumn property="status" titleKey="order.status" />
					
						<th><g:message code="operation" default="Operation" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${orderInstanceList}" status="i" var="orderInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					
						<td><g:link action="viewOrder" id="${orderInstance.id}">${fieldValue(bean:orderInstance, field:'customer')}</g:link></td>
					
						<td>${fieldValue(bean:orderInstance, field:'productName')}</td>
					
						<td>${fieldValue(bean:orderInstance, field:'quantity')}</td>
					
						<td>${fieldValue(bean:orderInstance, field:'companyName')}</td>
					
						<td><g:message code="order.status.${fieldValue(bean:orderInstance, field:'status')}" default="${fieldValue(bean:orderInstance, field:'status')}"/></td>
					
						<td><g:link action="removeOrder" id="${orderInstance.id}"><g:message code="delete"/></g:link></td>
					
					</tr>
				</g:each>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
							<div class="paginateButtons">
								<g:paginate total="${Order.count()}" />
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
            </div>
        </div>
    </body>
</html>

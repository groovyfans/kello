

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="orders" />
        <title><g:message code="order.show" default="Show Order" /></title>
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="order.show" default="Show Order" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>

        <div class="section">
			<div class="sectionHeading"><g:message code="order.show" default="Show Order" /></div>
			<div class="sectionContent">
                <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.status" default="Status" /></td>
                            
                            <td valign="top" class="value"><g:message code="order.status.${fieldValue(bean:orderInstance, field:'status')}" default="${fieldValue(bean:orderInstance, field:'status')}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.productName" default="Product Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'productName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.quantity" default="Quantity" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'quantity')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.customer" default="Customer" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'customer')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.companyName" default="Company Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'companyName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.address" default="Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'address')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.telephone" default="Telephone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'telephone')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.email" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'email')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.fax" default="Fax" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'fax')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.postalCode" default="Postal Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'postalCode')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.orderDate" default="Order Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd HH:mm" date="${orderInstance.orderDate}"/></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.entryDate" default="Entry Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="yyyy-MM-dd HH:mm" date="${orderInstance.entryDate}"/></td>
                            
                        </tr>
                                        
                        <tr class="prop">
                            <td valign="top" class="label"><g:message code="order.handleUser" default="Handle User" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean:orderInstance, field:'handleUser')}</td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${orderInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="${message(code:'handle', 'default':'Handle')}" action="handleOrder" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('${message(code:'delete.confirm', 'default':'Are you sure?')}');" action="removeOrder" value="${message(code:'delete', 'default':'Delete')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>

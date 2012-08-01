

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
		<meta name="page" content="addOrders" />
        <title><g:message code="order.create" default="Create Order" /></title>         
    </head>
    <body>
		<div class="breadcrumbs">
			<g:message code="current" default="Current: " />
			<g:link action="index"><g:message code="home" default="Home" /></g:link> &raquo;&nbsp;&nbsp;
			<a href="#"><g:message code="order.create" default="Create Order" /></a>	
		</div>

		<g:render template="/includes/admin/message"/>
        <g:hasErrors bean="${orderInstance}">
            <div class="errors">
                <g:renderErrors bean="${orderInstance}" as="list" />
            </div>
        </g:hasErrors>
		<div class="section">
			<div class="sectionHeading"><g:message code="order.create" default="Create Order" /></div>
			<div class="sectionContent">
            <g:form action="saveOrder" method="post" >
                    <table class="defaultForm" cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="productName"><g:message code="order.productName" default="Product Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'productName','errors')}">
                                    <textarea rows="5" cols="40" name="productName">${fieldValue(bean:orderInstance, field:'productName')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="quantity"><g:message code="order.quantity" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'quantity','errors')}">
                                    <input type="text" id="quantity" name="quantity" value="${fieldValue(bean:orderInstance,field:'quantity')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="companyName"><g:message code="order.companyName" default="Company Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'companyName','errors')}">
                                    <textarea rows="5" cols="40" name="companyName">${fieldValue(bean:orderInstance, field:'companyName')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="address"><g:message code="order.address" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'address','errors')}">
                                    <textarea rows="5" cols="40" name="address">${fieldValue(bean:orderInstance, field:'address')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="telephone"><g:message code="order.telephone" default="Telephone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'telephone','errors')}">
                                    <input type="text" maxlength="50" id="telephone" name="telephone" value="${fieldValue(bean:orderInstance,field:'telephone')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="email"><g:message code="order.email" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'email','errors')}">
                                    <input type="text" maxlength="100" id="email" name="email" value="${fieldValue(bean:orderInstance,field:'email')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="customer"><g:message code="order.customer" default="Customer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'customer','errors')}">
                                    <textarea rows="5" cols="40" name="customer">${fieldValue(bean:orderInstance, field:'customer')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="entryDate"><g:message code="order.entryDate" default="Entry Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'entryDate','errors')}">
                                    <g:datePicker name="entryDate" value="${orderInstance?.entryDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="fax"><g:message code="order.fax" default="Fax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'fax','errors')}">
                                    <input type="text" id="fax" name="fax" value="${fieldValue(bean:orderInstance,field:'fax')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="orderDate"><g:message code="order.orderDate" default="Order Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'orderDate','errors')}">
                                    <g:datePicker name="orderDate" value="${orderInstance?.orderDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="postalCode"><g:message code="order.postalCode" default="Postal Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'postalCode','errors')}">
                                    <input type="text" id="postalCode" name="postalCode" value="${fieldValue(bean:orderInstance,field:'postalCode')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="label">
                                    <label for="status"><g:message code="order.status" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:orderInstance,field:'status','errors')}">
                                    <input type="text" id="status" name="status" value="${fieldValue(bean:orderInstance,field:'status')}"/>
                                </td>
                            </tr>
                        
                        </tbody>
				        <tfoot>
					        <tr>
						        <td colspan="2">
                    <span class="button"><input class="save" type="submit" value="${message(code:'create', 'default':'Create')}" /></span>
							    </td>
						    </tr>
				        </tfoot>
                    </table>
            </g:form>
			</div>
		</div>
    </body>
</html>
